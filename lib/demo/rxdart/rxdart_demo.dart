import 'package:flutter/material.dart';

// RxDart 类似 RxJs
// Rx => Reactive Extensions 响应式编程
// Observable =>  和 Stream 很像，继承自 Stream
// 0.24 版本后，RxDart移除了Observable

class RxDartDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RxDartDemo'),
      ),
      body: RxDartDemoHome(),
    );
  }
}

class RxDartDemoHome extends StatefulWidget {
  @override
  _RxDartDemoHomeState createState() => _RxDartDemoHomeState();
}

class _RxDartDemoHomeState extends State<RxDartDemoHome> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Stream.fromIterable(['hello', '您好'])
      .listen(print);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

