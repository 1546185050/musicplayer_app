import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:musicplayer_app/models/leaderboardDetailModel.dart';
import 'package:musicplayer_app/models/musicplayingModel.dart';
import 'package:musicplayer_app/netRequest/httpRequestActions.dart';
import 'albumCover.dart' show AlbumCover;
import 'package:musicplayer_app/page/utils.dart';

AudioPlayer audioPlayer = new AudioPlayer();

List storeMusicList = [];
String storeUrl = '';
bool storeIsPlaying = false;

class MusicPlayerPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final DeatilTracks _args = ModalRoute.of(context).settings.arguments;
    return _MusicPlayerView(_args);
  }
}

class _MusicPlayerView extends StatefulWidget {

  _MusicPlayerView(this.music) : assert(music != null);

  final DeatilTracks music;

  @override
  State<StatefulWidget> createState() => _MusicPlayerViewState();
}

class _MusicPlayerViewState extends State<_MusicPlayerView> {
  // init state
  DeatilTracks _music;
  bool _isPlaying = storeIsPlaying;
  bool _isFavorited = false;
  int _currentPosition = 0; // 毫秒

  Future future;

  MusicplayingData playingData;

  var _positionSubscription;
  var _audioPlayerStateSubscription;
  bool _isForbidden = false; // 🚫 操作限制

  @override
  void initState() {
    super.initState();

    //
    audioPlayer.onAudioPositionChanged.listen(onAudioPositionChanged);
    audioPlayer.onPlayerStateChanged
        .listen(onPlayerStateChanged, onError: onPlayerStateChangedError);

    _music = widget.music;

    if (_music.id != null) {
      //播放选择传来的音乐
      _setMusicAndUrl(widget.music);
      return;
    }
    if (_music.id == null && _music.id == 0) {
      // 默认播放列表第一首
      _setMusicAndUrl(storeMusicList[0]);
      return;
    }
  }

  onAudioPositionChanged(Duration position) {
    if (!_isForbidden) {
      setState(() => _currentPosition = position.inMilliseconds);
    }
  }

  Future onPlayerStateChanged(status) async {
    print('status');
    print(status);

    if (status == AudioPlayerState.PLAYING) {
      // setState(() {
      //   _isPlaying = true
      // });
    } else if (status == AudioPlayerState.COMPLETED) {
      await _next();
    }
  }

  onPlayerStateChangedError(msg) {
    print(msg);
    // setState(() {
    //   playerState = PlayerState.stopped;
    //   duration = new Duration(seconds: 0);
    //   position = new Duration(seconds: 0);
    // });
  }

  @override
  void dispose() {
    super.dispose();
    _isForbidden = true;
    storeIsPlaying = _isPlaying;
  }

  Future fetchMusic(id) async {
    HttpRequestActions.getMusicUrlData((Map<String, dynamic> result) async {
      MusicplayingModel m = MusicplayingModel.fromJson(result);
//      setState(() {
      storeUrl = m.data.first.url;
      if (storeUrl == null) {
        _next();
        return;
      }

      if (audioPlayer.state == AudioPlayerState.PLAYING) {
        await audioPlayer.stop();
      }
      await _play();
//      });
    }, queryParameters: {"id": id});
  }

  Future<void> _setMusicAndUrl(m) async {
    _music = m;
    setState(() {
      _currentPosition = 0;
      _music = m;
    });
    String response = await fetchMusic(_music.id);
//    storeUrl = response;
//    if (storeUrl == null) {
//      _next();
//      return;
//    }
//    if (audioPlayer.state == AudioPlayerState.PLAYING) {
//      await audioPlayer.stop();
//    }
//    await _play();
  }

