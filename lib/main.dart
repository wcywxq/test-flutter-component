import 'package:flutter/material.dart';
import 'package:app/demo/drawer_demo.dart';
import 'package:app/demo/list_view_demo.dart';
import 'package:app/demo/bottom_navigation_bar_demo.dart';
import 'package:app/demo/basic_demo.dart';
import 'package:app/demo/layout_demo.dart';
import 'package:app/demo/view_demo.dart';
import 'package:app/demo/sliver_demo.dart';
import 'package:app/demo/navigator_demo.dart';
import 'package:app/demo/form_demo.dart';
import 'package:app/demo/material_component.dart';
import 'package:app/demo/state/view_list.dart';
import 'package:app/demo/stream/stream_demo.dart';
import 'package:app/demo/rxdart/rxdart_demo.dart';
import 'package:app/demo/bloc/bloc_demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 隐藏右上角 debug
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
        splashColor: Colors.white70,
        accentColor: Color.fromRGBO(3, 54, 255, 1.0),
      ),
      // home: NavigatorDemo(),
      initialRoute: '/bloc',
      routes: {
        '/': (BuildContext context) => Home(),
        '/about': (BuildContext context) => Page(title: 'About'),
        '/form': (BuildContext context) => FormDemo(),
        '/mdc': (BuildContext context) => MaterialComponents(),
        '/state-view': (BuildContext context) => ViewList(),
        '/stream': (BuildContext context) => StreamDemo(),
        '/rxDart': (BuildContext context) => RxDartDemo(),
        '/bloc': (BuildContext context) => BlocDemo(),
      },
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Text('宁浩'),
          // leading: IconButton(
          //   icon: Icon(Icons.menu),
          //   tooltip: 'Navigation',
          //   onPressed: () => debugPrint('Navigation button is pressed!'),
          // ),
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'search',
              onPressed: () => debugPrint('search button is pressed!'),
            ),
          ],
          bottom: TabBar(
            unselectedLabelColor: Colors.black38,
            indicatorColor: Colors.black54,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 1.0,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.local_florist)),
              Tab(icon: Icon(Icons.change_history)),
              Tab(icon: Icon(Icons.directions_bike)),
              Tab(icon: Icon(Icons.view_quilt)),
              Tab(icon: Icon(Icons.access_alarm)),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ListViewDemo(),
            BasicDemo(),
            LayoutDemo(),
            ViewDemo(),
            SliverDemo(),
            // Icon(Icons.local_florist, size: 128.0, color: Colors.black12),
            // Icon(Icons.change_history, size: 128.0, color: Colors.black12),
            // Icon(Icons.directions_bike, size: 128.0, color: Colors.black12)
          ],
        ),
        drawer: DrawerDemo(),
        bottomNavigationBar: BottomNavigationBarDemo(),
      ),
    );
  }
}
