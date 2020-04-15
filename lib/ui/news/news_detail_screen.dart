import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;


class NewsDetailScreen extends StatelessWidget{

  final String title;
  final String src;
  final String time;
  final String content;

  NewsDetailScreen({Key key, @required this.title, @required this.src, @required this.time, @required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[200],
        title: Text('新闻详情'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 16),
                child: Text(title, style: TextStyle(fontSize: 16.0)),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 4),
                child: Text(src, style: TextStyle(fontSize: 13.0)),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 24),
                child: Text(time, style: TextStyle(fontSize: 13.0)),
              ),
              Html(
          data: """${content}""",
        ),
            ],
          ),
        ),
    ),
    );
  }

}