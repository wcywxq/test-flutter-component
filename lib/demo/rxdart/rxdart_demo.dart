import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

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
  PublishSubject<String> _textFieldSubject;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

//    方式一，可根据可迭代的数据创建
//    Stream.fromIterable(['hello', '您好'])
//        .listen(print);

//    方式二，根据 Future 创建
//    Stream.fromFuture(Future.value('hello ~')).listen(print);

//    方式三，根据简单的值创建
//    Stream.value('hello ~').listen(print);

//    方法四，指定时间间隔重复触发事件
//    Stream.periodic(Duration(seconds: 3), (int x) => x.toString())
//        .listen(print);

//    subject 相当于 StreamController，可以添加订阅
//    PublishSubject<String> _subject = PublishSubject<String>();
//
//    _subject.listen((String data) => print('listen 1: $data'));
//    _subject.add('hello');
//    _subject.listen((String data) => print('listen 2: ${data.toUpperCase()}'));
//    _subject.add('hola');
//    _subject.close();

//    BehaviorSubject 可以将最后一个项目交给新来的监听
//    BehaviorSubject<String> _subject = BehaviorSubject<String>();
//    _subject.add('hello');
//    _subject.add('hola'); // hola 是最后一次添加的数据，所以只会输出这两个
//    _subject.listen((String data) => print('listen 1: $data'));
//    _subject.listen((String data) => print('listen 2: ${data.toUpperCase()}'));
//    _subject.close();

//    ReplaySubject 把添加到 Controller 或 subject 上的数据全部交给监听器, maxSize 可以设置最大接收数据的数量
//    ReplaySubject<String> _subject = ReplaySubject<String>(maxSize: 3);
//    _subject.add('hello');
//    _subject.add('hola');
//    _subject.add('hi');
//    _subject.listen((String data) => print('listen 1: $data'));
//    _subject.listen((String data) => print('listen 2: ${data.toUpperCase()}'));
//    _subject.close();

    _textFieldSubject = PublishSubject<String>();
    _textFieldSubject
//        .map((String item) => 'item: $item') // 数据转换
        .where((String item) => item.length > 9) // 条件
        .debounceTime(Duration(milliseconds: 500)) // 防抖
        .listen((String data) => print(data)); // 监听

//    _textFieldSubject.close();
  }

  @override
  void dispose() {
    super.dispose();
    _textFieldSubject.close();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Colors.black,
      ),
      child: TextField(
        onChanged: (String value) {
          _textFieldSubject.add('input: $value');
        },
        onSubmitted: (String value) {
          _textFieldSubject.add('submit: $value');
        },
        decoration: InputDecoration(
          labelText: 'title',
          filled: true,
        ),
      ),
    );
  }
}
