import 'package:flutter/material.dart';

class TestDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TestDemo'),
      ),
      body: null,
    );
  }
}

class NinghaoTestDemo {
  static greet(String name) {
     return 'hello $name';
  }
}

// unit 单元测试，测试应用中的各种逻辑是否符合预期