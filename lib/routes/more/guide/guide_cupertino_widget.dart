import 'package:alice/routes/components/cupertino/cupertino_context_menu.dart';
import 'package:alice/routes/components/cupertino/cupertino_navigationbar.dart';
import 'package:alice/routes/components/cupertino/cupertino_picker.dart';
import 'package:alice/routes/components/cupertino/cupertino_refresh.dart';
import 'package:alice/routes/components/cupertino/cupertino_segmented.dart';
import 'package:alice/routes/components/cupertino/cupertino_switch.dart';
import 'package:alice/routes/components/cupertino/cupertino_tabbar.dart';
import 'package:alice/routes/components/cupertino/cupertino_textfield.dart';
import 'package:alice/routes/components/cupertino/cupertinol_activity_indicator.dart';
import 'package:alice/routes/components/cupertino/cupertinol_button.dart';
import 'package:alice/routes/components/cupertino/cupertinol_dialog.dart';
import 'package:alice/routes/components/cupertino/cupertinol_slider.dart';
import 'package:alice/widgets/custom/custom_scroll_behavior.dart';
import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:alice/widgets/custom/my_list_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class GuideCupertinoWidgetRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GuideCupertinoWidgetRouteState();
}

class GuideCupertinoWidgetRouteState extends State<GuideCupertinoWidgetRoute> {
  List<String> titleList = [
    'CupertinoActivityIndicator(活动指示器)',
    'Cupertino(提醒对话框)',
    'CupertinoButton(按钮)',
    'CupertinoContextMenu(上下文菜单)',
    'CupertinoNavigationBar(导航栏)',
    'CupertinoPicker(选择器)',
    'CupertinoSliverRefreshControl(下拉刷新)',
    'Cupertino(分段控件)',
    'CupertinoSlider(滑块)',
    'CupertinoSwitch(开关)',
    'CupertinoTabBar(标签页栏)',
    'CupertinoTextField(文本字段)',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'cupertino widget',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: ScrollConfiguration(
        behavior: CustomScrollBehavior(
            isShowLeading: true,
            isShowTrailing: true,
            color: Colors.indigo[400],
        ),
        child: ListView.builder(
          itemCount: titleList.length,
          itemBuilder: (context, index) {
            return MyCardTile(
              text: titleList[index],
              onTap: () => jumpToRoute(index),
            );
          },
        ),
      ),
    );
  }

  void jumpToRoute(int index) {
    switch (index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (_) => CupertinoProgressIndicatorDemo()));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (_) => CupertinoDialogDemoRoute()));
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (_) => CupertinoButtonRoute()));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (_) => CupertinoContextMenuDemo()));
        break;
      case 4:
        Navigator.push(context, MaterialPageRoute(builder: (_) => CupertinoNavigationBarDemo()));
        break;
      case 5:
        Navigator.push(context, MaterialPageRoute(builder: (_) => CupertinoPickerDemo()));
        break;
      case 6:
        Navigator.push(context, MaterialPageRoute(builder: (_) => CupertinoRefreshControlDemo()));
        break;
      case 7:
        Navigator.push(context, MaterialPageRoute(builder: (_) => CupertinoSegmentedControlDemo()));
        break;
      case 8:
        Navigator.push(context, MaterialPageRoute(builder: (_) => CupertinoSliderDemo()));
        break;
      case 9:
        Navigator.push(context, MaterialPageRoute(builder: (_) => CupertinoSwitchDemo()));
        break;
      case 10:
        Navigator.push(context, MaterialPageRoute(builder: (_) => CupertinoTabBarDemo()));
        break;
      case 11:
        Navigator.push(context, MaterialPageRoute(builder: (_) => CupertinoTextFieldDemo()));
        break;
    }
  }
}
