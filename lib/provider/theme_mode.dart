import 'package:flutter/cupertino.dart';

class AppThemeMode extends ChangeNotifier{
  bool isDark = false;

  void switchThemeMode(bool value) {
    isDark = value;
    notifyListeners();
  }

}