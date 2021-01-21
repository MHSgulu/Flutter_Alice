import 'package:alice/model/today_epidemic_data_entity.dart';
import 'package:flutter/material.dart';

class DomesticEpidemicsSummaryDataView extends StatelessWidget{
  final TodayEpidemicDataShowapiResBodyTodayStatictic data;

  const DomesticEpidemicsSummaryDataView({Key key, @required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      showCheckboxColumn: false,
      showBottomBorder: true,
      dividerThickness: 1.0,
      columns: [
        DataColumn(label: Text('类型')),
        DataColumn(label: Text('总数')),
        DataColumn(label: Text('昨日+')),
      ],
      rows: [
        DataRow(
          cells: <DataCell>[
            DataCell(Text('现有确诊')),
            DataCell(Text(
              '${data.confirmedNum}',
              style: TextStyle(color: Color(0xFFFF6A57)),
            )),
            DataCell(
              Text(
                '${data.confirmedIncr - data.curedIncr - data.deadIncr}',
                style: TextStyle(color: Color(0xFFFF6A57)),
              ),
            ),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('无症状')),
            DataCell(Text(
              '${data.asymptomaticNum}',
              style: TextStyle(color: Color(0xFFEA7648)),
            )),
            DataCell(Text(
              '-1',
              style: TextStyle(color: Color(0xFFEA7648)),
            )),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('现有疑似')),
            DataCell(Text(
              '${data.suspectedNum}',
              style: TextStyle(color: Color(0xFFEC9217)),
            )),
            DataCell(Text(
              '${data.suspectedIncr}',
              style: TextStyle(color: Color(0xFFEC9217)),
            )),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('现有重症')),
            DataCell(Text(
              '${data.seriousNum}',
              style: TextStyle(color: Color(0xFF545499)),
            )),
            DataCell(Text(
              '${data.seriousIncr}',
              style: TextStyle(color: Color(0xFF545499)),
            )),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('境外输入')),
            DataCell(Text(
              '${data.externalConfirmedNum}',
              style: TextStyle(color: Color(0xFF476DAB)),
            )),
            DataCell(Text(
              '${data.externalConfirmedIncr}',
              style: TextStyle(color: Color(0xFF476DAB)),
            )),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('累计确诊')),
            DataCell(Text(
              '${data.curedNum + data.deadNum + data.confirmedNum}',
              style: TextStyle(color: Color(0xFFE83132)),
            )),
            DataCell(Text(
              '${data.confirmedIncr}',
              style: TextStyle(color: Color(0xFFE83132)),
            )),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('累计治愈')),
            DataCell(Text(
              '${data.curedNum}',
              style: TextStyle(color: Color(0xFF26AEB5)),
            )),
            DataCell(Text(
              '${data.curedIncr}',
              style: TextStyle(color: Color(0xFF26AEB5)),
            )),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('累计死亡')),
            DataCell(Text(
              '${data.deadNum}',
              style: TextStyle(color: Color(0xFF4D5054)),
            )),
            DataCell(Text(
              '${data.deadIncr}',
              style: TextStyle(color: Color(0xFF4D5054)),
            )),
          ],
        ),
      ],
    );
  }

}

