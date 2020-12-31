import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';

///一个控件，该控件控制[Row]，[Column]或[Flex]的子代如何弯曲。
///
///使用[Flexible]小部件可为[Row]，[Column]或[Flex]的子级提供扩展的灵活性，以填充主轴上的可用空间（例如，水平放置[Row]或垂直放置 （对于[列]），但与[扩展]不同，[灵活]不需要孩子填写可用空间。
///
/// [Flexible]小部件必须是[Row]，[Column]或[Flex]的后代，并且必须是[Flexible]小部件到其封闭的[Row]，[Column]或[Flex]的路径 ]必须仅包含[StatelessWidget]或[StatefulWidget]（而不是其他类型的小部件，例如[RenderObjectWidget]）。
///
/// {@youtube 560315 https://www.youtube.com/watch?v=CI7x0mAZiY0}
///
/// 也可以看看：
///
/// * [Expanded]，它强制子项扩展以填充可用空间。
/// * [Spacer]，一个小部件，它占用与其flex值成比例的空间。
/// * [布局小部件目录]（https://flutter.dev/widgets/layout/）。

///创建一个控件来控制[Row]，[Column]或[Flex]的子代如何弯曲的小部件。

/// flex
///用于此子项的弹性因子。
///
///如果为null或零，则子级不灵活，并确定其自身的大小。
///如果不为零，则通过根据柔性子项的柔韧性因子（在放置非柔性子项之后）划分自由空间来确定儿童可在主轴上占据的空间量。

/// fit
///如何将一个灵活的子代刻在可用空间中。
///
///如果[flex]不为零，则[fit]确定子级是否填充父级在布局期间可用的空间。
///如果适合度为[FlexFit.tight]，则要求孩子填写可用空间。 如果适合度为[FlexFit.loose]，则子级最多可以与可用空间一样大（但允许更小）。

class FlexibleDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'Flexible',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => FlexibleDemo1()));
              },
              child: Text('在Row的子级里'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => FlexibleDemo2()));
              },
              child: Text('在Column的子级里'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => FlexibleDemo3()));
              },
              child: Text('在Row的子级里竞争'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => FlexibleDemo4()));
              },
              child: Text('在Column的子级里竞争'),
            ),

          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => FlexibleDemo5()));
              },
              child: Text('与 Expanded 的区别'),
            ),

          ),
        ],
      ),
    );
  }

}

class FlexibleDemo1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'Flexible',
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
          Flexible(
            child: Container(
              height: 100,
              color: Colors.yellow,
              child: Center(
                child: Text('Row子级里的Flexible'),
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

class FlexibleDemo2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'Flexible',
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
          Flexible(
            child: Container(
              color: Colors.yellow,
              child: Center(
                child: Text('Column子级里的Flexible'),
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

class FlexibleDemo3 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'Flexible',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: Row(
        children: [
          Flexible(
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
          Flexible(
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

class FlexibleDemo4 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'Flexible',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: Column(
        children: [
          Flexible(
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
          Flexible(
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

class FlexibleDemo5 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: '差异',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Flexible(
                flex: 2,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.yellow,
                  child: Center(
                    child: Text('Flexible flex: 2 宽度100的容器'),
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
              Flexible(
                flex: 1,
                child: Container(
                  width: 80,
                  height: 100,
                  color: Colors.yellow,
                  child: Center(
                    child: Text('Flexible flex: 1 宽度80的容器'),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.yellow,
                  child: Center(
                    child: Text('Expanded flex: 2 宽度100的容器'),
                  ),
                ),
              ),
              Container(
                height: 100,
                color: Colors.cyanAccent,
                child: Center(
                  child: Text('高度200的容器'),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: 80,
                  height: 100,
                  color: Colors.yellow,
                  child: Center(
                    child: Text('Expanded flex: 1 宽度80的容器'),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 50),
          Center(
            child: Text('两者只在FlexFit的属性上有差异'),
          ),
          Center(
            child: Text('FlexFit: loose  容器的首选尺寸占据优先'),
          ),
          Center(
            child: Text('Expanded 继承了 Flexible'),
          ),
        ],
      ),
    );
  }

}