import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter_localizations/flutter_localizations.dart';



///app 本地化资源的替代方法  不使用 intl包 它所有的翻译放在每个语言的映射当中。

class DemoLocalizations {
  DemoLocalizations(this.locale);

  final Locale locale;

  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'title': 'Hello World',
      'title1': 'aaaaaaaaaaa',
    },
    'es': {
      'title': 'Hola Mundo',
    },
  };

  String get title {
    return _localizedValues[locale.languageCode]['title'];
  }

  String get title1 {
    return _localizedValues[locale.languageCode]['title1'];
  }

}

class DemoLocalizationsDelegate extends LocalizationsDelegate<DemoLocalizations> {
  const DemoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'es'].contains(locale.languageCode);
  }

  @override
  Future<DemoLocalizations> load(Locale locale) {
    // 在这里返回SynchronousFuture是因为不需要异步“加载”操作来生成DemoLocalizations的实例。
    return SynchronousFuture<DemoLocalizations>(DemoLocalizations(locale));
  }

  @override
  bool shouldReload(DemoLocalizationsDelegate old) => false;
}

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(DemoLocalizations.of(context).title),
      ),
      body: Center(
        child: Text(DemoLocalizations.of(context).title1),
      ),
    );
  }
}

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /// 如果非null，则调用此回调函数以生成应用的标题字符串，否则使用[title]。
      /// [onGenerateTitle]`context`参数包括[WidgetsApp]的[Localizations]小部件，以便可以使用此回调产生本地化的标题。
      /// 此回调函数不得返回null。
      /// 每当[WidgetsApp]重建时，都会调用[onGenerateTitle]回调。
      onGenerateTitle: (BuildContext context) => DemoLocalizations.of(context).title,
      localizationsDelegates: [
        const DemoLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('es', ''),
      ],
      // 注意：MaterialApp使用指定的委托创建一个Localizations小部件。
      // DemoLocalizations.of（）仅在其上下文是该应用程序的子级时才能找到该应用程序的Localizations小部件。
      home: DemoApp(),
    );
  }
}

