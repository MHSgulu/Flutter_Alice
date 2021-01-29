import 'package:flutter/material.dart';
import 'package:alice/widgets/custom/my_appbar.dart';

class ExpansionPaneListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: '扩展面板列表',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: MyStatefulWidget(),
    );
  }
}

// 存储ExpansionPanel状态信息
class Item {
  Item({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  List<Item> _data = generateItems(8);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    ///一个材质扩展面板列表，其中列出了其子级并为扩展设置了动画效果。
    ///
    ///请注意，[expansionCallback]对于[ExpansionPanelList]和[ExpansionPanelList.radio]的行为有所不同。
    ///
    /// 也可以看看：
    ///
    /// * [ExpansionPanel]
    /// * [ExpansionPanelList.radio]
    /// * <https://material.io/design/components/lists.html#types>
    ///
    ///创建一个扩展面板列表小部件。 当按下扩展面板的扩展/折叠按钮时，会触发[expansionCallback]。
    ///
    /// [children]和[animationDuration]参数不能为null
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        ///一个材料扩展面板。 它具有标题和主体，可以扩展或折叠。 面板的主体只有在展开时才可见。
        ///
        ///扩展面板仅用作[ExpansionPanelList]的子级。
        ///
        ///有关示例实现，请参见[ExpansionPanelList]。
        ///
        /// 也可以看看：
        ///
        /// * [ExpansionPanelList]
        /// * <https://material.io/design/components/lists.html#types>
        ///
        ///创建一个扩展面板，用作[ExpansionPanelList]的子级。
        ///有关如何使用此小部件的示例，请参见[ExpansionPanelList]。
        ///
        /// [headerBuilder]，[body]和[isExpanded]参数不能为null。
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: ListTile(
              title: Text(item.expandedValue),
              subtitle: Text('要删除此面板，请点击垃圾桶图标'),
              trailing: Icon(Icons.delete),
              onTap: () {
                setState(() {
                  _data.removeWhere((currentItem) => item == currentItem);
                });
              }),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
