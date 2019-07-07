import 'package:flutter/material.dart';
import './SleepNaturePage.dart';

class SleepAidTabPage extends StatefulWidget {

  SleepAidTabPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState()  => _SleepAidTabPage();
}

class _SleepAidTabPage extends State<SleepAidTabPage> with SingleTickerProviderStateMixin{

  //顶部Tab控制器
  TabController _topNavigation;

  //底部导航
  final List<Tab> _topTabs = <Tab>[
    new Tab(text: '自然'),
    new Tab(text: '场景'),
    new Tab(text: '轻音乐'),
    new Tab(text: '专属晚安'),
  ];

  @override
  void initState() {
    _topNavigation = new TabController(
        vsync: this,
        length: _topTabs.length
    );
  }

  @override
  void dispose() {
    _topNavigation.dispose();
    super.dispose();
  }

  @override
  void deactivate() {

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('助眠'),),   //将参数当作页面标题
      backgroundColor: Colors.white,
      body: new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: new TabBar(
              controller: _topNavigation,
              tabs: _topTabs,
              indicatorColor: Colors.amber
          ),
        ),
        body: new Center(
          child: new TabBarView(
              controller: _topNavigation,
              children: <Widget>[
                new SleepNaturePage(),
              ],
          ),
        ),
      ),
    );
  }

}