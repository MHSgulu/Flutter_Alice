import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


/*智能聊天机器人菲菲*/




class ChatRobotScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return ChatRobotScreenState();
  }

}


class ChatRobotScreenState extends State<ChatRobotScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('菲菲聊天室'),
      ),
      body: Container(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
                  return Text('liebioa');
          }
            ),
      ),
    );
  }

}