import 'package:flutter/material.dart';

///app 本地化资源的替代方法  不使用 intl包 它所有的翻译放在每个语言的映射当中。

class MyLocalizations {
  MyLocalizations(this.locale);

  final Locale locale;

  static MyLocalizations of(BuildContext context) {
    return Localizations.of<MyLocalizations>(context, MyLocalizations);
  }

  static Map<String,String> zhHansMap = {};

  ///该Map 的第一个参数 String 必须与locale.toString() 一致 例： zh/zh  zh_Hans/zh_Hans
  Map<String, Map<String, String>> _localizedValues = {
    'zh_Hans': {
      'app_title': '爱丽丝',
      'intl': '国际化',
      'zhl': '中文(简体)',
      'zhlHant': '中文(繁体)',
      'enl': '英语',
      'frl': '法语',
      'jal': '日文',
    },
    'zh_Hant': {
      'app_title': '愛麗絲',
      'intl': '國際化',
      'zhl': '中文(簡體)',
      'zhlHant': '中文(繁體)',
      'enl': '英語',
      'frl': '法語',
      'jal': '日文',
    },
    'en': {
      'app_title': 'Alice',
      'intl': 'Internationalization',
      'zhl': 'Chinese(Simplified)',
      'zhlHant': 'Chinese(traditional)',
      'enl': 'English',
      'frl': 'French',
      'jal': 'Japanese',
    },
    'fr': {
      'app_title': 'Alice',
      'intl': 'Globalisation',
      'zhl': 'Chinois(simplifié)',
      'zhlHant': 'Chinois(traditionnel)',
      'enl': 'langue Anglaise',
      'frl': 'français',
      'jal': 'Japonais',
    },
    'ja': {
      'app_title': 'アリス',
      'intl': 'グローバル化',
      'zhl': '中国語（簡体字）',
      'zhlHant': '中国語（繁体字）',
      'enl': '英語',
      'frl': 'フランス語',
      'jal': '日本語',
    },
  };

  ///该Map 的第一个参数 String 必须与locale.toString() 一致 例： en/en  zh_Hans/zh_Hans
  String get appTitle {
    return _localizedValues[locale.toString()]['title'];
  }

  String get intlPageTitle {
    return _localizedValues[locale.toString()]['intl'];
  }

  String get zhl {
    return _localizedValues[locale.toString()]['zhl'];
  }

  String get zhlHant {
    return _localizedValues[locale.toString()]['zhlHant'];
  }

  String get enl {
    return _localizedValues[locale.toString()]['enl'];
  }

  String get frl {
    return _localizedValues[locale.toString()]['frl'];
  }

  String get jal {
    return _localizedValues[locale.toString()]['jal'];
  }

}