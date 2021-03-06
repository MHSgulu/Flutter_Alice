import 'package:alice/common/const/routes.dart';
import 'package:alice/common/global/theme_mode.dart';
import 'package:alice/common/l10n/LocalizationsDelegate.dart';
import 'package:alice/routes/home_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

class MyMaterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppThemeMode(),
      child: Consumer<AppThemeMode>(
        builder: (context, theme, child) {
          //创建一个MaterialApp。
          //[home]，[routes]，[onGenerateRoute]或[builder]中的至少一个必须为非null。
          //如果仅给出[routes]，则它必须包含[Navigator.defaultRouteName]（`/`）的条目，
          //因为这是在启动应用程序时使用的路由，其意图指定了其他不受支持的路由。
          //此类创建[WidgetsApp]的实例。
          //布尔参数[routes]和[navigatorObservers]不能为null。
          return MaterialApp(
            //debugShowCheckedModeBanner: false,  //通过启动应用程序时显示的[home]路由禁用“ debug”横幅。
            ///定义一个自定义的 error widget，以当 builder 构建 widget 失败时显示，请使用 MaterialApp.builder。
            /*builder: (BuildContext context, Widget widget) {
              Widget error = Text('...rendering error...');
              if (widget is Scaffold || widget is Navigator)
                error = Scaffold(body: Center(child: error));
              ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
                return error;
              };
              return widget;
            },*/
            ///设备用于识别用户应用程序的单行描述。
            ///在Android上，标题显示在任务管理器的应用程序快照上方，当用户按下“最近的应用程序”按钮时，将显示这些标题。
            ///在iOS上，无法使用此值。 应用程序的“ Info.plist”中的“ CFBundleDisplayName”将在存在时被引用，否则，将被“ CFBundleName”引用。
            ///在网络上，它用作页面标题，显示在浏览器的打开选项卡列表中。
            ///要提供本地化的标题，请使用[onGenerateTitle]。
            title: 'Material Alice',
            home: WillPopScopeHome(),
            // 应用程序的顶级路由表。
            // 当使用[Navigator.pushNamed]推送命名的路线时，将在此地图中查找路线名称。
            // 如果存在该名称，则使用关联的[WidgetBuilder]构造一个[MaterialPageRoute]，
            // 该[MaterialPageRoute]执行适当的过渡（包括[Hero]动画）到新路线。
            routes: routes,
            // 如果非null，则调用此回调函数以生成应用的标题字符串，否则使用[title]。
            // [onGenerateTitle]`context`参数包括[WidgetsApp]的[Localizations]小部件，以便可以使用此回调产生本地化的标题。
            // 此回调函数不得返回null。
            // 每当[WidgetsApp]重建时，都会调用[onGenerateTitle]回调。
            ///onGenerateTitle: (context) => MyLocalizations.of(context).appTitle,
            //此应用程序的默认视觉属性，例如颜色字体和形状材料小部件。
            //也可以指定第二个[darkTheme] [ThemeData]值，该值用于提供深色的用户界面。
            //如果提供了[darkTheme]，则[themeMode]将控制使用哪个主题。
            //此属性的默认值为[ThemeData.light（）]的值。
            // 也可以看看：
            // [themeMode]，它控制要使用的主题。
            // [MediaQueryData.platformBrightness]，它指示平台所需的亮度，并用于在[MaterialApp]中的[theme]和[darkTheme]之间自动切换。
            // [ThemeData.brightness]，它指示主题颜色的[Brightness]。
            theme: ThemeData(
              // dark   颜色是深色的，需要一个浅色的文本颜色来实现可读的对比。
              // 例如，颜色可能是深灰色，需要白色文本。
              // light  颜色是浅色的，需要深色文本颜色来实现可读的对比。
              // 例如，颜色可能是亮白色，需要黑色文本.
              brightness: AppThemeMode.isDark ? Brightness.dark : Brightness.light,
              primarySwatch: Colors.blue,
              //这使视觉密度适应您在其上运行应用程序的平台。
              //对于台式机平台，控件将比移动平台上的控件更小，更靠近（更密集）。
              //返回基于[defaultTargetPlatform]自适应的视觉密度。
              //对于台式机平台，此方法返回[compact]，对于其他平台，其返回默认构造的[VisualDensity]。
              visualDensity: VisualDensity.adaptivePlatformDensity,
              //Scaffold下方[Material]的默认颜色。典型材质应用或应用中页面的背景颜色。
              scaffoldBackgroundColor: AppThemeMode.isDark ? Colors.grey[850] : Colors.grey[50],
            ),
            locale: Locale.fromSubtags(languageCode: AppThemeMode.language, scriptCode: AppThemeMode.script.isEmpty ? null : AppThemeMode.script),
            //localizationDelegates 数组是用于生成本地化值集合的工厂
            localizationsDelegates: [
              // 注册我们的Delegate
              const MyLocalizationsDelegate(), // 此处特定于应用的本地化代表
              GlobalMaterialLocalizations.delegate, //为 Material 组件库提供本地化的字符串和一些其他的值
              GlobalWidgetsLocalizations.delegate, // 为 widgets 库定义了默认的文本排列方向，由左到右或者由右到左
              GlobalCupertinoLocalizations.delegate,
            ],
            //此回调仅考虑默认语言环境，这是首选语言环境列表中的第一个语言环境。
            //与[localeResolutionCallback]相比，最好设置[localeListResolutionCallback]，因为它提供了完整的首选语言环境列表。
            //该算法应该能够处理空的语言环境，这表明Flutter尚未从平台接收到语言环境信息。
            localeResolutionCallback: (Locale locale, Iterable<Locale> supportedLocales) => locale,
            ///此应用程序已本地化的语言环境列表。
            ///
            ///默认情况下，仅支持美国英语语言环境。应用程序应配置此列表以匹配其支持的语言环境。
            ///
            ///此列表不能为空。它的默认值只是`[const Locale（'en'，'US'）]``。
            ///
            ///列表的顺序很重要。默认的语言环境解析算法“ basicLocaleListResolution”会尝试按以下优先级进行匹配：
            ///
            /// 1. [Locale.languageCode]，[Locale.scriptCode]和[Locale.countryCode]
            /// 2.仅[Locale.languageCode]和[Locale.scriptCode]
            /// 3.仅[Locale.languageCode]和[Locale.countryCode]
            /// 4.仅[Locale.languageCode]
            /// 5. [Locale.countryCode]仅在所有首选语言环境均不匹配时
            /// 6.返回[supportedLocales]的第一个元素作为后备
            ///
            ///如果有多个支持的语言环境与这些条件之一匹配，则仅返回第一个匹配的语言环境。
            ///
            ///通过提供[localeListResolutionCallback]的值，可以覆盖默认的语言环境解析算法。
            ///提供的`basicLocaleListResolution`已针对速度进行了优化，并未实现将语言之间的距离纳入其中的完整算法
            ///（例如[Unicode TR35]（https://unicode.org/reports/tr35/#LanguageMatching）中定义的算法）帐户。
            ///
            ///当支持具有多个脚本的语言时，建议明确指定[Locale.scriptCode]。也可以不使用[Locale.countryCode]来定义语言环境，以为特定脚本指定通用后备。
            ///
            ///具有多种脚本的完全受支持的语言应定义通用的仅语言的语言环境（例如'zh'），
            ///仅语言+脚本的语言环境（例如'zh_Hans'和'zh_Hant'）以及任何语言+脚本+国家/地区的语言（例如“ zh_Hans_CN”）。
            ///并非严格要求将所有这些语言环境完全定义为受支持，但是在大多数情况下，都可以使用适当的语言环境解析。
            ///可以使用[Locale.fromSubtags]构造函数指定这些语言环境：
            ///
            ///忽略其中的一些后备情况可能会导致无法正确解决边缘情况，
            ///例如，如果省略了“ zh_Hans”和“ zh_Hans_CN”，则台湾的简体中文用户（zh_Hans_TW）可能会转换为繁体中文。
            ///
            /// 也可以看看：
            ///
            /// * [MaterialApp.supportedLocales]，它设置其创建的[WidgetsApp]的`supportedLocales`。
            /// * [localeResolutionCallback]，一个应用回调，当设备的区域设置更改时，解析应用的区域设置。
            /// * [localizationsDelegates]，它们共同定义了此应用使用的所有本地化资源。
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
          );
        },
      ),
    );
  }
}

