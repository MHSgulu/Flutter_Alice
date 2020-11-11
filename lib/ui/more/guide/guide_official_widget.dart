import 'package:alice/custom/custom_scroll_behavior.dart';
import 'package:alice/custom/my_appbar.dart';
import 'package:alice/ui/example/official/widget/example_nested_scroll_view_1.dart';
import 'package:alice/ui/example/official/widget/example_nested_scroll_view_2.dart';
import 'package:alice/ui/example/official/widget/example_nested_scroll_view_3.dart';

import 'package:flutter/material.dart';

class GuideOfficialWidgetRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GuideOfficialWidgetRouteState();
}

class GuideOfficialWidgetRouteState extends State<GuideOfficialWidgetRoute> {
  List<String> titleList = [
    'NestedScrollView 示例1(结合TabBar)',
    'NestedScrollView 示例2',
    'NestedScrollView 示例3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'Widget',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: ScrollConfiguration(
        behavior: CustomScrollBehavior(
            isShowLeading: true,
            isShowTrailing: true,
            color: Colors.indigo[400]),
        child: ListView.builder(
          itemCount: titleList.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(4),
                ),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () => jumpToRoute(index),
                  splashColor: Colors.indigo[100],
                  child: ListTile(
                    title: Text(titleList[index]),
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
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => NestedScrollViewExample1()));
        break;
      case 1:
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => NestedScrollViewExample2()));
        break;
      case 2:
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => NestedScrollViewExample3()));
        break;
      /*case 3:
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => BarChartSample4()));
        break;
      case 4:
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => BarChartSample5()));
        break;
      case 5:
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => LineChartSample1()));
        break;
      case 6:
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => LineChartSample2()));
        break;
      case 7:
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => LineChartSample3()));
        break;
      case 8:
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => LineChartSample4()));
        break;
      case 9:
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => LineChartSample5()));
        break;
      case 10:
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => LineChartSample6()));
        break;
      case 11:
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => LineChartSample7()));
        break;
      case 12:
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => PieChartSample1()));
        break;
      case 13:
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => PieChartSample2()));
        break;
      case 14:
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => PieChartSample3()));
        break;*/
    }
  }
}
