import 'package:alice/common/global/theme_mode.dart';
import 'package:alice/routes/my_app.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';


void main() {
  /// 返回[WidgetsBinding]的实例，必要时创建并初始化它。 如果创建了一个，它将是一个[WidgetsFlutterBinding]。
  /// 如果以前已经初始化过，那么它将至少实现[WidgetsBinding]。
  /// 仅在需要在调用[runApp]之前初始化绑定的情况下，才需要调用此方法。
  /// 在`flutter_test`框架中，[testWidgets]将绑定实例初始化为[TestWidgetsFlutterBinding]，而不是[WidgetsFlutterBinding]。
  WidgetsFlutterBinding.ensureInitialized(); //添加此处代码是为了防止下句代码报错
  AppThemeMode.init().then((e) => runApp(MyApp()));
  if (Platform.isAndroid) {
    /// 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      //statusBarIconBrightness: Brightness.dark, //顶部状态栏图标的亮度。仅在Android 6.0 及更高版本中受支持。(适合首页无AppBar结构的页面)
    ); //指定系统覆盖样式的首选项。
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);

    ///顶部状态栏的颜色。仅支持Android M及更高版本中。
  }
}



