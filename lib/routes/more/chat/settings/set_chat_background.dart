import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';

class SetChatBackgroundRoute extends StatefulWidget{
  @override
  _SetChatBackgroundRouteState createState() => _SetChatBackgroundRouteState();
}

class _SetChatBackgroundRouteState extends State<SetChatBackgroundRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: '聊天背景',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: Container(

      ),
    );
  }
}

