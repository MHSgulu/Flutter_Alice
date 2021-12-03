import 'package:alice/model/today_epidemic_data_entity.dart';
import 'package:alice/widgets/custom/lato_text.dart';
import 'package:flutter/material.dart';

class VariousRegionsPaginatedDataTable extends StatefulWidget {
  final List<TodayEpidemicDataShowapiResBodyTodayDetailList> data;

  const VariousRegionsPaginatedDataTable({Key key, @required this.data})
      : super(key: key);

  @override
  _VariousRegionsPaginatedDataTableState createState() =>
      _VariousRegionsPaginatedDataTableState();
}

class _VariousRegionsPaginatedDataTableState
    extends State<VariousRegionsPaginatedDataTable> {
  List<_Row> _rows = [];

  int _currentRowsPerPage = 8; //当前行数

  @override
  void initState() {
    widget.data.forEach((e) {
      _rows.add(_Row(
        e.provinceName,
        e.suspectedNum,
        e.currentConfirmedNum,
        e.confirmedNum,
        e.curedNum,
        e.deadNum,
      ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(
      showCheckboxColumn: false,
      rowsPerPage: _currentRowsPerPage,
      availableRowsPerPage: [8, 17],
      onRowsPerPageChanged: _onRowsPerPageChanged,
      header: LatoText(
        data: '各地区统计汇总分页数据表',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      columns: [
        DataColumn(label: Text('地区')),
        DataColumn(label: Text('疑似')),
        DataColumn(label: Text('现有')),
        DataColumn(label: Text('累计')),
        DataColumn(label: Text('治愈')),
        DataColumn(label: Text('死亡')),
      ],
      source: _DataSource(context, _rows),
    );
  }

  void _onRowsPerPageChanged(int value) {
    if (mounted) {
      setState(() {
        _currentRowsPerPage = value;
      });
    }
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
