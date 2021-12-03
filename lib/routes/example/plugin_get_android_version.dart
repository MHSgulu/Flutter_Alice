import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class PluginGetVersion extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _PluginGetVersionState();
  }

}



class _PluginGetVersionState extends State<PluginGetVersion> {
  static const platform = const MethodChannel('com.ow.alice/android-version');

  String _androidVersion = '未知版本';

  Future<void> _getAndroidVersion() async {
    String androidVersion;
    try {
      final String result = await platform.invokeMethod('getAndroidVersion');
      androidVersion = '当前版本 $result ';
    } on PlatformException catch (e) {
      androidVersion = "获取版本失败: '${e.message}'";
    }

    setState(() {
      _androidVersion = androidVersion;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('整合示例'),
      ),
      body: Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            new ElevatedButton(
              child: new Text('点击获取安卓版本'),
              onPressed: _getAndroidVersion,
            ),
            new Text(_androidVersion),
          ],
        ),
      ),
    );
  }





}