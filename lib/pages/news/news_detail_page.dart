import 'package:alice/common/const/arguments.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class NewsDetailPage extends StatefulWidget {
  @override
  _NewsDetailPageState createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  NewsDetailArguments arg;

  @override
  void didChangeDependencies() {
    arg = ModalRoute.of(context).settings.arguments;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('新闻详情'),
      ),
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(8, 8, 8, 16),
            child: Column(
              children: [
                Text(arg.data.title, style: TextStyle(fontSize: 16)),
                SizedBox(height: 16),
                Text(arg.data.src, style: TextStyle(fontSize: 13)),
                SizedBox(height: 4),
                Text(arg.data.time, style: TextStyle(fontSize: 13)),
                SizedBox(height: 24),
                Html(data: arg.data.content),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
