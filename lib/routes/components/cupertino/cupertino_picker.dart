import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CupertinoPickerExample extends StatefulWidget {
  @override
  _CupertinoPickerExampleState createState() => _CupertinoPickerExampleState();
}

class _CupertinoPickerExampleState extends State<CupertinoPickerExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: '库比蒂诺选择器',
        onPressedBack: () {
          Navigator.pop(context);
        },
      ),
      body: Center(
        child: CupertinoButton(
          child: Text('CupertinoPicker'),
          onPressed: () => showPicker(),
        ),
      ),
    );
  }

  /// CupertinoPicker，该类实现与内容无关的Spinner UI。
  void showPicker() {
    showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return Container(
            height: 200,
            child: CupertinoPicker(
              itemExtent: 50.0,
              onSelectedItemChanged: (value) {
                Fluttertoast.showToast(msg: '$value');
              },
              children: [
                Text('马什么梅？'),
                Text('什么冬梅？'),
                Text('马东什么？'),
              ],
              backgroundColor: Colors.white,
            ),
          );
        });
  }
}
