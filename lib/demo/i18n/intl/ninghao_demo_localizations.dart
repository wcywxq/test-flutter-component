import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'ninghao_demo_messages_all.dart';

class NinghaoDemoLocalizations {
  static NinghaoDemoLocalizations of(BuildContext context) {
    return Localizations.of<NinghaoDemoLocalizations>(
      context,
      NinghaoDemoLocalizations,
    );
  }

  static Future<NinghaoDemoLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();

    // canonicalizedLocale 规范表示本地化的代号
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return NinghaoDemoLocalizations();
    });
  }

  String get title => Intl.message(
        'title',
        name: 'title',
        desc: 'demo descriptions.',
      );

  String greet(String name) => Intl.message(
        'hello $name',
        name: 'greet',
        desc: 'greet someone.',
        args: [name], // 参数
      );
}

class NinghaoDemoLocalizationsDelegate
    extends LocalizationsDelegate<NinghaoDemoLocalizations> {
      
  NinghaoDemoLocalizationsDelegate();

  // load，加载包含本地化资源的对象
  @override
  Future<NinghaoDemoLocalizations> load(Locale locale) {
    // 可以返回同步的 Future
    return NinghaoDemoLocalizations.load(locale);
  }

  // 判断 local 加载的资源是否支持本地化的语言
  @override
  bool isSupported(Locale locale) {
    return true;
  }

  // NinghaoDemoLocalizations 重新调用时会执行。返回 true 将重新调用 load 加载本地化资源
  @override
  bool shouldReload(LocalizationsDelegate<NinghaoDemoLocalizations> old) {
    return false;
  }
}

// 生成的 arb 文件可以作为翻译的模版
// flutter pub pub run intl_translation:extract_to_arb --output-dir=lib/demo/i18n/intl/ lib/demo/i18n/intl/ninghao_demo_localizations.dart

// 根据 arb 生成 dart 库
// flutter pub pub run intl_translation:generate_from_arb --generated-file-prefix=ninghao_demo_ --output-dir=lib/demo/i18n/intl/ --no-use-deferred-loading lib/demo/i18n/intl/ninghao_demo_localizations.dart lib/demo/i18n/intl/intl_*.arb
