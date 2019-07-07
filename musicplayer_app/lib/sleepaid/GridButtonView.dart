
import 'package:flutter/material.dart';

class GridButtonView extends StatefulWidget{

  GridButtonView({Key key}) : super(key : key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }

}

class _GridButtonView extends State<GridButtonView> with SingleTickerProviderStateMixin{

  //-----------------------构造数据-----------------
  List<String> getDataList() {
    List<String> list = [];
    for (int i = 0; i < 100; i++) {
      list.add(i.toString());
    }
    return list;
  }

  List<Widget> getWidgetList() {
    return getDataList().map((item) => getItemContainer(item)).toList();
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

  //----------------------生命周期------------------
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  //----------------------构造view-------------------
  @override
  Widget build(BuildContext context) {

    List<String> datas = getDataList();

    return GridView.custom(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 20.0,
        ),
        childrenDelegate: SliverChildBuilderDelegate((context,position){
          return getItemContainer(datas[position]);
        },
        childCount: datas.length
        )
    );
  }



}