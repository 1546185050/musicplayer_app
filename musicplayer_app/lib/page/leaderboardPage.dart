import 'package:flutter/material.dart';
import 'package:musicplayer_app/models/leaderboardModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:musicplayer_app/page/playlistDetailPage.dart';
import 'package:musicplayer_app/netRequest/httpRequestActions.dart';

class LeaderboardPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LeaderboardPageState();
  }
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  static const int INDEX_OFFICIAL = 0;

  static const int INDEX_RECOMMEND = 4;

  List<BoardListitem> data = [];

  Future future;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    future = HttpRequestActions.getLeaderboardListData(
        (Map<String, dynamic> result) {
      LeaderboardModel l = LeaderboardModel.fromJson(result);

      setState(() {
        data.addAll(l.list);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('排行榜'),
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(child: Text("加载中"));
            case ConnectionState.done:
              List<Widget> widgets = [];
              widgets.add(_boardItemTitle("官方榜"));
              for (var i = 0; i < INDEX_RECOMMEND; i++) {
                widgets.add(_OfficialLeaderboard(data[i]));
              }
              widgets.add(_boardItemTitle("推荐榜"));
              widgets.add(GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  shrinkWrap: true,
                  itemCount: data.length - INDEX_RECOMMEND,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 10 / 13.5,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 8),
                  itemBuilder: (context, int i) {
                    return _recommendLeaderBoard(data[i + INDEX_RECOMMEND]);
                  }));
              return ListView(
                children: widgets,
              );
          }
          return null;
        },
        future: future,
      ),
    );
  }
}

class _boardItemTitle extends StatelessWidget {
  _boardItemTitle(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8, left: 16, bottom: 4),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .subhead
            .copyWith(fontWeight: FontWeight.w800),
      ),
    );
  }
}

class _recommendLeaderBoard extends StatelessWidget {
  _recommendLeaderBoard(this.row);

  final BoardListitem row;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return PlaylistDetailPage(row.id);
        }));
      },
      child: Container(
        height: 130,
        width: 140,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(3),
                child: Stack(
                  children: <Widget>[
                    CachedNetworkImage(
                        placeholder: (context, url) =>
                            new CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation(Colors.black12),
                            ),
                        imageUrl: row.coverImgUrl),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 24,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: const [
                              Colors.transparent,
                              Colors.black45
                            ])),
                        child: Row(
                          children: <Widget>[
                            Spacer(),
                            Text(
                              row.updateFrequency,
                              style: Theme.of(context).primaryTextTheme.caption,
                              textAlign: TextAlign.left,
                            ),
                            Padding(padding: EdgeInsets.only(right: 4))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Text(
              row.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class _OfficialLeaderboard extends StatelessWidget {
  _OfficialLeaderboard(this.row);

  final BoardListitem row;

  List<Widget> textWidgets = [];

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < 3; i++) {
      textWidgets.add(Spacer());
      textWidgets.add(
        Text(
          (i+1).toString() +
              "." +
              row.tracks[i].first +
              " - " +
              row.tracks[i].second,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      );
    }

    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return PlaylistDetailPage(row.id);
        }));
      },
      child: Container(
        height: 130,
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Row(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(3),
                child: Stack(
                  children: <Widget>[
                    CachedNetworkImage(
                        placeholder: (context, url) =>
                            new CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation(Colors.black12),
                            ),
                        imageUrl: row.coverImgUrl),
//                    Image(image: CachedImage(row["coverImgUrl"])),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 24,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: const [
                              Colors.transparent,
                              Colors.black45
                            ])),
                        child: Row(
                          children: <Widget>[
                            Spacer(),
                            Text(
                              row.updateFrequency,
                              style: Theme.of(context).primaryTextTheme.caption,
                              textAlign: TextAlign.left,
                            ),
                            Padding(padding: EdgeInsets.only(right: 4))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 8)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: textWidgets,
              ),
            )
          ],
        ),
      ),
    );
  }
}
