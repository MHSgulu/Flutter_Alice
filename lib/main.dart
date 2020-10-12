import 'package:alice/provider/theme_mode.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'ui/home.dart';

///从Dart 2开始，new关键字是可选的

///将给定的路由推到最紧密地包围给定上下文的导航器上，然后删除所有先前的路由，直到“predicate”返回true。
///   Navigator.pushAndRemoveUntil(
///     context,
///     MaterialPageRoute(builder: (BuildContext context) => MyHomePage()),
///     ModalRoute.withName('/'),
///   );

///ModalRoute   阻止与以前的路由交互的路由。
///[ModalRoute]覆盖整个[Navigator]。他们不一定[不透明]，例如，一个弹出菜单使用了一个[ModalRoute]，但是只在一个小框中显示菜单，与前面的路径重叠。

///withName  如果路由具有指定的名称并且如果弹出路线不会产生相同的路线，即，如果路线的[willHandlePopInternally]属性为false。此函数通常与[Navigator.popntil导航器()].

void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
    /// 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent); //指定系统覆盖样式的首选项。
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);

    ///顶部状态栏的颜色。仅支持Android M及更高版本中。
  }
}

class MyApp extends StatelessWidget {
  static const String _title = 'Alice';

  //  这个小部件是应用程序的根。
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppThemeMode(),
      child: Consumer<AppThemeMode>(
        builder: (context, theme, child) => MaterialApp(
          debugShowCheckedModeBanner: false, //去掉DuBug模式下 右上角的标志
          title: _title,
          theme: ThemeData(
            //这是应用程序的主题。
            /// dark   颜色是深色的，需要一个浅色的文本颜色来实现可读的对比。
            /// 例如，颜色可能是深灰色，需要白色文本。
            /// light  颜色是浅色的，需要深色文本颜色来实现可读的对比。
            /// 例如，颜色可能是亮白色，需要黑色文本.
            brightness: theme.isDark ? Brightness.dark : Brightness.light,
            primarySwatch: Colors.blue,
          ),
          home: WillPopScopeHome(),
        ),
      ),
    );
  }
}
