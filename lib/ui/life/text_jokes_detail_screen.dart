import 'package:alice/model/written_jokes_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class TextJokeDetailScreen extends StatelessWidget{

  final String text;

  TextJokeDetailScreen({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent[100],
          title: Text('文本笑话'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Text(text),
          ),
        ),
    );
  }

}