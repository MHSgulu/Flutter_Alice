import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class TestPlugScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TestPlugScreen();
}

class _TestPlugScreen extends State<TestPlugScreen> {
  String _platformVersion = '未知版本';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      //platformVersion = await Flutterpluginsimple.platformVersion;
    } on PlatformException {
      platformVersion = '获取版本失败.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('官方插件示例'),
      ),
      body: Center(
        child: Text('Android系统版本: $_platformVersion\n'),
      ),
    );
  }
}
