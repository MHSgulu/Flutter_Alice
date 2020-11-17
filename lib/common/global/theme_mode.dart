import 'package:alice/common/sp_util.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppThemeMode extends ChangeNotifier {
  static bool isDark = false; //是否黑夜模式
  static String language = 'zh'; //语言环境的主要语言子标签
  static String script = 'Hans'; //语言变体
  static Color lightTextColors = Colors.black45; //浅色系文本 适用于副标题

  void switchThemeMode(bool value) {
    isDark = value;
    print('数据点位: 当前是否黑夜模式: $isDark');
    SharedPreferencesUtil.getInstance().saveThemeMode(isDark);
    if (value) {
      ///黑夜模式下的颜色值
      lightTextColors = Colors.white60;
    } else {
      ///白昼模式下的颜色值
      lightTextColors = Colors.black54;
    }
    notifyListeners();
  }

  void switchLanguage(String languageCode, String scriptCode) {
    language = languageCode;
    script = scriptCode;
    print('数据点位: 当前语言环境: $language');
    print('数据点位: 当前语言变种: $script');
    SharedPreferencesUtil.getInstance().saveLanguageType(language, script);
    notifyListeners();
  }
}
