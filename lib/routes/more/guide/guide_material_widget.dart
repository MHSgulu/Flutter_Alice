import 'package:alice/routes/components/material/material_banner.dart';
import 'package:alice/routes/components/material/material_bottom_sheet.dart';
import 'package:alice/routes/components/material/material_button.dart';
import 'package:alice/routes/components/material/material_date_pickers.dart';
import 'package:alice/routes/components/material/material_dialog.dart';
import 'package:alice/routes/components/material/material_slider.dart';
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
    'Button(按钮)',
    'Date pickers(日期选择器)',
    'Time pickers(时间选择器)',
    'Dialog(对话框)',
    'BottomSheet(底页)',
    'Slider(滑杆)',
    'Banner(标语)',
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
        Navigator.push(context, MaterialPageRoute(builder: (_) => MaterialButtonRoute()));
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (_) => MaterialTimePickers()));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (_) => MaterialDatePickers()));
        break;
      case 4:
        Navigator.push(context, MaterialPageRoute(builder: (_) => MaterialDialog()));
        break;
      case 5:
        Navigator.push(context, MaterialPageRoute(builder: (_) => MaterialBottomSheet()));
        break;
      case 6:
        Navigator.push(context, MaterialPageRoute(builder: (_) => MaterialSlider()));
        break;
      case 7:
        Navigator.push(context, MaterialPageRoute(builder: (_) => MaterialBannerRoute()));
        break;
    }
  }
}
