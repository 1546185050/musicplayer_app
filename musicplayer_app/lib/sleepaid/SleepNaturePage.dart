
import 'package:flutter/material.dart';

var title = "自然";

class SleepNaturePage extends StatefulWidget{

  SleepNaturePage({Key key}) : super(key : key);

  @override
  State<StatefulWidget> createState() => new _SleepNaturePage();
}

class _SleepNaturePage extends State<SleepNaturePage> with SingleTickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {

//    final gridButtonView = new GridButtonView(0);
    List<String> getDataList() {
      List<String> list = [];
      for (int i = 0; i < 100; i++) {
        list.add(i.toString());
      }
      return list;
    }

    Widget getItemContainer(String item) {
      return Container(
        alignment: Alignment.center,
        child: Text(
          item,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        color: Colors.blue,
      );
    }

    List<String> datas = getDataList();

    return new Scaffold(
//      appBar: AppBar(
//        title: Text("自然"),
//      ),
      body: ListView(
        children: <Widget>[
          //todo:此处放gif动图
          Image.asset(
            "assets/banner_1.jpg",
            width: MediaQuery.of(context).size.width,
            height: 160.0,
            fit: BoxFit.cover,
          ),
          _NatureMusiclist(),
        ],
      ),
    );
  }

}

class _NatureMusiclist extends StatelessWidget {
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
              Text("自然风" + index.toString()),
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
      children: getItemContainer(context, 9),
    );
  }
}
