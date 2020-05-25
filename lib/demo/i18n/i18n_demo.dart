import 'package:flutter/material.dart';
// import 'package:app/demo/i18n/map/ninghao_demo_localizations.dart';
import 'package:app/demo/i18n/intl/ninghao_demo_localizations.dart';

class I18nDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Localizations 在 WidgetApp 中的子部件可以找到
    Locale locale = Localizations.localeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('I18nDemo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('${locale.languageCode}'), // locale.languageCode 语言的代码
            Text(locale.toString()), // 输出语言和地区的代码结合
            // 引用本地化资源
            Text(
              // Localizations.of(context, NinghaoDemoLocalizations).title,
              // NinghaoDemoLocalizations.of(context).title, // 创建的静态方法
              NinghaoDemoLocalizations.of(context).greet('ninghao'),
              style: Theme.of(context).textTheme.title,
            ),
          ],
        ),
      ),
    );
  }
}
