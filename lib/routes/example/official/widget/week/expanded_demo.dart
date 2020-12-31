import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';

//使用Expanded小工具扩展您对Flutter的了解！
// Flutter的Expanded将改变发送给行和列的子项的约束，指示它们填补可用的空间。
// 因此，将您的子项包裹在Expanded小工具中，并观察它的增长！
// {@youtube 560315 https://www.youtube.com/watch?v=_rnZaagadyo}


///一个小部件，可扩展[Row]，[Column]或[Flex]的子级，以便该子级填充可用空间。
///
///使用[Expanded]小部件可展开[Row]，[Column]或[Flex]的子级，以沿主轴填充可用空间
///（例如，水平[Row]或垂直[[柱]）。如果扩展了多个子项，则根据[flex]因子在其中分配可用空间。
///
/// [Expanded]小部件必须是[Row]，[Column]或[Flex]的后代，并且必须是[Expanded]小部件到其封闭的[Row]，[Column]或[Flex]的路径]必须仅包含[StatelessWidget]或[StatefulWidget]
/// （而不是其他类型的小部件，例如[RenderObjectWidget]）。
///
/// {@tool dartpad --template = stateless_widget_material}
///此示例说明如何在[Column]中使用[Expanded]小部件，以便使其中间子级[Container]展开以填充空间。
///
///！[这会导致两个薄的蓝色方框之间有一个较大的琥珀色方框。]（https://flutter.github.io/assets-for-api-docs/assets/widgets/expanded_column.png）
///
/// {@tool dartpad --template = stateless_widget_material}
///此示例显示如何在[Row]中使用[Expanded]小部件，并扩展多个子级，并利用[flex]因子对可用空间进行优先级排序。
///
///！[这将导致一个宽的琥珀色框，然后是一个细的蓝色框，最后是中等宽度的琥珀色框。]（https://flutter.github.io/assets-for-api-docs/资产/小工具/expanded_row.png）
///
/// 也可以看看：
///
/// * [Flexible]，它不会强制孩子填充可用空间。
/// * [Spacer]，一个小部件，它占用与其flex值成比例的空间。
/// * [布局小部件目录]（https://flutter.dev/widgets/layout/）。


///创建一个可扩展[Row]，[Column]或[Flex]子级的窗口小部件，以使该子级填充Flex窗口小部件主轴上的可用空间。

class ExpandedDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'Expanded',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => ExpandedDemo1()));
              },
              child: Text('在Row的子级里'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => ExpandedDemo2()));
              },
              child: Text('在Column的子级里'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => ExpandedDemo3()));
              },
              child: Text('在Row的子级里竞争'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => ExpandedDemo4()));
              },
              child: Text('在Column的子级里竞争'),
            ),
          ),
        ],
      ),
    );
  }
}

class ExpandedDemo1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'Expanded',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: Row(
        children: [
          Container(
            width: 80,
            height: 100,
            color: Colors.lightBlue,
            child: Center(
              child: Text('宽度80的容器'),
            ),
          ),
          Expanded(
            child: Container(
              height: 100,
              color: Colors.yellow,
              child: Center(
                child: Text('Row子级里的Expanded'),
              ),
            ),
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.cyanAccent,
            child: Center(
              child: Text('宽度100的容器'),
            ),
          ),
        ],
      ),
    );
  }

}

class ExpandedDemo2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'Expanded',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: Column(
        children: [
          Container(
            height: 80,
            color: Colors.lightBlue,
            child: Center(
              child: Text('高度80的容器'),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.yellow,
              child: Center(
                child: Text('Column子级里的Expanded'),
              ),
            ),
          ),
          Container(
            height: 100,
            color: Colors.cyanAccent,
            child: Center(
              child: Text('高度100的容器'),
            ),
          ),
        ],
      ),
    );
  }

}

class ExpandedDemo3 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'Expanded',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              height: 100,
              color: Colors.yellow,
              child: Center(
                child: Text('flex: 2'),
              ),
            ),
          ),
          Container(
            width: 80,
            height: 100,
            color: Colors.cyanAccent,
            child: Center(
              child: Text('宽度80的容器'),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: 100,
              color: Colors.yellow,
              child: Center(
                child: Text('flex: 1'),
              ),
            ),
          ),
        ],
      ),
    );
  }

}

class ExpandedDemo4 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'Expanded',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.yellow,
              child: Center(
                child: Text('flex: 3'),
              ),
            ),
          ),
          Container(
            height: 200,
            color: Colors.cyanAccent,
            child: Center(
              child: Text('高度200的容器'),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.yellow,
              child: Center(
                child: Text('flex: 2'),
              ),
            ),
          ),
        ],
      ),
    );
  }

}


