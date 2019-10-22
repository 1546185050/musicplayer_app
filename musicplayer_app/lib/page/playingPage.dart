import 'package:flutter/material.dart';
import 'package:musicplayer_app/models/musicplayingModel.dart';
import 'package:musicplayer_app/netRequest/httpRequestActions.dart';
import 'package:audioplayers/audioplayers.dart';

class PlayingPage extends StatefulWidget {

  PlayingPage(this.playingId) : assert(playingId != null);

  final int playingId;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _PlayingPageState();
  }
}

class _PlayingPageState extends State<PlayingPage> {

  AudioPlayer audioPlayer = AudioPlayer();

  Future future;

  MusicplayingData playingData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    future = HttpRequestActions.getMusicUrlData(
            (Map<String, dynamic> result) {
              MusicplayingModel m = MusicplayingModel.fromJson(result);
          setState(() {
            playingData = m.data.first;
            playMusic();
          });
        }, queryParameters: {"id": widget.playingId});
  }
  
  Future playMusic() async {
    int result = await audioPlayer.play(playingData.url);
    if (result == 1) {
      print('成功播放');
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(title: Text('音乐播放')),
      body: Stack(),
    );
  }
}