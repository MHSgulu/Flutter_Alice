import 'package:alice/common/network/http_util.dart';
import 'package:alice/model/today_epidemic_data_entity.dart';
import 'package:alice/routes/drawer/my_drawer.dart';
import 'package:alice/widgets/custom/custom_scroll_behavior.dart';
import 'package:alice/widgets/custom/my_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:alice/widgets/custom/my_appbar.dart';

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
        label: '疫情数据',
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu_rounded),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      body: data == null ? MyLoadingIndicator() : bodyView(),
      drawer: MyDrawer(),
    );
  }

  Widget bodyView() {
    return ScrollConfiguration(
      behavior: CustomScrollBehavior(),
      child: ListView(
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
                  '数据更新至 ${data.updateTime} ',
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
          dataTableView(),
          SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget dataTableView() {
    return DataTable(
      columns: [
        DataColumn(
          label: Text(
            '类型',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            '总数',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            '昨日+',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      ],
      rows: [
        DataRow(
          cells: <DataCell>[
            DataCell(Text('现有确诊')),
            DataCell(Text(
              '${data.todayStatictic.confirmedNum}',
              style: TextStyle(color: Color(0xFFFF6A57)),
            )),
            DataCell(
              Text(
                '${data.todayStatictic.confirmedIncr - data.todayStatictic.curedIncr - data.todayStatictic.deadIncr}',
                style: TextStyle(color: Color(0xFFFF6A57)),
              ),
            ),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('无症状')),
            DataCell(Text(
              '${data.todayStatictic.asymptomaticNum}',
              style: TextStyle(color: Color(0xFFEA7648)),
            )),
            DataCell(Text(
              '${data.todayStatictic.asymptomaticIncr}',
              style: TextStyle(color: Color(0xFFEA7648)),
            )),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('现有疑似')),
            DataCell(Text(
              '${data.todayStatictic.suspectedNum}',
              style: TextStyle(color: Color(0xFFEC9217)),
            )),
            DataCell(Text(
              '${data.todayStatictic.suspectedIncr}',
              style: TextStyle(color: Color(0xFFEC9217)),
            )),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('现有重症')),
            DataCell(Text(
              '${data.todayStatictic.seriousNum}',
              style: TextStyle(color: Color(0xFF545499)),
            )),
            DataCell(Text(
              '${data.todayStatictic.seriousIncr}',
              style: TextStyle(color: Color(0xFF545499)),
            )),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('境外输入')),
            DataCell(Text(
              '${data.todayStatictic.externalConfirmedNum}',
              style: TextStyle(color: Color(0xFF476DAB)),
            )),
            DataCell(Text(
              '${data.todayStatictic.externalConfirmedIncr}',
              style: TextStyle(color: Color(0xFF476DAB)),
            )),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('累计确诊')),
            DataCell(Text(
              '${data.todayStatictic.curedNum + data.todayStatictic.deadNum + data.todayStatictic.confirmedNum}',
              style: TextStyle(color: Color(0xFFE83132)),
            )),
            DataCell(Text(
              '${data.todayStatictic.confirmedIncr}',
              style: TextStyle(color: Color(0xFFE83132)),
            )),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('累计治愈')),
            DataCell(Text(
              '${data.todayStatictic.curedNum}',
              style: TextStyle(color: Color(0xFF26AEB5)),
            )),
            DataCell(Text(
              '${data.todayStatictic.curedIncr}',
              style: TextStyle(color: Color(0xFF26AEB5)),
            )),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('累计死亡')),
            DataCell(Text(
              '${data.todayStatictic.deadNum}',
              style: TextStyle(color: Color(0xFF4D5054)),
            )),
            DataCell(Text(
              '${data.todayStatictic.deadIncr}',
              style: TextStyle(color: Color(0xFF4D5054)),
            )),
          ],
        ),
      ],
      showBottomBorder: true,
      dividerThickness: 1.0,
    );
  }
}
