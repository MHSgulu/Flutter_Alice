import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';


class MoreFunctionListRoute extends StatefulWidget{
  @override
  _MoreFunctionListRouteState createState() => _MoreFunctionListRouteState();
}

class _MoreFunctionListRouteState extends State<MoreFunctionListRoute> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: '感觉挺黑科技其实没啥用的功能',
        onPressedBack: () => Navigator.pop(context),
      ),
    );
  }
}