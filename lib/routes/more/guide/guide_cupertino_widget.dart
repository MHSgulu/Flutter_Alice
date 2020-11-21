import 'package:alice/routes/components/cupertino/cupertino_date_picker.dart';
import 'package:alice/routes/components/cupertino/cupertino_picker.dart';
import 'package:alice/widgets/custom/custom_scroll_behavior.dart';
import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class GuideCupertinoWidgetRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GuideCupertinoWidgetRouteState();
}

class GuideCupertinoWidgetRouteState extends State<GuideCupertinoWidgetRoute> {
  List<String> titleList = [
    'CupertinoDatePicker(日期选择器)',
    'CupertinoPicker(iOS样式的选择器)',
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
        Navigator.push(context, MaterialPageRoute(builder: (_) => CupertinoDatePickerExample()));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (_) => CupertinoPickerExample()));
        break;
      case 2:
        break;
    }
  }
}
