import 'package:flutter_driver/driver_extension.dart';
import 'package:app/main.dart' as app;

// 集成测试，测试整体的应用中的某一个功能
// 一般由两个文件组成
// 1. 创建一个特别的应用，将该应用部署到真生的设备或设备模拟器上
// 2. 用一个对应的测试套件去操控这个应用
 
void main() { 
  enableFlutterDriverExtension();

  app.main();
}
