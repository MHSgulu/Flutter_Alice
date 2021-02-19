import 'package:alice/common/global/theme_mode.dart';
import 'package:alice/routes/my_material_app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';

Future<void> main() async{
  /// 返回[WidgetsBinding]的实例，必要时创建并初始化它。 如果创建了一个，它将是一个[WidgetsFlutterBinding]。
  /// 如果以前已经初始化过，那么它将至少实现[WidgetsBinding]。
  /// 仅在需要在调用[runApp]之前初始化绑定的情况下，才需要调用此方法。
  /// 在`flutter_test`框架中，[testWidgets]将绑定实例初始化为[TestWidgetsFlutterBinding]，而不是[WidgetsFlutterBinding]。
  WidgetsFlutterBinding.ensureInitialized(); //添加此处代码是为了防止下句代码报错
  AppThemeMode.init().then((e) async {
    ///遇到错误时退出应用程序
    ///例如，当 release 模式下发生错误时，应用理应立即关闭，可以使用下面的回调方法:
    FlutterError.onError = (FlutterErrorDetails details) {
      ///将给定的异常详细信息打印到控制台。  [onError]处理程序的默认行为是调用此函数。
      FlutterError.dumpErrorToConsole(details,forceReport: true);
      // 顶级kReleaseMode常量指示应用程序是否在发布模式下编译。kReleaseMode 如果在发布模式下编译应用程序，则为true的常量。kProfileMode 如果应用程序是在调试模式下编译的，则为true的常量。
      if (kReleaseMode || kProfileMode){
        ///使用给定的退出代码立即退出Dart VM进程。
        print('onError: 捕获运行期间的错误，立即退出应用');
        exit(1);
      }
    };
    runApp(MyMaterialApp());
  });
  if (Platform.isAndroid) {
    /// 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      //statusBarIconBrightness: Brightness.dark, //顶部状态栏图标的亮度。仅在Android 6.0 及更高版本中受支持。(适合首页无AppBar结构的页面)
    ); //指定系统覆盖样式的首选项。
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);

    ///顶部状态栏的颜色。仅支持Android M及更高版本中。
  }
  // 为桌面设置平台替代以避免异常 See https://flutter.cn/desktop#target-platform-override for more info.
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux)) {
    /// kIsWeb
    ///如果将应用程序编译为在Web上运行，则为true的常量。
    ///
    ///此实现利用了JavaScript不支持整数的事实。 在这种环境下，Dart的double和int由相同类型的对象支持。
    ///因此，双数“ 0.0”等于整数“ 0”。 对于在AOT或VM上运行的Dart代码，情况并非如此。
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }
}
