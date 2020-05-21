import 'package:flutter/material.dart';
import 'package:app/demo/bloc/count_bloc_demo.dart';

// 业务逻辑组件
// sink => 向 Stream 上添加数据
// listen => 监听或订阅 Widget
// StreamBuilder => 根据 Stream 上的数据构建 Widget
class BlocDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      bloc: CounterBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('BLocDemo'),
          elevation: 0.0,
        ),
        body: CounterHome(),
        floatingActionButton: CounterActionButton(),
      ),
    );
  }
}
