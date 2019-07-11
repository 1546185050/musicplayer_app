import 'package:flutter/material.dart';

import './FirstTabPage.dart';

import 'package:musicplayer_app/sleepaid/SleepAidTabPage.dart';

import './ThirdTabPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{

  //底部导航
  final List<Tab> _bottomTabs = <Tab>[
    new Tab(text: 'XMusic',icon: new Icon(Icons.audiotrack),),
    new Tab(text: '助眠',icon: new Icon(Icons.airline_seat_individual_suite)),
    new Tab(text: '晚安FM',icon: new Icon(Icons.radio)),
  ];

  //底部导航Tab控制器
  TabController _bottomNavigation;

  @override
  void initState() {
    super.initState();
    _bottomNavigation = new TabController(
        vsync: this,
        length: _bottomTabs.length
    );
  }

  @override
  void dispose() {
    _bottomNavigation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      /*
        appBar: new AppBar(
          backgroundColor: Colors.deepOrange,
          title: new Text('MusicPlayer'),
        ),
        */
        body: new TabBarView(
            controller: _bottomNavigation,

            children:  [
              new FirstTabPage(),
              new SleepAidTabPage(),
              new ThirdTabPage()
            ]
        ),
        bottomNavigationBar: new Material(
          color: Colors.blue,
          child: new TabBar(
            controller: _bottomNavigation,
            tabs: _bottomTabs,
            indicatorColor: Colors.amber,
          ),
        )
    );
  }
}
