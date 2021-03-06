import 'package:alice/common/global/theme_mode.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

class MyCupertinoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppThemeMode(),
      child: Consumer<AppThemeMode>(
        builder: (context, theme, child) {
          return CupertinoApp(
            home: CupertinoHomePage(),

            ///顶层[CupertinoTheme]样式。
            ///空的[theme]或未指定的[theme]属性将默认为iOS系统值。
            theme: CupertinoThemeData(
              ///创建一个[CupertinoTheme]样式规范。未指定的参数默认为合理的iOS默认样式。
              brightness: AppThemeMode.isDark ? Brightness.dark : Brightness.light,
              primaryColor: Colors.blue,
            ),

            ///应用程序的顶级路由表。
            ///当使用[Navigator.pushNamed]推送命名的路线时，将在此地图中查找路线名称。
            ///如果存在名称，则使用关联的[WidgetBuilder]来构建[CupertinoPageRoute]，该[CupertinoPageRoute]执行适当的过渡（包括[Hero]动画）到新路线。
            //routes: routes,
            title: 'Cupertino Alice',
            debugShowCheckedModeBanner: false,

            ///此应用的[Localizations]小部件的委托。
            ///代表共同定义了此应用程序的[Localizations]小部件的所有本地化资源
            //在CupertinoApp中使用一些 MD部件出错(比如Scaffold的AppBar)
            //错误信息 指向这里 于是添加了这个 本以为是跟国际化相关的。
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              const Locale('en', ''),
              //添加支持中文之后 一些复杂控件自动翻译
              const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans', countryCode: 'CN'),
            ],
          );
        },
      ),
    );
  }
}
