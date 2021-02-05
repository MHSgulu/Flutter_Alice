import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'news_segment_view.dart';

class NewsHomePage extends StatefulWidget {
  @override
  _NewsHomePageState createState() => _NewsHomePageState();
}

class _NewsHomePageState extends State<NewsHomePage> {
  int currentSegment = 0;

  ///没加Key 之前 无法切换视图
  List<Widget> widgetList = [
    NewsSegmentView(key: UniqueKey(), channelName: '头条'),
    NewsSegmentView(key: UniqueKey(), channelName: '新闻'),
    NewsSegmentView(key: UniqueKey(), channelName: '国内'),
    NewsSegmentView(key: UniqueKey(), channelName: '国际'),
  ];
  Map<int, Widget> children = <int, Widget>{
    0: Text('头条'),
    1: Text('新闻'),
    2: Text('国内'),
    3: Text('国际'),
  };

  @override
  void initState() {
    super.initState();
  }

  void onValueChanged(int newValue) {
    if (mounted) {
      setState(() {
        currentSegment = newValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('热点新闻'),
        transitionBetweenRoutes: false,
      ),
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: DefaultTextStyle(
            style: CupertinoTheme.of(context)
                .textTheme
                .textStyle
                .copyWith(fontSize: 14),
            child: cupertinoSegmented2(),
          ),
          transitionBetweenRoutes: false,
        ),
        child: SafeArea(
          child: widgetList[currentSegment],
        ),
      ),
    );
  }

  Widget cupertinoSegmented1() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 6),
      //color: Colors.red,
      width: double.infinity,
      child: CupertinoSegmentedControl<int>(
        children: children,
        onValueChanged: onValueChanged,
        groupValue: currentSegment,
      ),
    );
  }

  Widget cupertinoSegmented2() {
    return Container(
      margin: EdgeInsets.fromLTRB(8, 0, 8, 3),
      //color: Colors.red,
      width: double.infinity,
      child: CupertinoSlidingSegmentedControl<int>(
        children: children,
        onValueChanged: onValueChanged,
        groupValue: currentSegment,
      ),
    );
  }
}
