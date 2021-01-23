import 'package:flutter/widgets.dart';

class NavigatorUtil{

  ///将给定的路线推到最紧密围绕给定上下文的导航器上。
  ///
  ///通知新路线和上一条路线（如果有）（请参阅[Route.didPush]和[Route.didChangeNext]）。
  ///如果[Navigator]有任何[Navigator.observers]，它们也会被通知（请参阅[NavigatorObserver.didPush]）。
  ///
  ///当按下新路线时，当前路线中正在进行的手势将被取消。
  ///
  ///返回从导航器弹出被推入的路线时，将完成传递到[pop]的`result`值的[Future]。
  ///
  /// T型参数是路由返回值的类型
  static Future<T> push<T extends Object>(BuildContext context, Route<T> route) {
    return Navigator.of(context).push(route);
  }



}