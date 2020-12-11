import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

///按下时显示菜单，并且由于选择了某个项目而取消菜单时调用[onSelected]。 传递给[onSelected]的值是所选菜单项的值。
///
///可以提供[child]或[icon]之一，但不能同时提供。 如果提供了[icon]，则[PopupMenuButton]的行为类似于[IconButton]。
///
///如果两者都为null，则将创建一个标准的溢出图标（取决于平台）。
///
/// 也可以看看：
///
/// * [PopupMenuItem]，单个值的弹出菜单项。
/// * [PopupMenuDivider]，只是一条水平线的弹出菜单项。
/// * [CheckedPopupMenuItem]，带有复选标记的弹出菜单项。
/// * [showMenu]，一种在给定位置动态显示弹出菜单的方法。

class MenuDemo extends StatefulWidget {
  @override
  _MenuDemoState createState() => _MenuDemoState();
}

class _MenuDemoState extends State<MenuDemo> {
  WhyFarther _selection;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'Menu',
        onPressedBack: () => Navigator.pop(context),
      ),

      ///此示例显示了一个菜单，该菜单包含四个项目，可以在枚举值之间进行选择，并根据选择内容设置一个“ _selection”字段。
      //此菜单按钮小部件将更新_selection字段（类型WhyFarther，此处未显示）。
      body: Center(
        child: PopupMenuButton<WhyFarther>(
          onSelected: (WhyFarther result) {
            setState(() {
              _selection = result;
              Fluttertoast.showToast(msg: '${_selection.toString()}');
            });
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<WhyFarther>>[
            const PopupMenuItem<WhyFarther>(
              value: WhyFarther.harder,
              child: Text('Working a lot harder'),
            ),
            const PopupMenuItem<WhyFarther>(
              value: WhyFarther.smarter,
              child: Text('Being a lot smarter'),
            ),
            const PopupMenuItem<WhyFarther>(
              value: WhyFarther.selfStarter,
              child: Text('Being a self-starter'),
            ),
            const PopupMenuItem<WhyFarther>(
              value: WhyFarther.tradingCharter,
              child: Text('Placed in charge of trading charter'),
            ),
          ],
        ),
      ),
    );
  }
}

// 这是下面的弹出菜单使用的类型。
enum WhyFarther { harder, smarter, selfStarter, tradingCharter }
