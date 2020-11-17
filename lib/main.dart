import 'package:alice/ui/global/localization/LocalizationsDelegate.dart';
import 'package:alice/ui/global/theme_mode.dart';
import 'package:alice/ui/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

//Material设计规范中状态栏、导航栏、ListTile高度分别为24、56、56

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
      statusBarColor: Colors.transparent,
      //statusBarIconBrightness: Brightness.dark, //顶部状态栏图标的亮度。仅在Android 6.0 及更高版本中受支持。(适合首页无AppBar结构的页面)
    ); //指定系统覆盖样式的首选项。
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);

    ///顶部状态栏的颜色。仅支持Android M及更高版本中。
  }
}

class MyApp extends StatelessWidget {
  static const String _title = '爱丽丝';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppThemeMode(),
      child: Consumer<AppThemeMode>(
        builder: (context, theme, child) => MaterialApp(
          //debugShowCheckedModeBanner: false,  //去掉DuBug模式下 右上角的标志
          home: WillPopScopeHome(),
          title: _title,
          /// 如果非null，则调用此回调函数以生成应用的标题字符串，否则使用[title]。
          /// [onGenerateTitle]`context`参数包括[WidgetsApp]的[Localizations]小部件，以便可以使用此回调产生本地化的标题。
          /// 此回调函数不得返回null。
          /// 每当[WidgetsApp]重建时，都会调用[onGenerateTitle]回调。
          //onGenerateTitle: (context) => MyLocalizations.of(context).appTitle,
          ///此应用程序的默认视觉属性，例如颜色字体和形状材料小部件。
          ///也可以指定第二个[darkTheme] [ThemeData]值，该值用于提供深色的用户界面。 如果提供了[darkTheme]，则[themeMode]将控制使用哪个主题。
          ///此属性的默认值为[ThemeData.light（）]的值。
          /// [themeMode]，它控制要使用的主题。
          /// [MediaQueryData.platformBrightness]，它指示平台所需的亮度，并用于在[MaterialApp]中的[theme]和[darkTheme]之间自动切换。
          /// [ThemeData.brightness]，它指示主题颜色的[Brightness]。
          theme: ThemeData(
            /// dark   颜色是深色的，需要一个浅色的文本颜色来实现可读的对比。
            /// 例如，颜色可能是深灰色，需要白色文本。
            /// light  颜色是浅色的，需要深色文本颜色来实现可读的对比。
            /// 例如，颜色可能是亮白色，需要黑色文本.
            brightness: AppThemeMode.isDark ? Brightness.dark : Brightness.light,
            primarySwatch: Colors.blue,
            ///这使视觉密度适应您在其上运行应用程序的平台。
            ///对于台式机平台，控件将比移动平台上的控件更小，更靠近（更密集）。
            ///返回基于[defaultTargetPlatform]自适应的视觉密度。
            ///对于台式机平台，此方法返回[compact]，对于其他平台，其返回默认构造的[VisualDensity]。
            visualDensity: VisualDensity.adaptivePlatformDensity,
            ///Scaffold下方[Material]的默认颜色。典型材质应用或应用中页面的背景颜色。
            scaffoldBackgroundColor: AppThemeMode.isDark ? Colors.grey[850] : Colors.grey[50],
          ),
          locale: Locale.fromSubtags(languageCode: AppThemeMode.language, scriptCode: AppThemeMode.script.isEmpty ? null : AppThemeMode.script),
          ///localizationDelegates 数组是用于生成本地化值集合的工厂
          localizationsDelegates: [
            // 注册我们的Delegate
            const MyLocalizationsDelegate(),
            // 此处特定于应用的本地化代表
            GlobalMaterialLocalizations.delegate, //为 Material 组件库提供本地化的字符串和一些其他的值
            GlobalWidgetsLocalizations.delegate, // 为 widgets 库定义了默认的文本排列方向，由左到右或者由右到左
            GlobalCupertinoLocalizations.delegate,
          ],
          localeResolutionCallback: (Locale locale, Iterable<Locale> supportedLocales) {
            return locale;
          },
          supportedLocales: [
            const Locale('en', ''), // 英文，无国家/地区代码
            const Locale('fr', ''), // 法语，无国家/地区代码
            const Locale('ja', ''), // 日文，无国家/地区代码
            const Locale('ko', ''), // 韩文，无国家/地区代码
            const Locale.fromSubtags(languageCode: 'zh'), // 通用中文“ zh” // 中文*请参阅下面的高级语言环境*
            const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'), // 通用简体中文 'zh_Hans'
            const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'), // 通用繁体中文 'zh_Hant'
            const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans', countryCode: 'CN'), // 'zh_Hans_CN'
            const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant', countryCode: 'TW'), // 'zh_Hant_TW'
            const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant', countryCode: 'HK'), // 'zh_Hant_HK'
            // ... 应用支持的其他语言环境
          ],
          // 注意：MaterialApp使用指定的委托创建一个Localizations小部件。
          // MyLocalizations.of（）仅在其上下文是该应用程序的子级时才能找到该应用程序的Localizations小部件。
        ),
      ),
    );
  }
}
