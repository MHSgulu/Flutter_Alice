import 'package:alice/custom/custom_scroll_behavior.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class NewsDetailScreen extends StatelessWidget {
  final String title;
  final String src;
  final String time;
  final String content;

  NewsDetailScreen(
      {Key key,
      @required this.title,
      @required this.src,
      @required this.time,
      @required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('新闻详情',style: TextStyle(color: Colors.black, fontSize: 17),),
        elevation: 1,
      ),
      body: ScrollConfiguration(
          behavior: CustomScrollBehavior(false, false, null),
          child: SingleChildScrollView(
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
                    data: content,
                  ),
                ],
              ),
            ),
          ),
      ),
    );
  }
}
