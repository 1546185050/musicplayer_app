
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:musicplayer_app/models/sleep_light_music_list_model_entity.dart';
import 'package:musicplayer_app/netRequest/httpRequestActions.dart';

var title = "轻音乐";

class SleepLightMusicPage extends StatefulWidget{

  SleepLightMusicPage({Key key}) : super(key : key);

  @override
  State<StatefulWidget> createState() => new _SleepLightMusicPage();
}

class _SleepLightMusicPage extends State<SleepLightMusicPage> with SingleTickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ListView(
        children: <Widget>[
          //todo:此处放gif动图
          Image.asset(
            "assets/banner_3.jpg",
            width: MediaQuery.of(context).size.width,
            height: 200.0,
            fit: BoxFit.cover,
          ),
          _LightMusiclist(),
        ],
      ),
    );
  }

}

class _LightMusiclist extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LightMusiclistState();
  }
}


class _LightMusiclistState extends State<_LightMusiclist> {

  List<SleepLightMusicListModelPlaylist> data = [];
  Future future;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    future =
        HttpRequestActions.getCatListData((Map<String, dynamic> result) {
          SleepLightMusicListModelEntity value = SleepLightMusicListModelEntity.fromJson(result);

          setState(() {
            data.addAll(value.playlists);
          });
        });
  }

  List<Container> getItemContainer(BuildContext context, List<SleepLightMusicListModelPlaylist> lightlist) {
    return new List.generate(
        lightlist.length, (int index) => new Container(
          child: Column(
            children: <Widget>[
              Material(
                  shape: new RoundedRectangleBorder(
                    side: const BorderSide(
                        width: 2.0,
                        color: Colors.black12
                    ),
                    borderRadius: new BorderRadius.circular(50.0),
                  ),
                  elevation: 5,
                  child: new ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      width: 80,
                      height: 80,
                      color: Theme.of(context).primaryColor,
                      child: CachedNetworkImage(
                          placeholder: (context, url) =>
                          new CircularProgressIndicator(
                            valueColor:
                            AlwaysStoppedAnimation(Colors.black12),
                          ),
                          imageUrl: lightlist[index].coverImgUrl),
                    ),
                    ),
                  ),
              Padding(padding: EdgeInsets.only(top: 5)),
              Text(
                lightlist[index].name,
                textAlign: TextAlign.center,
                softWrap: true,
                maxLines: 2,
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      padding: const EdgeInsets.all(2.0),
      //主轴间隔
      mainAxisSpacing: 3.0,
      //横轴间隔
      crossAxisSpacing: 3.0,
      children: getItemContainer(context, this.data),
    );
  }
}
