import 'package:flutter/material.dart';

class TestDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TestDemo'),
      ),
      body: TestDemoHome(),
    );
  }
}

class TestDemoHome extends StatefulWidget {
  @override
  _TestDemoHomeState createState() => _TestDemoHomeState();
}

class _TestDemoHomeState extends State<TestDemoHome> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Chip(
          label: Text('hello'),
        ),
        // key，测试时可以定位到具体的小部件
        ActionChip(
          key: Key('actionChip'),
          label: Text('$count', key: Key('actionChipLabelText')),
          onPressed: () {
            setState(() {
              count++;
            });
          },
        ),
      ],
    );
  }
}

class NinghaoTestDemo {
  static greet(String name) {
    return 'hello $name';
  }
}

// unit 单元测试，测试应用中的各种逻辑是否符合预期
