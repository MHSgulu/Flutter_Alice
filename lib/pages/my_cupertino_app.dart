import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'home_page.dart';

class MyCupertinoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoHomePage(),
      ///顶层[CupertinoTheme]样式。
      ///空的[theme]或未指定的[theme]属性将默认为iOS系统值。
      theme: CupertinoThemeData( ///创建一个[CupertinoTheme]样式规范。未指定的参数默认为合理的iOS默认样式。
        brightness: Brightness.light,
        primaryColor: Colors.blue,
      ),
      ///应用程序的顶级路由表。
      ///当使用[Navigator.pushNamed]推送命名的路线时，将在此地图中查找路线名称。
      ///如果存在名称，则使用关联的[WidgetBuilder]来构建[CupertinoPageRoute]，该[CupertinoPageRoute]执行适当的过渡（包括[Hero]动画）到新路线。
      //routes: routes,
      title: 'Cupertino Alice',
      debugShowCheckedModeBanner: false,
    );
  }
}