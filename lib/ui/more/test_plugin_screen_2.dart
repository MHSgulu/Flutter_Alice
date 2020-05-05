import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

//import 'package:flutterpluginsimple/flutterpluginsimple.dart';


class TestPlugScreen2 extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _TestPlugScreen();
  }

}


class _TestPlugScreen extends State<TestPlugScreen2>{

  String _battery = 'Unknown';

  @override
  void initState() {
    super.initState();
    initBatteryState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initBatteryState() async {
    String battery;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      //battery = 'Battery level at ${await Flutterpluginsimple.battery}';
    } on PlatformException {
      battery = 'Failed to get battery level:';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _battery = battery;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: $_battery\n'),
        ),
      ),
    );
  }





}
