import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppThemeMode extends ChangeNotifier {
  static bool isDark = false;
  static String language = 'zh';

  //浅色系文本 适用于副标题
  static Color lightTextColors = Colors.black45;


  void switchThemeMode(bool value) {
    isDark = value;
    print('数据点位: 当前是否黑夜模式: $isDark');
    if(value){///黑夜模式下的颜色值
      lightTextColors = Colors.white60;
    }else{///白昼模式下的颜色值
      lightTextColors = Colors.black54;
    }
    notifyListeners();
  }

  void switchLanguage(String languageCode) {
    language = languageCode;
    print('数据点位: 当前语言环境: $language');
    notifyListeners();
  }


}
