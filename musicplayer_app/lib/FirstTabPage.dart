import 'package:flutter/material.dart';

class FirstTabPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('XMusic'),),   //将参数当作页面标题
      body: new Center(
        child: new Text('XMusic'),
      ),
      backgroundColor: Colors.white,
    );
  }
}