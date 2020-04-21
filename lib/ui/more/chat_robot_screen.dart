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
        child: Column(
          children: <Widget>[
            ListView.builder(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Text('liebioa');
                }
            ),
            Container(
              child: Text('底部'),
            ),
          ],
        ),
      ),
    );
  }

}