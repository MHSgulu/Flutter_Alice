import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///在应用程序当前内容上方显示一个iOS样式的对话框，并带有iOS样式的入口和出口动画，模态屏障颜色和模态屏障行为（默认情况下，在屏障上轻击该对话框是不可用的）。
///此函数需要一个“构建器”，该构建器通常会构建一个[CupertinoDialog]或[CupertinoAlertDialog]小部件。对话框下面的内容以[ModalBarrier]变暗。
///由builder返回的窗口小部件与最初调用showCupertinoDialog的位置没有共享上下文。如果对话框需要动态更新，请使用[StatefulBuilder]或自定义[StatefulWidget]。
///
///`context`参数用于查找对话框的[Navigator]。
///仅在调用方法时使用。在关闭对话框之前，可以从树中安全删除其对应的小部件。
///
///`useRootNavigator`参数用于确定是否将对话框推入距给定上下文最远或最接近的[Navigator]。
///默认情况下，“ useRootNavigator”为“ true”，并且此方法创建的对话框路由被推送到根导航器。
///
///如果应用程序具有多个[Navigator]对象，则可能需要调用`Navigator.of（context，rootNavigator：true）.pop（result）`来关闭对话框，而不仅仅是`Navigator.pop（context，结果）。
///
///返回关闭对话框时解析为传递给[Navigator.pop]的值（如果有）的[Future]。
///
/// 也可以看看：
///
/// * [CupertinoDialog]，一种iOS样式的对话框。
/// * [CupertinoAlertDialog]，一种iOS风格的警报对话框。
/// * [showDialog]，显示材质样式对话框。
/// * [showGeneralDialog]，它允许自定义对话框弹出窗口。

class CupertinoDialogRoute extends StatefulWidget {
  @override
  _CupertinoDialogRouteState createState() => _CupertinoDialogRouteState();
}

class _CupertinoDialogRouteState extends State<CupertinoDialogRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: '提醒对话框',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CupertinoButton.filled(
              child: Text(
                '提醒',
                style: TextStyle(fontSize: 14),
              ),
              onPressed: () => show0(),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: CupertinoButton.filled(
              child: Text(
                '带标题的提醒',
                style: TextStyle(fontSize: 14),
              ),
              onPressed: () => show1(),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: CupertinoButton.filled(
              child: Text(
                '带有按钮的提醒',
                style: TextStyle(fontSize: 14),
              ),
              onPressed: () => show2(),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: CupertinoButton.filled(
              child: Text(
                '仅限提醒按钮',
                style: TextStyle(fontSize: 14),
              ),
              onPressed: () => show3(),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: CupertinoButton.filled(
              child: Text(
                '操作表',
                style: TextStyle(fontSize: 14),
              ),
              onPressed: () => show4(),
            ),
          ),
        ],
      ),
    );
  }

  void show0() {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text('要舍弃草稿么？'),
          actions: [
            ///为iOS样式的对话框创建一个动作。
            ///通常在[CupertinoAlertDialog]中使用的按钮。
            CupertinoDialogAction(
              onPressed: () => Navigator.pop(context),
              child: Text(
                '舍弃',
                style: TextStyle(color: Colors.redAccent),
              ),
            ),
            CupertinoDialogAction(
              onPressed: () => Navigator.pop(context),
              child: Text('取消'),
            ),
          ],
        );
      },
    );
  }

  void show1() {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text('是否允许“地图”在您使用该应用时获取您的位置信息'),
          content: Text('您当前所在的位置将显示在地图上，并用于提供路线、附近位置的搜索结果和预计的行程时间。'),
          actions: [
            CupertinoDialogAction(
              onPressed: () => Navigator.pop(context),
              child: Text('不允许'),
            ),
            CupertinoDialogAction(
              onPressed: () => Navigator.pop(context),
              child: Text('允许'),
            ),
          ],
        );
      },
    );
  }

  void show2() {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text('选择最心爱的甜点'),
          content: Text('请从下面的列表中选择您最喜爱的甜点类型。系统将根据您的选择自定义您所在地区的推荐餐厅列表。'),
          actions: [
            CupertinoDialogAction(
              onPressed: () => Navigator.pop(context),
              child: Text('奶酪蛋糕'),
            ),
            CupertinoDialogAction(
              onPressed: () => Navigator.pop(context),
              child: Text('提拉米苏'),
            ),
            CupertinoDialogAction(
              onPressed: () => Navigator.pop(context),
              child: Text('苹果派'),
            ),
            CupertinoDialogAction(
              onPressed: () => Navigator.pop(context),
              child: Text('巧克力布朗尼'),
            ),
            CupertinoDialogAction(
              onPressed: () => Navigator.pop(context),
              child: Text(
                '取消',
                style: TextStyle(color: Colors.redAccent),
              ),
            ),
          ],
        );
      },
    );
  }

  void show3() {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          actions: [
            CupertinoDialogAction(
              onPressed: () => Navigator.pop(context),
              child: Text('奶酪蛋糕'),
            ),
            CupertinoDialogAction(
              onPressed: () => Navigator.pop(context),
              child: Text('提拉米苏'),
            ),
            CupertinoDialogAction(
              onPressed: () => Navigator.pop(context),
              child: Text('苹果派'),
            ),
            CupertinoDialogAction(
              onPressed: () => Navigator.pop(context),
              child: Text('巧克力布朗尼'),
            ),
            CupertinoDialogAction(
              onPressed: () => Navigator.pop(context),
              child: Text(
                '取消',
                style: TextStyle(color: Colors.redAccent),
              ),
            ),
          ],
        );
      },
    );
  }

  void show4() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        ///一个iOS样式的操作表。
        ///
        ///操作表是一种特定的警报样式，它向用户显示与当前上下文相关的两个或多个选项。
        ///动作表可以具有标题，附加消息和动作列表。
        ///标题显示在消息上方，动作显示在该内容下方。
        ///
        ///此操作表将其标题和消息设置样式，以匹配标准的iOS操作表标题和消息文本样式。
        ///
        ///要显示类似于标准iOS操作表按钮的操作按钮，请为此操作表提供的[actions]提供[CupertinoActionSheetAction]。
        ///
        ///要包含与其他按钮分开的iOS样式的取消按钮，请为此操作表提供[cancelButton]的[CupertinoActionSheetAction]。
        ///
        ///通常，操作表作为子窗口小部件传递给[showCupertinoModalPopup]，后者通过从屏幕底部向上滑动来显示该操作表。
        ///
        /// 也可以看看：
        ///
        /// * [CupertinoActionSheetAction]，这是iOS样式的操作表按钮。
        /// * <https://developer.apple.com/design/human-interface-guidelines/ios/views/action-sheets/>
        return CupertinoActionSheet(
          title: Text('选择最喜爱的甜点'),
          message: Text('请从下面的列表中选择您最喜爱的甜点类型。系统将根据您的选择自定义您所在地区的推荐餐厅列表。'),
          actions: [
            ///通常在[CupertinoActionSheet]中使用的按钮。
            ///为iOS样式的操作表创建操作。
            CupertinoActionSheetAction(
              onPressed: () => Navigator.pop(context),
              child: Text('奶酪蛋糕'),
            ),
            CupertinoActionSheetAction(
              onPressed: () => Navigator.pop(context),
              child: Text('提拉米苏'),
            ),
            CupertinoActionSheetAction(
              onPressed: () => Navigator.pop(context),
              child: Text('苹果派'),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: () => Navigator.pop(context),
            child: Text('取消'),
          ),
        );
      },
    );
  }
}