///Material设计规范中状态栏、导航栏、ListTile高度分别为24、56、56

///从Dart 2开始，new关键字是可选的

///使用材料设计的应用程序。
///
///一个方便的小部件，其中包装了材料设计应用程序通常需要的许多小部件。它通过添加特定于材料设计的功能（例如[AnimatedTheme]和[GridPaper]），以[WidgetsApp]为基础。
///
/// [MaterialApp]将顶级[Navigator]配置为按以下顺序搜索路线：
///
/// 1.对于`/`路由，使用[home]属性（如果非null）。
///
/// 2.否则，如果[routes]表具有路由条目，则使用该表。
///
/// 3.否则，如果提供，则调用[onGenerateRoute]。对于未由[home]和[routes]处理的任何_valid_路由，它应返回非null值。
///
/// 4.最后，如果其他所有方法都失败，则调用[onUnknownRoute]。
///
///如果创建了[Navigator]，则这些选项中的至少一个必须处理`/`路由，因为在启动时指定了无效的[initialRoute]时会使用该路由（例如，另一个应用程序有意地启动该路由）在Android上；
///参见[Window.defaultRouteName]。
///
///此小部件还配置顶级[Navigator]（如果有）的观察者以执行[Hero]动画。
///
///如果[home]，[routes]，[onGenerateRoute]和[onUnknownRoute]全部为空，并且[builder]不为空，则不会创建[Navigator]。