import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PluginGetBattery extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PluginGetBatteryState();
}

class _PluginGetBatteryState extends State<PluginGetBattery> {
  static const platform = const MethodChannel('samples.flutter.io/battery');

  String _batteryLevel = '未知电量.';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = '电量目前 $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "获取电量失败: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter中文网示例'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RaisedButton(
              child: Text('点击获取手机电量'),
              onPressed: _getBatteryLevel,
            ),
            Text(_batteryLevel),
          ],
        ),
      ),
    );
  }
}
