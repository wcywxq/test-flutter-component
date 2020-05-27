import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter with ChangeNotifier {
  int _count = 2;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }
}

class Counter1 with ChangeNotifier {
  int _count = 4;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }
}

class CounterDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CounterDemo'),
        elevation: 0.0,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,

          /// 方案一
          // children: <Widget>[
          //   Text(
          //     /// 当 Counter 改变时将重建小部件
          //     '${context.watch<Counter>().count}',
          //     // '${Provider.of<Counter>(context).count}',
          //     style: Theme.of(context).textTheme.headline4,
          //   ),
          //   CupertinoButton(
          //     child: Icon(CupertinoIcons.minus_circled, color: CupertinoColors.white),
          //     onPressed: () => context.read<Counter>().decrement(),
          //     color: CupertinoColors.activeBlue,
          //   ),
          // ],
          /// 方案二
          children: <Widget>[
            Consumer<Counter>(
              builder: (BuildContext context, Counter counter, Widget child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '${counter.count}',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    CupertinoButton(
                      child: Icon(CupertinoIcons.minus_circled,
                          color: CupertinoColors.white),
                      onPressed: () => counter.decrement(),
                      color: CupertinoColors.activeBlue,
                    ),
                  ],
                );
              },
            ),
            Consumer<Counter1>(
              builder: (BuildContext context, Counter1 counter, Widget child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '${counter.count}',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    CupertinoButton(
                      child: Icon(CupertinoIcons.minus_circled,
                          color: CupertinoColors.white),
                      onPressed: () => counter.decrement(),
                      color: CupertinoColors.activeBlue,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // 使用 context.read 代替 context.watch，是为了不重新创建小部件，当 Counter 改变时触发
        onPressed: () {
          context.read<Counter>().increment();
          context.read<Counter1>().increment();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
