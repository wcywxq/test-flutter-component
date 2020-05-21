import 'dart:async';

import 'package:flutter/material.dart';

class CounterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.of(context).bloc;

    return Center(
      child: StreamBuilder(
        initialData: 0,
        stream: _counterBloc.count,
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          return ActionChip(
            label: Text('${snapshot.data}'),
            onPressed: () {
//              _counterBloc.log();
              _counterBloc.counter.add(1);
            },
          );
        },
      ),
    );
  }
}

class CounterActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.of(context).bloc;

    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
//        _counterBloc.log();
        _counterBloc.counter.add(1);
      },
    );
  }
}

class CounterProvider extends InheritedWidget {
  final Widget child;
  final CounterBloc bloc;

  const CounterProvider({
    Key key,
    this.child,
    this.bloc,
  }) : super(key: key, child: child);

  static CounterProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<CounterProvider>();

  @override
  bool updateShouldNotify(CounterProvider old) {
    return true;
  }
}

class CounterBloc {
  int _count = 0;

  final _counterActionController = StreamController<int>();
  StreamSink<int> get counter => _counterActionController.sink;

  final _counterController = StreamController<int>();
  Stream<int> get count => _counterController.stream;

  StreamSubscription _dataSubscription;

  CounterBloc() {
    _dataSubscription = _counterActionController.stream.listen(onData);
  }

  void onData(int data) {
    print('data: $data');
    _count = data + _count;
    _counterController.add(_count);
  }

  void dispose() {
    _dataSubscription.cancel();
    _counterActionController.close();
    _counterController.close();
  }

  void log() {
    print('Bloc');
  }
}
