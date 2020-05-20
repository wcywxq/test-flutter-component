import 'package:flutter/material.dart';

class StateManagementDirectDemo extends StatefulWidget {
  @override
  _StateManagementDirectDemoState createState() => _StateManagementDirectDemoState();
}

class _StateManagementDirectDemoState extends State<StateManagementDirectDemo> {
  int _count = 0;

  void _increaseCount() {
    setState(() {
      _count += 1;
    });
    print(_count);
  }

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      count: _count,
      increaseCount: _increaseCount,
      child: Scaffold(
        appBar: AppBar(
          title: Text('StateManagementDirectDemo'),
          elevation: 0.0,
        ),
        // 传递数据
        body: CounterWrapper(),
        floatingActionButton: FloatingActionButton(
          onPressed: _increaseCount,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class CounterWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Counter(),
    );
  }
}

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int count = CounterProvider.of(context).count;
    final VoidCallback increaseCount =
        CounterProvider.of(context).increaseCount;

    return Center(
      child: ActionChip(
        label: Text('$count'),
        onPressed: increaseCount,
      ),
    );
  }
}

// 直接传递数据
class CounterProvider extends InheritedWidget {
  final int count;
  final VoidCallback increaseCount;
  final Widget child;

  CounterProvider({
    this.count,
    this.increaseCount,
    this.child,
  }) : super(child: child);

  // 注册
  static CounterProvider of(BuildContext context) =>
//      context.dependOnInheritedWidgetOfExactType<CounterProvider>();
  context.dependOnInheritedWidgetOfExactType(aspect: CounterProvider);

  // 用来告诉 InheritedWidget 如果对数据进行了修改，是否必须将通知传递给所有子 widget（已注册/已订阅）
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }
}
