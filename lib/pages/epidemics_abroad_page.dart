import 'package:alice/common/const/constant.dart';
import 'package:alice/common/network/http_util.dart';
import 'package:alice/model/epidemics_abroad_data_entity.dart';
import 'package:alice/widgets/custom/my_cupertino_navigationbar.dart';
import 'package:alice/widgets/custom/my_loading_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EpidemicsAbroadPage extends StatefulWidget {
  @override
  _EpidemicsAbroadPageState createState() => _EpidemicsAbroadPageState();
}

class _EpidemicsAbroadPageState extends State<EpidemicsAbroadPage> {
  EpidemicsAbroadDataShowapiResBody dataEntity;
  List<_Row> _rows = List();

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() async {
    var result = await HttpUtil.fetchForeignCOVID_19Data();
    if (result.showapiResCode == 0) {
      if (mounted) {
        setState(() {
          dataEntity = result.showapiResBody;
          dataEntity.foreignList.forEach((e) {
            _rows.add(_Row(
              e.areaName,
              e.yesterdayIncInfo.confirmedInc,
              e.currentConfirmedNum,
              e.confirmedNum,
              e.curedNum,
              e.deadNum,
            ));
          });
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: MyCupertinoNavigationBar(
        /*leading: CupertinoButton(
          child: Icon(Icons.menu_rounded),
          padding: EdgeInsets.zero,
          minSize: 24,
          onPressed: () => Navigator.pushNamed(context, PageName.settingsPage),
        ),*/
        title: '国外疫情',
      ),
      child: dataEntity == null
          ? MyLoadingIndicator(
              style: Constant.cupertino,
            )
          : dataTableView(),
    );
  }

  Widget dataTableView() {
    return ListView(
      children: [
        PaginatedDataTable(
          showCheckboxColumn: false,
          rowsPerPage: 8,
          header: Text(
            '国外各国家疫情统计汇总',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          columns: [
            DataColumn(label: Text('地区')),
            DataColumn(label: Text('新增')),
            DataColumn(label: Text('现有')),
            DataColumn(label: Text('确诊')),
            DataColumn(label: Text('治愈')),
            DataColumn(label: Text('死亡')),
          ],
          source: _DataSource(context, _rows),
        ),
      ],
    );
  }

}

class _Row {
  _Row(
    this.area,
    this.valueB,
    this.valueC,
    this.valueD,
    this.valueE,
    this.valueF,
  );

  final String area;
  final int valueB;
  final int valueC;
  final int valueD;
  final int valueE;
  final int valueF;

  bool selected = false;
}

class _DataSource extends DataTableSource {
  final BuildContext context;
  final List<_Row> _rows;

  _DataSource(this.context, this._rows);

  int _selectedCount = 0;

  @override
  DataRow getRow(int index) {
    assert(index >= 0);
    if (index >= _rows.length) return null;
    final row = _rows[index];
    return DataRow.byIndex(
      index: index,
      selected: row.selected,
      onSelectChanged: (value) {
        if (row.selected != value) {
          _selectedCount += value ? 1 : -1;
          assert(_selectedCount >= 0);
          row.selected = value;
          notifyListeners();
        }
      },
      cells: [
        DataCell(Text(row.area)),
        DataCell(Text(row.valueB.toString())),
        DataCell(Text(row.valueC.toString())),
        DataCell(Text(row.valueD.toString())),
        DataCell(Text(row.valueE.toString())),
        DataCell(Text(row.valueF.toString())),
      ],
    );
  }

  @override
  int get rowCount => _rows.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}
