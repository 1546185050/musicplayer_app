
import 'package:flutter/material.dart';

import 'SleepLightMusicPage.dart';
import 'SleepNaturePage.dart';
import 'SleepScenePage.dart';

class SleepAidTabBarView extends StatelessWidget{

  final TabController tabController;

  SleepAidTabBarView({Key key, @required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var viewList = [
      SleepNaturePage(),
      SleepScenePage(),
      SleepLightMusicPage(),
      Page4(),
    ];

    return TabBarView(
      children: viewList,
      controller: tabController,
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