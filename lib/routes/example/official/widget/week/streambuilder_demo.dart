import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';

class StreamBuilderDemo extends StatefulWidget{
  @override
  _StreamBuilderDemoState createState() => _StreamBuilderDemoState();
}

class _StreamBuilderDemoState extends State<StreamBuilderDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'StreamBuilder',
        onPressedBack: () => Navigator.pop(context),
      ),
    );
  }
}