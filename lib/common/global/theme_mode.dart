import 'package:alice/common/sp_util.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemeMode extends ChangeNotifier {
  static bool isDark; //是否黑夜模式
  static String language; //语言环境的主要语言子标签
  static String script; //语言变体
  static Color lightTextColors = Colors.black54; //浅色系文本 适用于副标题

  //初始化全局信息，会在APP启动时执行
  static Future init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isDark = prefs.getBool("isDark") ?? false;
    language = prefs.getString("languageCode") ?? 'zh';
    script = prefs.getString("scriptCode") ?? 'Hans';
    if (isDark) {
      ///黑夜模式下的颜色值
      lightTextColors = Colors.white60;
    } else {
      ///白昼模式下的颜色值
      lightTextColors = Colors.black54;
    }
    print('数据点位: 初始化时是否为黑夜模式: $isDark');
    print('数据点位: 初始化语言环境: $language');
    print('数据点位: 初始化语言变体: $script');
  }

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
