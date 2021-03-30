import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SwitchMaterialTheme extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SwitchMaterialThemeState();
}

class SwitchMaterialThemeState extends State<SwitchMaterialTheme> {
  bool isMaterial = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 50,
        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Row(
          children: [
            Text('Material 主题'),
            Expanded(child: Container()),
            Switch(
              value: isMaterial,
              onChanged: switchToMaterialTheme,
            ),
          ],
        ),
      ),
    );
  }

  switchToMaterialTheme(bool value) {
    if (value == true) {
      Fluttertoast.showToast(msg: '当前主题已为Material');
    } else {
      Fluttertoast.showToast(msg: '默认主题就这样了，o(╯□╰)o');
    }
    if (mounted) {
      setState(() {
        isMaterial = value;
      });
    }
  }
}
