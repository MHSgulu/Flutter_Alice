import 'package:alice/pages/my_cupertino_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SwitchCupertinoTheme extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SwitchCupertinoThemeState();
}

class SwitchCupertinoThemeState extends State<SwitchCupertinoTheme> {
  bool isCupertino = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 50,
        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Row(
          children: [
            Text('Cupertino 主题'),
            Expanded(child: Container()),
            CupertinoSwitch(
              value: isCupertino,
              onChanged: switchToCupertinoTheme,
            ),
          ],
        ),
      ),
    );
  }

  switchToCupertinoTheme(bool value) {
    if (mounted) {
      setState(() {
        isCupertino = value;
      });
    }
    if (value == true) {
      Fluttertoast.showToast(msg: '库比蒂诺主题');

      ///将给定的路由推到导航器上，然后删除所有以前的路由，直到“predicate”返回true。
      ///Navigator.of(context).pushAndRemoveUntil<T>(newRoute, predicate)


      ///将给定的路由推送到最紧密围绕给定上下文的导航器中，然后删除所有先前的路由，直到`predicate`返回true。
      ///
      ///如果[Route.willHandlePopInternally]为true，则该谓词可以多次应用于同一路由。
      ///
      ///要删除路由直到具有特定名称的路由，请使用从[ModalRoute.withName]返回的[RoutePredicate]。
      ///
      ///要删除推送的路线下方的所有路线，请使用始终返回false的[RoutePredicate]（例如`（Route <dynamic> route）=> false`）。
      ///
      ///删除的路由没有完成就被删除，因此此方法不使用返回值参数。
      ///
      ///为[Route.didPush]通知新推送的路由及其先前的路由。删除后，通过[Route.didChangeNext]通知新路由及其新的先前路由（最底部已删除路​​由下方的路由）。如果[Navigator]有任何[Navigator.observers]，它们也会被通知（请参阅[NavigatorObserver.didPush]和[NavigatorObserver.didRemove]）。一旦新路线完成动画制作，移除的路线将被处置并得到通知。从推动这些路线退回的期货将不会完成。
      ///
      ///当按下新路线时，当前路线中正在进行的手势将被取消。
      ///
      ///返回从导航器弹出被推入的路线时，将完成传递到[pop]的`result`值的[Future]。
      ///
      /// T型参数是新路线返回值的类型。
      Navigator.pushAndRemoveUntil(
          context,
          CupertinoPageRoute(builder: (_) => MyCupertinoApp()),
          /*(route) => false*/ModalRoute.withName('/'),
      );

      ///ModalRoute   阻止与以前的路由交互的路由。
      ///[ModalRoute]覆盖整个[Navigator]。他们不一定[不透明]，例如，一个弹出菜单使用了一个[ModalRoute]，但是只在一个小框中显示菜单，与前面的路径重叠。

      ///withName  如果路由具有指定的名称并且如果弹出路线不会产生相同的路线，即，如果路线的[willHandlePopInternally]属性为false。此函数通常与[Navigator.popntil导航器()].
    }
  }
}
