import 'package:alice/custom/custom_scroll_behavior.dart';
import 'package:alice/ui/example/chart/fl_chart_bar_sample_1.dart';
import 'package:alice/ui/example/chart/fl_chart_bar_sample_2.dart';
import 'package:alice/ui/example/chart/fl_chart_bar_sample_3.dart';
import 'package:alice/ui/example/chart/fl_chart_bar_sample_4.dart';
import 'package:alice/ui/example/chart/fl_chart_bar_sample_5.dart';
import 'package:alice/ui/example/chart/fl_chart_line_sample_1.dart';
import 'package:alice/ui/example/chart/fl_chart_line_sample_2.dart';
import 'package:alice/ui/example/chart/fl_chart_line_sample_3.dart';
import 'package:alice/ui/example/chart/fl_chart_line_sample_4.dart';
import 'package:alice/ui/example/chart/fl_chart_line_sample_5.dart';
import 'package:alice/ui/example/chart/fl_chart_line_sample_6.dart';
import 'package:alice/ui/example/chart/fl_chart_line_sample_7.dart';
import 'package:alice/ui/example/chart/fl_chart_pie_sample_1.dart';
import 'package:alice/ui/example/chart/fl_chart_pie_sample_2.dart';
import 'package:alice/ui/example/chart/fl_chart_pie_sample_3.dart';
import 'package:flutter/material.dart';

class GuideChartRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GuideChartRouteState();
}

class GuideChartRouteState extends State<GuideChartRoute> {
  List<String> titleList = [
    'fl_chart 条形图 示例1',
    'fl_chart 条形图 示例2',
    'fl_chart 条形图 示例3',
    'fl_chart 条形图 示例4',
    'fl_chart 条形图 示例5',
    'fl_chart 折线图 示例1',
    'fl_chart 折线图 示例2',
    'fl_chart 折线图 示例3',
    'fl_chart 折线图 示例4',
    'fl_chart 折线图 示例5',
    'fl_chart 折线图 示例6',
    'fl_chart 折线图 示例7',
    'fl_chart 饼状图 示例1',
    'fl_chart 饼状图 示例2',
    'fl_chart 饼状图 示例3',
  ];

  void jumpToRoute(int index) {
    switch (index) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => BarChartSample1()));
        break;
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => BarChartSample2()));
        break;
      case 2:
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => BarChartSample3()));
        break;
      case 3:
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
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('图表示例'),
        backgroundColor: Colors.blueGrey[400],
      ),
      body: ScrollConfiguration(
        behavior: CustomScrollBehavior(
            isShowLeading: true,
            isShowTrailing: true,
            color: Colors.blueGrey[400]),
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
                  splashColor: Colors.blueGrey[100],
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
}
