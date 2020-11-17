import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtil {
  factory SharedPreferencesUtil.getInstance() => _instance;
  static final _instance = SharedPreferencesUtil._init();
  SharedPreferencesUtil._init();

  ///登录时存储 账号数据
  Future<void> saveAccountInfo(String token,String account,String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('account', account);
    await prefs.setString('password', password);
  }

  ///退出登录时清除数据用户数据
  Future<void> clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('account', '');
    prefs.setString('password', '');
  }

  ///存储 主题模式
  Future<void> saveThemeMode(bool isDark) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDark', isDark);
  }

  ///存储 语言类型
  Future<void> saveLanguageType(String languageCode,String scriptCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('languageCode', languageCode);
    await prefs.setString('scriptCode', scriptCode);
  }

}
