import 'package:flutter/material.dart';

class SecondTabPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('助眠'),),   //将参数当作页面标题
      body: new Center(
        child: new Text('助眠'),
      ),
      backgroundColor: Colors.white,
    );
  }
}