import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';



class MaterialTimePickers extends StatefulWidget {
  @override
  _MaterialTimePickersState createState() => _MaterialTimePickersState();
}

class _MaterialTimePickersState extends State<MaterialTimePickers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: '时间选择器',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () => show1(),
              child: Text('showTimePicker'),
            ),
          ),
          Text('显示一个与initialTime当前时间相等的对话框'),
          SizedBox(height: 20,),
          Center(
            child: ElevatedButton(
              onPressed: () => show2(),
              child: Text('showTimePicker'),
            ),
          ),
          Text('显示一个对话框，其文本方向被重写为TextDirection.rtl。'),
          SizedBox(height: 20,),
          Center(
            child: ElevatedButton(
              onPressed: () => show3(),
              child: Text('showTimePicker'),
            ),
          ),
          Text('显示一个对话框，其中时间以24小时格式无条件显示。'),
        ],
      ),
    );
  }

  ///显示一个包含材料设计时间选择器的对话框。
  ///返回的Future解析为用户关闭对话框时用户选择的时间。如果用户取消对话框，则返回null。
  ///TimePickerThemeData，它允许您自定义时间选择器的颜色，版式和形状。

  ///显示一个与initialTime当前时间相等的对话框。
  void show1() async {
    TimeOfDay result = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    Fluttertoast.showToast(msg: '$result');
  }

  ///显示一个对话框，其文本方向被重写为TextDirection.rtl。
  void show2() async {
    TimeOfDay result = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child,
        );
      },
    );
    Fluttertoast.showToast(msg: '$result');
  }

  ///显示一个对话框，其中时间以24小时格式无条件显示。
  void show3() async {
    TimeOfDay result = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child,
        );
      },
    );
    Fluttertoast.showToast(msg: '$result');
  }
}
