import 'package:flutter/material.dart';
import 'dart:async';

// 用来处理错误等其它情况
class StreamDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamDemo'),
        elevation: 0.0,
      ),
      body: StreamDemoHome(),
    );
  }
}

class StreamDemoHome extends StatefulWidget {
  @override
  _StreamDemoHomeState createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {
  // 暂停，恢复，取消监听
  StreamSubscription _streamDemoSubscription;
  StreamController<String> _streamDemo;
  StreamSink _sinkDemo; // 用于在 StreamController 控制的数据上添加数据
  String _data = '...';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print('Create a stream');
//    Stream<String> _streamDemo = Stream.fromFuture(fetchData());

    _streamDemo = StreamController<String>();
    _sinkDemo = _streamDemo.sink;

    print('Start listening on a stream');
    _streamDemoSubscription =
//        _streamDemo.listen(onData, onError: onError, onDone: onDone);
    _streamDemo.stream.listen(onData, onError: onError, onDone: onDone);

    print('Initialize completed.');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // 关闭不需要的 stream
    super.dispose();
  }

  void onDone() {
    print('Done!');
  }

  void onError(error) {
    print('Error: $error');
  }

  void onData(String data) {
    print('$data');
    setState(() {
      _data = data;
    });
  }

  void _pauseStream() {
    print('Pause subStription');
    _streamDemoSubscription.pause();
  }

  void _resumeStream() {
    print('Resume subStription');
    _streamDemoSubscription.resume();
  }

  void _cancelStream() {
    print('Cancel subStription');
    _streamDemoSubscription.cancel();
  }

  void _addDataToString() async {
    print('Add data to stream.');

    String data = await fetchData();
//    _streamDemo.add(data);
    _sinkDemo.add(data);
  }

  Future<String> fetchData() async {
    await Future.delayed(
      Duration(seconds: 3),
    );
    // throw 'Something happened';
    return 'Hello ~';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Text(_data),
            // 使用 StreamBuilder 传递数据
//            StreamBuilder(
//              stream: _streamDemo.stream,
//              initialData: '...',
//              builder: (context, snapshot) {
//                return Text('${snapshot.data}');
//              },
//            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text('Add'),
                  onPressed: _addDataToString,
                ),
                // 暂停
                FlatButton(
                  child: Text('Pause'),
                  onPressed: _pauseStream,
                ),
                // 恢复
                FlatButton(
                  child: Text('Resume'),
                  onPressed: _resumeStream,
                ),
                // 取消
                FlatButton(
                  child: Text('Cancel'),
                  onPressed: _cancelStream,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
