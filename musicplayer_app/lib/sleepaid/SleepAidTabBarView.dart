
import 'package:flutter/material.dart';

import 'SleepNaturePage.dart';

class SleepAidTabBarView extends StatelessWidget{

  final TabController tabController;

  SleepAidTabBarView({Key key, @required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var viewList = [
      SleepNaturePage(),
      Page2(),
      Page3(),
      Page4(),
    ];

    return TabBarView(
      children: viewList,
      controller: tabController,
    );
  }

}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build Page1');

    return Center(
      child: Text('Page1'),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build Page2');
    return Center(
      child: Text('Page2'),
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build Page3');
    return Center(
      child: Text('Page3'),
    );
  }
}

class Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build Page4');
    return Center(
      child: Text('Page4'),
    );
  }
}