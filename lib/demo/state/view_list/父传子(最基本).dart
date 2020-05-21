import 'package:flutter/material.dart';

class StateManagementBaseDemo extends StatefulWidget {
  @override
  _StateManagementBaseDemoState createState() => _StateManagementBaseDemoState();
}

class _StateManagementBaseDemoState extends State<StateManagementBaseDemo> {
  int _count = 0;

  void _increaseCount() {
    setState(() {
      _count += 1;
    });
    print(_count);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StateManagementBaseDemo'),
        elevation: 0.0,
      ),
      // 传递数据
      body: CounterWrapper(_count, _increaseCount),
      floatingActionButton: FloatingActionButton(
        onPressed: _increaseCount,
        child: Icon(Icons.add),
      ),
    );
  }
}

// 间接传递数据
class CounterWrapper extends StatelessWidget {
  final int count;
  final VoidCallback increaseCount;

  CounterWrapper(this.count, this.increaseCount);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Counter(count, increaseCount),
    );
  }
}

class Counter extends StatelessWidget {
  final int count;
  final VoidCallback increaseCount;

  Counter(this.count, this.increaseCount);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ActionChip(
        label: Text('$count'),
        onPressed: increaseCount,
      ),
    );
  }
}
