import 'package:flutter/material.dart';

class ThirdTabPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('晚安FM'),),   //将参数当作页面标题
      body: new Center(
        child: new Text('晚安FM'),
      ),
      backgroundColor: Colors.white,
    );
  }
}