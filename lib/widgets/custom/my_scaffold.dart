import 'package:flutter/material.dart';

class MyScaffold extends StatefulWidget{
  @override
  _MyScaffoldState createState() => _MyScaffoldState();
}

class _MyScaffoldState extends State<MyScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///如果为true，则[body]和脚手架的浮动小部件应自行调整大小，以避免屏幕键盘的高度由周围的[MediaQuery]的[MediaQueryData.viewInsets] bottom属性定义。
      ///例如，如果在支架上方显示了屏幕键盘，则可以调整主体的大小以避免键盘重叠，这可以防止键盘遮挡主体内的小部件。
      ///默认为true。
      resizeToAvoidBottomInset: true,
    );
  }
}