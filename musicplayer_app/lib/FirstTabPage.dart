import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

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
          _RecommendPlaylist(),
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
    Image.asset("assets/banner_1.jpg"),
    Image.asset("assets/banner_2.jpg"),
    Image.asset("assets/banner_3.jpg"),
    Image.asset("assets/banner_4.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 200.0,
        child: Swiper(
          itemBuilder: _swiperBuilder,
          itemCount: imageList.length,
          pagination: new SwiperPagination(
              builder: DotSwiperPaginationBuilder(
            color: Colors.black54,
            activeColor: Colors.white,
          )),
          control: new SwiperControl(),
          scrollDirection: Axis.horizontal,
          autoplay: true,
        ));
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
          _NavigationItem(Icons.person, "歌手", () {}),
          _NavigationItem(Icons.show_chart, "排行榜", () {}),
          _NavigationItem(Icons.category, "分类", () {}),
          _NavigationItem(Icons.mic, "K歌", () {}),
        ],
      ),
    );
  }
}

class _RecommendPlaylist extends StatelessWidget {
  List<Container> getItemContainer(BuildContext context, int count) {
    return new List.generate(
        count,
        (int index) => new Container(
              child: Column(
                children: <Widget>[
                  Material(
                      shape: new RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 2.0, color: Colors.black12),
                        borderRadius: new BorderRadius.circular(20.0),
                      ),
                      elevation: 5,
                      child: new ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          width: 80,
                          height: 80,
                          color: Theme.of(context).primaryColor,
                          child: Icon(
                            Icons.queue_music,
                            color: Theme.of(context).primaryIconTheme.color,
                          ),
                        ),
                      )
                  ),
                  Padding(padding: EdgeInsets.only(top: 5)),
                  Text("推荐歌单" + index.toString()),
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      padding: const EdgeInsets.all(4.0),
      //主轴间隔
      mainAxisSpacing: 5.0,
      //横轴间隔
      crossAxisSpacing: 5.0,
      children: getItemContainer(context, 9),
    );
  }
}
