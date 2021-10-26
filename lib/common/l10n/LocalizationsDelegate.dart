import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'Localizations.dart';

class MyLocalizationsDelegate extends LocalizationsDelegate<MyLocalizations> {
  const MyLocalizationsDelegate();

  //是否支持某个Local
  @override
  bool isSupported(Locale locale) {
    return ['zh', 'en', 'fr', 'ja'].contains(locale.languageCode);
  }

  // Flutter会调用此类加载相应的Locale资源类
  @override
  Future<MyLocalizations> load(Locale locale) {
    // 在这里返回SynchronousFuture是因为不需要异步“加载”操作来生成MyLocalizations的实例。
    return SynchronousFuture<MyLocalizations>(MyLocalizations(locale));
  }

  // 当Localizations Widget重新build时，是否调用load重新加载Locale资源.
  @override
  bool shouldReload(MyLocalizationsDelegate old) => false;
  //shouldReload的返回值决定当Localizations组件重新build时，是否调用load方法重新加载Locale资源。
  //一般情况下，Locale资源只应该在Locale切换时加载一次，不需要每次在Localizations重新build时都加载，所以返回false即可。
  //可能有些人会担心返回false的话在APP启动后用户再改变系统语言时load方法将不会被调用，所以Locale资源将不会被加载。
  //事实上，每当Locale改变时Flutter都会再调用load方法加载新的Locale，无论shouldReload返回true还是false。
}
