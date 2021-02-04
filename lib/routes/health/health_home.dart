import 'package:alice/common/network/http_util.dart';
import 'package:alice/model/today_epidemic_data_entity.dart';
import 'package:alice/routes/drawer/my_drawer.dart';
import 'package:alice/routes/health/region_statistics_route.dart';
import 'package:alice/widgets/custom/custom_scroll_behavior.dart';
import 'package:alice/widgets/custom/my_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'domestic/data_table_view.dart';

class HealthHome extends StatefulWidget {
  @override
  _HealthHomeState createState() => _HealthHomeState();
}

class _HealthHomeState extends State<HealthHome> {
  TodayEpidemicDataShowapiResBody data;

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() async {
    var result = await HttpUtil.fetchTodayCOVID_19Data();
    if (result.showapiResCode == 0) {
      if (mounted) {
        setState(() {
          data = result.showapiResBody;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        backgroundColor: Colors.cyan[300],
        brightness: Brightness.dark,
        label: '疫情数据',
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu_rounded),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      body: data == null
          ? MyLoadingIndicator(
              valueColor: Colors.cyan[300],
            )
          : bodyView(),
      drawer: MyDrawer(),
    );
  }

  Widget bodyView() {
    return ScrollConfiguration(
      behavior: CustomScrollBehavior(),
      child: ListView(
        padding: EdgeInsets.only(bottom: 20),
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(12, 12, 0, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '国内疫情',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '数据更新至 ${data.updateTime}',
                  style: TextStyle(
                    //color: Colors.black54,
                    fontSize: 13,
                  ),
                ),
                Text(
                  '(字段值为-1时表示暂无该数据)',
                  style: TextStyle(
                    //color: Colors.black54,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          DomesticEpidemicsSummaryDataView(
            data: data.todayStatictic,
          ),
          SizedBox(height: 50),
          Center(
            child: ElevatedButton(
              onPressed: _jumpToPage,
              child: Text('国内各地区疫情统计汇总'),
            ),
          ),
        ],
      ),
    );
  }

  void _jumpToPage() {
    if(data.todayDetailList.isNotEmpty){
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => RegionStatisticsRoute(data: data.todayDetailList)));
    }else{
      Fluttertoast.showToast(msg: '暂无今日国内各地区疫情统计数据');
    }

  }
}
