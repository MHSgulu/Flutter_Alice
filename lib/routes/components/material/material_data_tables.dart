import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';

import 'demo/demo_data_table.dart';

///材料设计数据表。
///
/// {@youtube 560315 https://www.youtube.com/watch?v=ktTajqbhIcY}
///
///在表中显示数据非常昂贵，因为要对表进行布局，必须对所有数据进行两次测量，一次要协商用于每一列的维，一次要根据协商的结果实际对表进行布局。
///
///因此，如果您有很多数据（例如，多行十行，尽管精确限制取决于目标设备），建议您使用[PaginatedDataTable]将数据分成多个页面。
/// [DataTable]可以根据[列]中的任何列以升序或降序排序。 如果[sortColumnIndex]不为空，则将根据指定列中的值对表进行排序。 布尔[sortAscending]标志控制排序顺序。
///
/// 也可以看看：
///
/// * [DataColumn]，它描述数据表中的列。
/// * [DataRow]，它包含数据表中一行的数据。
/// * [DataCell]，它包含数据表中单个单元格的数据。
/// * [PaginatedDataTable]，它显示数据表中的部分数据，并提供用于对其余数据进行分页的控件。
/// * <https://material.io/design/components/data-tables.html>

class DataTableDemo extends StatefulWidget {
  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  static const int numItems = 10;
  List<bool> selected = List<bool>.generate(numItems, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: '数据表',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ///此示例说明如何显示具有三列的[DataTable]：名称，年龄和角色。
          ///列由三个[DataColumn]对象定义。
          ///该表包含三个示例用户的三行数据，这些数据由三个[DataRow]对象定义。
          DataTable(
            columns: const <DataColumn>[
              DataColumn(
                label: Text(
                  'Name',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Age',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Role',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ],
            rows: const <DataRow>[
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('Sarah')),
                  DataCell(Text('19')),
                  DataCell(Text('Student')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('Janine')),
                  DataCell(Text('43')),
                  DataCell(Text('Professor')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('William')),
                  DataCell(Text('27')),
                  DataCell(Text('Associate Professor')),
                ],
              ),
            ],
          ),
          SizedBox(height: 40),
          ///此示例说明如何显示[DataTable]，每行具有交替的颜色，以及选择行时的自定义颜色。
          SizedBox(
            width: double.infinity,
            child: DataTable(
              columns: const <DataColumn>[
                DataColumn(
                  label: const Text('Number'),
                ),
              ],
              rows: List<DataRow>.generate(
                numItems,
                (index) => DataRow(
                  color: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    // All rows will have the same selected color.
                    if (states.contains(MaterialState.selected))
                      return Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.08);
                    // Even rows will have a grey color.
                    if (index % 2 == 0) return Colors.grey.withOpacity(0.3);
                    return null; // Use default value for other states and odd rows.
                  }),
                  cells: [DataCell(Text('Row $index'))],
                  selected: selected[index],
                  onSelectChanged: (bool value) {
                    setState(() {
                      selected[index] = value;
                    });
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 40),
          ///一个材料设计数据表，使用多个页面显示数据。
          ///
          ///分页数据表每页显示[rowsPerPage]数据行，并提供用于显示其他页面的控件。
          ///
          ///从[DataTableSource]懒惰地读取数据。 小部件显示为[卡片]。
          ///
          /// 也可以看看：
          ///
          /// * [DataTable]，未分页。
          /// * <https://material.io/go/design-data-tables#data-tables-tables-within-cards>
          PaginatedDataTable(
            header: Text('Header Text'),
            rowsPerPage: 4,
            columns: [
              DataColumn(label: Text('Header A')),
              DataColumn(label: Text('Header B')),
              DataColumn(label: Text('Header C')),
              DataColumn(label: Text('Header D')),
            ],
            source: _DataSource(context),
          ),
          Center(
            child: ElevatedButton(
              onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (_) => DataTableDemo2())),
              child: Text('查看更多演示数据的PaginatedDataTable'),),
          ),
        ],
      ),
    );
  }
}

class _Row {
  _Row(
    this.valueA,
    this.valueB,
    this.valueC,
    this.valueD,
  );

  final String valueA;
  final String valueB;
  final String valueC;
  final int valueD;

  bool selected = false;
}

class _DataSource extends DataTableSource {
  _DataSource(this.context) {
    _rows = <_Row>[
      _Row('Cell A1', 'CellB1', 'CellC1', 1),
      _Row('Cell A2', 'CellB2', 'CellC2', 2),
      _Row('Cell A3', 'CellB3', 'CellC3', 3),
      _Row('Cell A4', 'CellB4', 'CellC4', 4),
    ];
  }

  final BuildContext context;
  List<_Row> _rows;

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
        DataCell(Text(row.valueA)),
        DataCell(Text(row.valueB)),
        DataCell(Text(row.valueC)),
        DataCell(Text(row.valueD.toString())),
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
