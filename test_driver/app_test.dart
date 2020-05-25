import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_test/flutter_test.dart';
// import 'package:flutter_test/flutter_test.dart';

void main() {
  // 创建一组测试
  group('App', () {
    FlutterDriver driver;

    final actionChip = find.byValueKey('actionChip');
    final actionChipLabelText = find.byValueKey('actionChipLabelText');

    // 运行之前要做的事情
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // 测试完成后可以关闭
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('starts at 0.', () async {
      expect(await driver.getText(actionChipLabelText), '0');
    });

    test('increments the counter', () async {
      await driver.tap(actionChip);

      expect(await driver.getText(actionChipLabelText), '1');
    });
  });
}

// flutter driver --target=test_driver/app.dart 运行