  void _togglePlay() {
    if (_isPlaying) {
      _pause();
    } else {
      _play();
    }
  }

  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Ar> artists = _music.ar;// _music['ar'];
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Column(
            children: <Widget>[
              Center(
                child: Text(
                  _music.name,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Center(
                child: Text(
                  artists.map((artist) => artist.name).join('/') +
                      ' - ' ,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
          padding: EdgeInsets.fromLTRB(0, 10, 0, 8),
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.share), onPressed: _share),
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(child: AlbumCover(music: _music, isPlaying: _isPlaying)),
            Container(
              child: Row(
                children: <Widget>[
                  IconButton(
                    color: _isFavorited ? Colors.red : Colors.white,
                    icon: Icon(
                        _isFavorited ? Icons.favorite : Icons.favorite_border),
                    onPressed: _toggleFavorite,
                  ),
                  IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.save_alt),
                    onPressed: _share,
                  ),
                  IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.chat),
                    onPressed: _share,
                  ),
                  IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.reorder),
                    onPressed: _share,
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
            ),

            _buildTimeline(
                total: _music.dt,
                current: _currentPosition,
                onChanged: _sliderChange),
            // player menu
            Container(
              child: Row(
                children: <Widget>[
                  IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.loop),
                    onPressed: _share,
                  ),
                  IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.skip_previous),
                    onPressed: _previous,
                  ),
                  IconButton(
                    color: Colors.white,
                    icon: Icon(_isPlaying
                        ? Icons.pause_circle_outline
                        : Icons.play_circle_outline),
                    onPressed: _togglePlay,
                    iconSize: 72,
                  ),
                  IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.skip_next),
                    onPressed: _next,
                  ),
                  IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.queue_music),
                    onPressed: _share,
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
            ),
          ],
        ),
        color: Colors.black54,
      ),
    );
  }

  Future<void> _play() async {
    await audioPlayer.play(storeUrl);
    _isForbidden = false;
    if (!_isForbidden) {
      setState(() => _isPlaying = true);
    }
  }

  Future<void> _pause() async {
    await audioPlayer.pause();
    setState(() => _isPlaying = false);
  }

  Future<void> _previous() async {
    _isForbidden = true;
    int index = storeMusicList.indexWhere((m) => m['id'] == _music.id);
    if (index == -1) {
      await _setMusicAndUrl(storeMusicList[0]);
    } else if (index == 0) {
      await _setMusicAndUrl(storeMusicList[storeMusicList.length - 1]);
    } else {
      await _setMusicAndUrl(storeMusicList[index - 1]);
    }
  }

  Future<void> _next() async {
    _isForbidden = true;
    int index = storeMusicList.indexWhere((m) => m['id'] == _music.id);
    if (index == -1 || index >= storeMusicList.length - 1) {
      await _setMusicAndUrl(storeMusicList[0]);
    } else {
      await _setMusicAndUrl(storeMusicList[index + 1]);
    }
  }

  _sliderChange(newRating) {
    setState(() => _currentPosition = (newRating * _music.dt).toInt());
  }

  void _share() {}

  void _goSingerPage() {}

  void _toggleShowLyric() {
    print('切换歌词');
  }

  Widget _buildTimeline({int current: 0, int total: 0, Function onChanged}) {
    final _styleFont = new TextStyle(fontSize: 10, color: Colors.white);
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            child: Text(
              formatTime(current ~/ 1000),
              style: _styleFont,
            ),
            width: 35,
            alignment: Alignment.centerRight,
          ),
          Expanded(
            child: Slider(
              min: 0.0,
              max: 1.0,
              value: current / total,
              onChanged: onChanged,
              activeColor: Colors.white,
              inactiveColor: Colors.grey,
              label: 'sdls',
              onChangeStart: (_) => _isForbidden = true,
              onChangeEnd: (double rate) {
                audioPlayer.seek(Duration(seconds: total * rate ~/ 1000));
                _isForbidden = false;
              },
            ),
          ),
          Container(
            child: Text(
              formatTime(total ~/ 1000),
              style: _styleFont,
            ),
            width: 35,
            alignment: Alignment.centerLeft,
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 12),
    );
  }
}
