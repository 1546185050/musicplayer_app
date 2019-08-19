import 'package:flutter/material.dart';
import 'package:musicplayer_app/page/musicplayList.dart';
import 'package:musicplayer_app/models/leaderboardDetailModel.dart';
import 'package:musicplayer_app/netRequest/httpUtil.dart';
import 'package:musicplayer_app/netRequest/httpRequestActions.dart';

class PlaylistDetailPage extends StatefulWidget {
  PlaylistDetailPage(this.playlistId, {this.playlist})
      : assert(playlistId != null);

  final int playlistId;

  final Playlist playlist;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PlayListDetailState();
  }
}

class _PlayListDetailState extends State<PlaylistDetailPage> {
  Future future;

  Playlist playlist;

  Future testGet() async {
    var response = await HttpUtil().get('/top/list?idx=1');
    print(response.toString());

    LeaderboardDeatilModel l = LeaderboardDeatilModel.fromJson(
        (response.data as Map<String, dynamic>));

    setState(() {
      playlist = l.playlist;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    future = HttpRequestActions.getLeaderboardDetailListData(
        (Map<String, dynamic> result) {
      LeaderboardDeatilModel l = LeaderboardDeatilModel.fromJson(result);
      setState(() {
        playlist = l.playlist;
      });
    }, queryParameters: {"idx": "1"});//"1": 云音乐热歌榜,仅做例子
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(child: Text("加载中"));
            case ConnectionState.done:
              return _PlaylistBody(playlist);
          }
          return null;
        },
        future: future,
      ),
    );
  }
}

class _PlaylistBody extends StatefulWidget {
  _PlaylistBody(this.playlist) : assert(playlist != null);

  final Playlist playlist;

  List<DeatilTracks> get musicList => playlist.tracks;

  @override
  _PlaylistBodyState createState() {
    return new _PlaylistBodyState();
  }
}

class _PlaylistBodyState extends State<_PlaylistBody> {
  @override
  Widget build(BuildContext context) {
    return MusicList(
      musics: widget.musicList,
      onMusicTap: MusicList.defaultOnTap,
      leadingBuilder: MusicList.indexedLeadingBuilder,
      trailingBuilder: MusicList.defaultTrailingBuilder,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text("排行榜"),
            elevation: 0,
            pinned: true,
            backgroundColor: Colors.blue,
            expandedHeight: 0,
            bottom: _buildListHeader(context),
            flexibleSpace: new FlexibleSpaceBar(
              background: Image.asset("assets/banner_1.jpg", fit: BoxFit.fill),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => MusicTile(widget.musicList[index]),
                childCount: widget.musicList.length),
          ),
        ],
      ),
    );
  }

  Widget _buildListHeader(BuildContext context) {
    Widget tail;

    return MusicListHeader(widget.musicList.length, tail: tail);
  }
}
