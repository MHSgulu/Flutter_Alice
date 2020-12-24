import 'package:alice/routes/example/official/favorite/sqflite/example_sqflite.dart';
import 'package:alice/widgets/custom/custom_scroll_behavior.dart';
import 'package:alice/widgets/custom/my_appbar.dart';

import 'package:flutter/material.dart';

class GuideFlutterFavoriteRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GuideGuideFlutterFavoriteRouteState();
}

class GuideGuideFlutterFavoriteRouteState extends State<GuideFlutterFavoriteRoute> {
  List<String> titleList = [
    'sqflite',
  ];

  List<String> subTitleList = [
    'SQLite的Flutter插件，这是一个自包含的，高可靠性的嵌入式SQL数据库引擎',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'Flutter Favorite',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: ScrollConfiguration(
        behavior: CustomScrollBehavior(
            isShowLeading: true,
            isShowTrailing: true,
            color: Colors.indigo[400],
        ),
        child: ListView.builder(
          itemCount: titleList.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () => jumpToRoute(index),
                  splashColor: Colors.indigo[100],
                  child: ListTile(
                    title: Text(titleList[index]),
                    subtitle: Text(subTitleList[index]),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void jumpToRoute(int index) {
    switch (index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (_) => ExampleSqlLite()));
        break;
    }
  }
}
