import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:musicplayer_app/models/bannerModel.dart';
import 'package:musicplayer_app/netRequest/httpRequestActions.dart';
import 'package:musicplayer_app/models/personalizedModel.dart';
import 'package:musicplayer_app/page/leaderboardPage.dart';

class FirstTabPage extends StatefulWidget {
  @override
  createState() => new SwiperPageState();
}

class SwiperPageState extends State<FirstTabPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('XMusic'),
      ),
      body: ListView(
        children: <Widget>[
          _BannerSwiperView(),
          _NavigationItems(),
          _HorizontalHeader("推荐歌单", () {}),
          __RecommendMusicPlaylist(),
        ],
      ),
    );
  }
}

class _BannerSwiperView extends StatefulWidget {
  @override
  _SwiperViewState createState() => _SwiperViewState();
}

class _SwiperViewState extends State<_BannerSwiperView> {
  List<Widget> imageList = [
    Image.asset("assets/banner_1.jpg")
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    HttpRequestActions.getIphoneBannertData((Map<String, dynamic> result) {
      BannersModel b = BannersModel.fromJson(result);
      imageList = b.banners.map((item){
        return CachedNetworkImage(
          imageUrl: item.pic,
          height: 200,
          fit: BoxFit.fill
        );
      }).toList();

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: 180.0,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Swiper(
            itemBuilder: _swiperBuilder,
            itemCount: imageList.isEmpty ? 0 : imageList.length,
            pagination: new SwiperPagination(
                builder: DotSwiperPaginationBuilder(
                  color: Colors.lightBlue,
                  activeColor: Colors.white,
                )),
            control: new SwiperControl(),
            scrollDirection: Axis.horizontal,
            autoplay: true,
          )),
    );
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    return (imageList[index]);
  }
}

class _HorizontalHeader extends StatelessWidget {
  final String titleText;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 7.5, bottom: 7.5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(left: 8)),
          Text(
            titleText,
            style: Theme.of(context)
                .textTheme
                .subhead
                .copyWith(fontWeight: FontWeight.w800),
          ),
          Icon(Icons.chevron_right),
        ],
      ),
    );
  }

  _HorizontalHeader(this.titleText, this.onTap);
}

class _NavigationItem extends StatelessWidget {
  final IconData icon;

  final String text;

  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            children: <Widget>[
              Material(
                shape: CircleBorder(),
                elevation: 5,
                child: ClipOval(
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Theme.of(context).primaryColor,
                    child: Icon(
                      icon,
                      color: Theme.of(context).primaryIconTheme.color,
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 8)),
              Text(text),
            ],
          ),
        ));
  }

  _NavigationItem(this.icon, this.text, this.onTap);
}

class _NavigationItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _NavigationItem(Icons.group, "歌手", () {}),
          _NavigationItem(Icons.equalizer, "排行榜", () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return LeaderboardPage();
            }));
          }),
          _NavigationItem(Icons.featured_play_list, "分类", () {}),
          _NavigationItem(Icons.mic, "K歌", () {}),
        ],
      ),
    );
  }
}

class __RecommendMusicPlaylist extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return __RecommendMusicPlaylistState();
  }
}

class __RecommendMusicPlaylistState extends State<__RecommendMusicPlaylist> {
  Future future;
  List<PersonalizedResult> data = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    future =
        HttpRequestActions.getRecommendListData((Map<String, dynamic> result) {
      PersonalizedModel p = PersonalizedModel.fromJson(result);

      setState(() {
        data.addAll(p.result);
      });
    });
  }

  List<Container> getItemContainer(
      BuildContext context, List<PersonalizedResult> playlist) {
    return new List.generate(
        playlist.length,
        (int index) => new Container(
              child: Column(
                children: <Widget>[
                  Material(
                      shape: new RoundedRectangleBorder(
                        side:
                            const BorderSide(width: 1.0, color: Colors.black12),
                        borderRadius: new BorderRadius.circular(5.0),
                      ),
                      elevation: 5,
                      child: new ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          width: (MediaQuery.of(context).size.width - 40)/3,
                          height: 90,
                          color: Colors.black12,
                          child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              placeholder: (context, url) =>
                                  new CircularProgressIndicator(
                                    valueColor:
                                        AlwaysStoppedAnimation(Colors.black12),
                                  ),
                              imageUrl: playlist[index].picUrl),
                        ),
                      )),
                  Padding(padding: EdgeInsets.only(top: 5)),
                  Text(
                    playlist[index].name,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    maxLines: 2,
                    style: new TextStyle(
                      fontSize: 12
                    ),
                  ),
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new FutureBuilder(
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Center(child: Text("加载中"));
          case ConnectionState.done:
            return GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              padding: const EdgeInsets.all(5.0),
              //主轴间隔
              mainAxisSpacing: 5.0,
              //横轴间隔
              crossAxisSpacing: 5.0,
              childAspectRatio: 8/9,
              children: getItemContainer(context, this.data),
            );
        }
        return null;
      },
      future: future,
    );
  }
}
