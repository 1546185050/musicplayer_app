import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:musicplayer_app/models/MVplayingModel.dart';
import 'package:musicplayer_app/models/leaderboardDetailModel.dart';
import 'package:musicplayer_app/netRequest/httpRequestActions.dart';
import 'package:video_player/video_player.dart';

const String VIDEO_URL = 'https://www.runoob.com/try/demo_source/mov_bbb.mp4';

class MVPlayerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DeatilTracks _args = ModalRoute.of(context).settings.arguments;
    return _MVPlayerView(_args);
  }
}

class _MVPlayerView extends StatefulWidget {
  _MVPlayerView(this.music, {Key key}) : super(key: key);

  final DeatilTracks music;

  __MVPlayerViewState createState() => __MVPlayerViewState();
}

class __MVPlayerViewState extends State<_MVPlayerView> {
  VideoPlayerController _controller;

  Future _playerFuture;

  @override
  void initState() {
    super.initState();

    HttpRequestActions.getMVUrlData(((Map<String, dynamic> result) {
      MVplayingModel m = MVplayingModel.fromJson(result);
      _controller = VideoPlayerController.network(m.data.url);
      _controller.setLooping(true);
      _playerFuture = _controller.initialize().then((_){
        setState(() {

        });
      }

      );


    }), queryParameters: {'id': widget.music.mv});
//    _controller = VideoPlayerController.network(VIDEO_URL);
//    _controller.setLooping(true);
//    _playerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.music.name),
      ),
      body: Column(
        children: <Widget>[
          FutureBuilder(
              future: _playerFuture,
              builder: (context, snapshot) {
                if(_controller != null) {
                  if (_controller.value.initialized && snapshot.connectionState == ConnectionState.done) {
                    return AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    );
                  }
                  else {
                    return Center(child: Text("加载中"));
                  }
                }

                return Center(child: Text("加载中"));
              }),
          SizedBox(height: 30),
          RaisedButton(
            child: Icon(
            _controller != null && _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
            ),
            onPressed: () {
              setState(() {
                if (_controller != null) {
                  if (_controller.value.isPlaying) {
                    _controller.pause();
                  } else {
                    // If the video is paused, play it.
                    _controller.play();
                  }
                }
              });
            },
          )
        ],
      ),

    );
    return Column(
      children: <Widget>[
        FutureBuilder(
          future: _playerFuture,
          builder: (context, snapshot) {
            print(snapshot.connectionState);
            if (snapshot.hasError) print(snapshot.error);
            if (snapshot.connectionState == ConnectionState.done) {
              return AspectRatio(
                // aspectRatio: 16 / 9,
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        SizedBox(height: 30),
        RaisedButton(
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
          onPressed: () {
            setState(() {
              if (_controller.value.isPlaying) {
                _controller.pause();
              } else {
                // If the video is paused, play it.
                _controller.play();
              }
            });
          },
        )
      ],
    );
  }
}
