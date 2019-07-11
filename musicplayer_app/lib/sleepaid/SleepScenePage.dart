
import 'package:flutter/material.dart';

var title = "场景";

class SleepScenePage extends StatefulWidget{

  SleepScenePage({Key key}) : super(key : key);

  @override
  State<StatefulWidget> createState() => new _SleepScenePage();
}

class _SleepScenePage extends State<SleepScenePage> with SingleTickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ListView(
        children: <Widget>[
          //todo:此处放gif动图
          Image.asset(
            "assets/banner_2.jpg",
            width: MediaQuery.of(context).size.width,
            height: 160.0,
            fit: BoxFit.cover,
          ),
          _SceneMusiclist(),
        ],
      ),
    );
  }

}

class _SceneMusiclist extends StatelessWidget {
  List<Container> getItemContainer(BuildContext context, int count) {
    return new List.generate(
        count,
            (int index) => new Container(
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
                      width: 50,
                      height: 50,
                      color: Theme.of(context).primaryColor,
                      child: Icon(
                        Icons.queue_music,
                        color: Theme.of(context).primaryIconTheme.color,
                      ),
                    ),
                  )
              ),
              Padding(padding: EdgeInsets.only(top: 5)),
              Text("场景" + index.toString()),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 4,
      padding: const EdgeInsets.all(2.0),
      //主轴间隔
      mainAxisSpacing: 3.0,
      //横轴间隔
      crossAxisSpacing: 3.0,
      children: getItemContainer(context, 12),
    );
  }
}
