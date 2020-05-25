import 'package:flutter_test/flutter_test.dart';
import 'package:app/demo/test/test_demo.dart';

void main() {
  // 测试 NinghaoTestDemo 中的 great 方法
  test('should return hello + something.', () {
    var string = NinghaoTestDemo.greet('ninghao');
    expect(string, 'hello ninghao');
  });
}