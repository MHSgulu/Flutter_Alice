import 'package:flutter/foundation.dart';

class AppThemeMode extends ChangeNotifier {
  static bool isDark = false;

  void switchThemeMode(bool value) {
    isDark = value;
    notifyListeners();
  }
}
