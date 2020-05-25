import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app/demo/test/test_demo.dart';

void main() {
  // 测试 NinghaoTestDemo 中的 great 方法
  // 单元测试
  test('should return hello + something.', () {
    var string = NinghaoTestDemo.greet('ninghao');
    expect(string, 'hello ninghao');
  });

  // Widget 测试
  testWidgets('widget testing demo', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: TestDemo(),
      )
    );

    final labelText = find.text('hello'); // 查找在测试里面创建的小部件中是否有一个 文本小部件，上面显示的文字是 hello
    // expect(labelText, findsNothing); // 期望没找到 
    // expect(labelText, findsOneWidget); // 期望找到一个
    expect(labelText, findsNWidgets(1)); // 期望找到一个 

    // ----------------------------------------------------------------

    final actionChipLabelText = find.text('0');
    expect(actionChipLabelText, findsOneWidget);

    final actionChip = find.byType(ActionChip);
    await tester.tap(actionChip); // 执行点击操作
    await tester.pump(); // 重建小部件

    final actionChipLabelTextAfterTap = find.text('1');
    expect(actionChipLabelTextAfterTap, findsOneWidget);
    expect(actionChipLabelText, findsNothing); // 此时，期望页面上不应该有包含 '0' 的 Widget
  });
}