// 定义本地化资源类
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;

class NinghaoDemoLocalizations {
  final Locale locale;

  NinghaoDemoLocalizations(this.locale);

  static NinghaoDemoLocalizations of(BuildContext context) {
    return Localizations.of<NinghaoDemoLocalizations>(
      context,
      NinghaoDemoLocalizations,
    );
  }

  static Map<String, Map<String, String>> _localized = {
    'en': {
      'title': 'hello',
    },
    'zh': {
      'title': '你好',
    }
  };

  String get title {
    return _localized[locale.languageCode]['title'];
  }
}

class NinghaoDemoLocalizationsDelegate
    extends LocalizationsDelegate<NinghaoDemoLocalizations> {
  NinghaoDemoLocalizationsDelegate();

  // load，加载包含本地化资源的对象
  @override
  Future<NinghaoDemoLocalizations> load(Locale locale) {
    // 可以返回同步的 Future
    return SynchronousFuture<NinghaoDemoLocalizations>(
      NinghaoDemoLocalizations(locale),
    );
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
