import 'package:flutter/material.dart';
import 'package:app/commons/tab_choice.dart';

void main() => runApp(MyApp());

const List<TabChoice> homeTabList = <TabChoice>[
  TabChoice(title: '个性推荐'),
  TabChoice(title: '主播电台')
];

const List<TabChoice> homeTabBarList = <TabChoice>[
  TabChoice(title: '发现', icon: Icons.home),
  TabChoice(title: '视频', icon: Icons.home),
  TabChoice(title: '我的', icon: Icons.home),
  TabChoice(title: '朋友', icon: Icons.home),
  TabChoice(title: '账号', icon: Icons.home),
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '这是一个标题',
      home: new DefaultTabController(length: 2, child: PageLayout()),
    );
  }
}

class PageLayout extends StatefulWidget {
  @override
  _PageLayoutState createState() => _PageLayoutState();
}

class _PageLayoutState extends State<PageLayout> {
  int _selectIndex = 0;
  static const TextStyle optionType = TextStyle(
    fontSize: 30.0,
    fontWeight: FontWeight.bold,
  );
  static const List<Widget> _widgetOptions = <Widget>[
    Text('index 0: 发现', style: optionType),
    Text('index 1: 视频', style: optionType),
    Text('index 2: 我的', style: optionType),
    Text('index 3: 朋友', style: optionType),
    Text('index 4: 账号', style: optionType),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Color(0xffd43c33),
        title: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Icon(Icons.arrow_left),
            new Opacity(
              opacity: 0.65,
              child: new Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Color(0xffdc635f),
                ),
                child: new Container(
                  padding: EdgeInsets.only(
                    left: 10.0,
                    right: 10.0,
                    top: 5.0,
                    bottom: 5.0,
                  ),
                  width: 300.0,
                  child: new Row(
                    children: <Widget>[
                      new Icon(
                        Icons.search,
                        size: 16.0,
                      ),
                      new Padding(
                        padding: new EdgeInsets.only(left: 10.0),
                        child: new Text(
                          '只对你有感觉',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            new Icon(Icons.arrow_right),
          ],
        ),
        bottom: new TabBar(
          isScrollable: true,
          indicatorColor: Colors.white,
          indicatorPadding: EdgeInsets.only(bottom: 8.0),
          indicatorSize: TabBarIndicatorSize.label,
          tabs: homeTabList.map((TabChoice choice) {
            return new Tab(text: choice.title);
          }).toList(),
        ),
      ),
      body: new Center(
        child: _widgetOptions.elementAt(_selectIndex),
      ),
      bottomNavigationBar: new BottomNavigationBar(
        currentIndex: _selectIndex,
        onTap: _onItemTapped,
        selectedItemColor: Color(0xffd0332e),
        type: BottomNavigationBarType.fixed,
        items: homeTabBarList.map((TabChoice choice) {
          return new BottomNavigationBarItem(
            icon: Icon(choice.icon),
            title: new Text(choice.title),
          );
        }).toList(),
      ),
    );
  }
}
