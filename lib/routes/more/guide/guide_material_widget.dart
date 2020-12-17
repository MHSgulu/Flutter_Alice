import 'package:alice/routes/components/material/demo/demo_bottomappbar.dart';
import 'package:alice/routes/components/material/demo/demo_colors.dart';
import 'package:alice/routes/components/material/demo/demo_textfield.dart';
import 'package:alice/routes/components/material/demo/demo_tooltip.dart';
import 'package:alice/routes/components/material/demo/demo_typesetting.dart';
import 'package:alice/routes/components/material/material_banner.dart';
import 'package:alice/routes/components/material/material_bottom_sheet.dart';
import 'package:alice/routes/components/material/material_button.dart';
import 'package:alice/routes/components/material/material_chip.dart';
import 'package:alice/routes/components/material/material_data_tables.dart';
import 'package:alice/routes/components/material/material_date_pickers.dart';
import 'package:alice/routes/components/material/material_dialog.dart';
import 'package:alice/routes/components/material/material_drawer.dart';
import 'package:alice/routes/components/material/material_menu.dart';
import 'package:alice/routes/components/material/material_select.dart';
import 'package:alice/routes/components/material/material_slider.dart';
import 'package:alice/routes/components/material/material_snackbar.dart';
import 'package:alice/routes/components/material/material_time_pickers.dart';
import 'package:alice/routes/example/official/example_google_fonts.dart';
import 'package:alice/widgets/custom/custom_scroll_behavior.dart';
import 'package:alice/widgets/custom/my_appbar.dart';

import 'package:flutter/material.dart';

class GuideMaterialWidgetRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GuideMaterialWidgetRouteState();
}

class GuideMaterialWidgetRouteState extends State<GuideMaterialWidgetRoute> {
  List<String> titleList = [
    'google_fonts(谷歌字体)',
    'MD中各种字体排版样式的定义',
    'MD调色板的颜色和色样数量',
    'Button(按钮)',
    'Time pickers(时间选择器)',
    'Date pickers(日期选择器)',
    'Dialog(对话框)',
    'BottomSheet(底页)',
    'Slider(滑杆)',
    'Banner(横幅)',
    'Data tables(数据表)',
    '选择控件(单选、复选、开关)',
    'Chip(芯片)',
    'SnackBar',
    'Drawer(抽屉)',
    'Menu(菜单)',
    'BottomAppBar(底部应用栏)',
    'TextField(文本字段)',
    'ToolTip(工具提示)',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
      label: 'material widget',
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
            return Container(
              padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(4),
                ),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () => jumpToRoute(index),
                  splashColor: Colors.indigo[100],
                  child: ListTile(
                    title: Text(titleList[index]),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void jumpToRoute(int index) {
    switch (index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (_) => GoogleFontsPage()));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (_) => TypographyDemo()));
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (_) => ColorsDemo()));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (_) => MaterialButtonRoute()));
        break;
      case 4:
        Navigator.push(context, MaterialPageRoute(builder: (_) => MaterialTimePickers()));
        break;
      case 5:
        Navigator.push(context, MaterialPageRoute(builder: (_) => MaterialDatePickers()));
        break;
      case 6:
        Navigator.push(context, MaterialPageRoute(builder: (_) => MaterialDialog()));
        break;
      case 7:
        Navigator.push(context, MaterialPageRoute(builder: (_) => MaterialBottomSheet()));
        break;
      case 8:
        Navigator.push(context, MaterialPageRoute(builder: (_) => MaterialSlider()));
        break;
      case 9:
        Navigator.push(context, MaterialPageRoute(builder: (_) => MaterialBannerRoute()));
        break;
      case 10:
        Navigator.push(context, MaterialPageRoute(builder: (_) => DataTableDemo()));
        break;
      case 11:
        Navigator.push(context, MaterialPageRoute(builder: (_) => MaterialSelect()));
        break;
      case 12:
        Navigator.push(context, MaterialPageRoute(builder: (_) => MaterialChip()));
        break;
      case 13:
        Navigator.push(context, MaterialPageRoute(builder: (_) => MaterialSnackDemo()));
        break;
      case 14:
        Navigator.push(context, MaterialPageRoute(builder: (_) => NavigationDrawerDemo()));
        break;
      case 15:
        Navigator.push(context, MaterialPageRoute(builder: (_) => MenuDemo()));
        break;
      case 16:
        Navigator.push(context, MaterialPageRoute(builder: (_) => BottomAppBarDemo()));
        break;
      case 17:
        Navigator.push(context, MaterialPageRoute(builder: (_) => TextFieldDemo()));
        break;
      case 18:
        Navigator.push(context, MaterialPageRoute(builder: (_) => TooltipDemo()));
        break;
    }
  }
}
