import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
import 'package:app/demo/http/http_demo.dart';
import 'package:app/demo/animation/animation.dart';
import 'package:app/demo/i18n/i18n_demo.dart';
// import 'package:app/demo/i18n/map/ninghao_demo_localizations.dart';
import 'package:app/demo/i18n/intl/ninghao_demo_localizations.dart';
import 'package:app/demo/test/test_demo.dart';

import 'package:provider/provider.dart';
import 'package:app/demo/provider/provider_demo.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => Counter()),
        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // locale: Locale('zh', 'CN'), // 设置本地化语言，locale 实际是 Localizations 中所需要的值
      // localeResolutionCallback 决定当前应用所使用的语言，supportedLocales 应用支持的本地化列表
      localeResolutionCallback:
          (Locale locale, Iterable<Locale> supportedLocales) {
        return Locale('en', 'US');
      },
      localizationsDelegates: [
        NinghaoDemoLocalizationsDelegate(), // 自定义的 LocalizationsDelegate，用来加载本地化资源
        GlobalMaterialLocalizations.delegate, // 提供应用中 Material 组件本地化的字符串
        GlobalWidgetsLocalizations.delegate, // 定义了 Widget 默认的文字方向
      ],
      supportedLocales: [
        Locale('en', 'US'), // 第一个参数：语言，第二个参数：地区
        Locale('zh', 'CN'),
      ],
      // 隐藏右上角 debug
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
        splashColor: Colors.white70,
        accentColor: Color.fromRGBO(3, 54, 255, 1.0),
      ),
      // home: NavigatorDemo(),
      initialRoute: '/provider',
      routes: {
        '/': (BuildContext context) => Home(),
        '/about': (BuildContext context) => PageDemo(title: 'About'),
        '/form': (BuildContext context) => FormDemo(),
        '/mdc': (BuildContext context) => MaterialComponents(),
        '/state-view': (BuildContext context) => ViewList(),
        '/stream': (BuildContext context) => StreamDemo(),
        '/rxDart': (BuildContext context) => RxDartDemo(),
        '/bloc': (BuildContext context) => BlocDemo(),
        '/http': (BuildContext context) => HttpDemo(),
        '/animation': (BuildContext context) => AnimationDemo(),
        '/i18n': (BuildContext context) => I18nDemo(),
        '/test': (BuildContext context) => TestDemo(),
        '/provider': (BuildContext context) => CounterDemo(),
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

// ios 需要打开 xcode，配置最后一项为 Localizations
