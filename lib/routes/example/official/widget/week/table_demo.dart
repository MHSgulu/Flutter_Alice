import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';

//表格非常适合创建您不想滑动的小部件网格，尤其是如果您拥有不同大小的小部件。
// 嵌套的行和列可能会有点乱，但表格小部件提供了一致性并为您调整子窗口小部件的大小。
/// {@youtube 560 315 https://www.youtube.com/watch?v=_lbE0wsVZSw}

///一个为其子表使用表布局算法的窗口小部件。
///
///如果只有一行，则[Row]小部件更为合适。如果只有一列，则[SliverList]或[Column]小部件会更合适。
///
///根据行的内容垂直调整行的大小。若要控制各个列的宽度，请使用[columnWidths]属性为每列指定一个[TableColumnWidth]。
///如果[columnWidths]为空，或[columnWidths]中给定列的输入为空，则表将使用[defaultColumnWidth]。
///
///默认情况下，[defaultColumnWidth]是[FlexColumnWidth]。此[TableColumnWidth]在水平轴上划分剩余空间，以确定列宽。
///如果将[Table]包裹在水平[ScrollView]中，请选择其他[TableColumnWidth]，例如[FixedColumnWidth]。
///
///有关表布局算法的更多详细信息，请参见[RenderTable]。
///要控制子项的对齐方式，请参见[TableCell]。
///
/// 也可以看看：
///
/// * [布局小部件目录]（https://flutter.dev/widgets/layout/）。

class TableDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'Table',
        onPressedBack: () => Navigator.pop(context),
      ),
      ///创建一个表。
      /// [children]，[defaultColumnWidth]和[defaultVerticalAlignment]参数不能为null。
      body: Table(
        children: [
          TableRow(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                child: Container(
                  //width: 100,
                  height: 150,
                  color: Colors.teal,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                child: Container(
                  //width: 100,
                  height: 100,
                  color: Colors.cyan,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                child: Container(
                  //width: 100,
                  height: 200,
                  color: Colors.amber,
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                child: Container(
                  //width: 100,
                  height: 100,
                  color: Colors.lightBlue,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                child: Container(
                  //width: 100,
                  height: 120,
                  color: Colors.amber,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                child: Container(
                  //width: 100,
                  height: 150,
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
        ],
        ///如何确定没有显式大小调整算法的列的宽度。
        ///特别是，如果`columnWidths [i]`为空，则[defaultColumnWidth]用于列i。 默认值为[FlexColumnWidth]，它将在相同类型[TableColumnWidth]的列之间平均分配剩余的水平空间。
        ///水平水平[ScrollView]中的[Table]必须使用[FixedColumnWidth]或[IntrinsicColumnWidth]，因为水平空间是无限的。
        defaultColumnWidth: FlexColumnWidth(1.0),
        border: TableBorder.all(
          color: Colors.black,
          width: 1.0,
        ),
        ///未显式指定垂直对齐方式的单元格如何垂直对齐。
        ///单元格可以通过将其内容包装在[TableCell]小部件中来指定垂直对齐方式。
        defaultVerticalAlignment: TableCellVerticalAlignment.top,
      ),
    );
  }

}