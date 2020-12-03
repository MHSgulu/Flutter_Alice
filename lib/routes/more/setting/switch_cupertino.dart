import 'package:alice/routes/cupertino_alice/cupertino_home.dart';
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
    if (value == true) {
      Fluttertoast.showToast(msg: '进入库比蒂诺主题App');
      Navigator.push(context, CupertinoPageRoute(builder: (_) => MyCupertinoApp()));
    }
    if (mounted) {
      setState(() {
        isCupertino = value;
      });
    }
  }
}
