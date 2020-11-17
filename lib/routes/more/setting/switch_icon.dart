import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class SwitchIconStyle extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SwitchIconStyleState();
}

class SwitchIconStyleState extends State<SwitchIconStyle> {
  String filename = "assets/animations/smiley_switch.flr";
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black12,
      elevation: 0,
      child: Container(
        height: 50,
        padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
        child: Row(
          children: [
            Text('展示页面的图标风格—MBE'),
            Expanded(child: Container()),
            GestureDetector(
              onTap: switchIconStyle,
              child: Container(
                width: 100,
                child: FlareActor(
                  filename,
                  animation: isOn ? "On" : "Off",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void switchIconStyle() {
    if(mounted){
      setState(() {
        isOn = ! isOn;
      });
    }
  }
}
