
import 'package:flutter/material.dart';

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
            width: 600.0,
            height: 240.0,
            fit: BoxFit.cover,
          ),
         GridView.custom(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 20.0,
          ),
          childrenDelegate: SliverChildBuilderDelegate((context,position){
            return getItemContainer(datas[position]);
          }, childCount: datas.length
          )
         ),
        ],
      ),
    );
  }

}