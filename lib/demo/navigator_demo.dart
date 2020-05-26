import 'package:flutter/material.dart';

class NavigatorDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: null,
              child: Text('Home'),
            ),
            FlatButton(
              onPressed: () {
                // 方式一：  使用 Navigator.of(context) 操作路由
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (BuildContext context) => Page(
                //       title: 'About',
                //     ),
                //   ),
                // );
                // 方式二：使用 Navigator.pushNamed 操作路由
                Navigator.pushNamed(context, "/about");
              },
              child: Text('About'),
            ),
          ],
        ),
      ),
    );
  }
}

class PageDemo extends StatelessWidget {
  final String title;

  PageDemo({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 返回上一页
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back,
        ),
      ),
    );
  }
}
