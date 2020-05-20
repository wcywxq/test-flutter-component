import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class ScopeModelStateManagementDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: CounterModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('ScopeModelStateManagementDemo'),
          elevation: 0.0,
        ),
        body: CounterWrapper(),
        floatingActionButton: ScopedModelDescendant<CounterModel>(
          // rebuildOnChange 无论是否有变化，设置为 false 将不会重建内部的子 widget
          rebuildOnChange: false,
          builder: (BuildContext context, Widget child, CounterModel model) {
            return FloatingActionButton(
              onPressed: model.increaseCount,
              child: Icon(Icons.add),
            );
          },
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
    return ScopedModelDescendant<CounterModel>(
      builder: (BuildContext context, Widget child, CounterModel model) {
        return Center(
          child: ActionChip(
            label: Text('${model.count}'),
            onPressed: model.increaseCount,
          ),
        );
      },
    );
  }
}

// 第三方包 scope_model
class CounterModel extends Model {
  int _count = 0;

  int get count => _count;

  void increaseCount() {
    _count += 1;
    // notifyListeners 重建 widget
    notifyListeners();
  }
}
