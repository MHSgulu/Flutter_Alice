import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtil {
  factory SharedPreferencesUtil.getInstance() => _instance;
  static final _instance = SharedPreferencesUtil._init();
  SharedPreferencesUtil._init();

  //storage

  //登录时存储 账号数据
  Future<void> saveAccountInfo(String token,String account,String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('account', account);
    await prefs.setString('password', password);
  }

  //退出登录时清除数据用户数据
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

  ///存储 是否保存聊天历史
  Future<void> saveIsSaveChat(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isSaveChat', value);
  }

  ///存储 聊天历史
  Future<void> saveChatHistory(List<String> value1,List<String> value2) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ///将字符串[value]的列表保存到后台的持久存储中。
    ///如果[value]为null，则等效于在[key]上调用[remove（）]。
    //var result1 = await prefs.setStringList('chatIdentifierList', value1);
    //var result2 = await prefs.setStringList('chatContentList', value2);
    ///从持久性存储中删除条目。
    var result1 = await prefs.remove('chatIdentifierList');
    var result2 = await prefs.remove('chatContentList');
    print('数据点位: result1: $result1');
    print('数据点位: result1: $result2');
  }

  ///存储 聊天背景图
  Future<void> saveChatBackgroundImage(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('chat_background_image_path', value);
  }

  ///取数据 聊天背景图
  Future<String> fetchChatBackgroundImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('chat_background_image_path');
  }

  ///存储 是否开启聊天背景图
  Future<void> saveIsTurnOnChatBackground(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isTurnOnChatBackground', value);
  }

}
