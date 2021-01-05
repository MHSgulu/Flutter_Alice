import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';

//如果你想要同时滚动一个列表和一个网格，或想要一个很酷和复杂的滚动效果，SliverList和SliverGrid正是您需要的！
// Slivers可以轻松滚动网格或列表中的大量子项，并允许您毫不费力地或提前构建子项。
/// {@youtube 560 315 https://www.youtube.com/watch?v=ORiTTaVY6mM}

/// SliverList
///
///沿着主轴将多个子级子项以线性阵列放置的条子。
///
///每个孩子都必须在交叉轴上具有[SliverConstraints.crossAxisExtent]，但要确定自己的主轴范围。
///
/// [SliverList]通过“航位推算”确定其滚动偏移量，因为未实现银条可见部分之外的子项，这意味着[SliverList]无法学习其主轴范围。而是将新物化的孩子放置在现有孩子附近。
///
///如果孩子的主轴范围固定，请考虑使用[SliverFixedExtentList]而不是[SliverList]，
///因为[SliverFixedExtentList]不需要对其子级执行布局即可获得其在主轴上的范围，因此效率更高。
///
/// 也可以看看：
///
/// * <https://flutter.dev/docs/development/ui/advanced/slivers>，描述了什么是长条以及如何使用它们。
/// * [SliverFixedExtentList]，对于主轴上具有相同范围的子代而言，效率更高。
/// * [SliverPrototypeExtentList]与[SliverFixedExtentList]相似，不同之处在于它使用原型列表项而不是像素值来定义每个项的主轴范围。
/// * [SliverGrid]，它将其子级放置在任意位置。

/// SliverFixedExtentList
///
///一个将多个具有相同主轴范围的子级盒放置在一个线性阵列中的条子。
///
/// [SliverFixedExtentList]将其子级沿主轴放置在线性数组中，从零偏移开始，没有间隙。 每个孩子都必须在主轴上具有[itemExtent]，在交叉轴上具有[SliverConstraints.crossAxisExtent]。
///
/// [SliverFixedExtentList]比[SliverList]更有效，因为[SliverFixedExtentList]不需要对其子级执行布局即可获得其在主轴上的范围。
///
/// 也可以看看：
///
/// * [SliverPrototypeExtentList]与[SliverFixedExtentList]相似，不同之处在于它使用原型列表项而不是像素值来定义每个项的主轴范围。
/// * [SliverFillViewport]，它基于[SliverConstraints.viewportMainAxisExtent]确定[itemExtent]。
/// * [SliverList]，它不需要其子级在主轴上具有相同的范围。

class SliverListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'SliverList＆SliverGrid',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => SliverListDemo1())),
              child: Text('SliverList - delegate list'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => SliverListDemo2())),
              child: Text('SliverList - delegate builder'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => SliverListDemo3())),
              child: Text('SliverFixedExtentList - delegate builder'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => SliverGridDemo1())),
              child: Text('SliverGrid - delegate builder'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => SliverGridDemo2())),
              child: Text('SliverGrid.count'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => SliverGridDemo3())),
              child: Text('SliverGrid.extent'),
            ),
          ),
        ],
      ),
    );
  }
}

class SliverListDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'SliverList',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            ///创建一个使用给定列表为子项供应子代的委托。
            /// [children]，[addAutomaticKeepAlives]，[addRepaintBoundaries]，[addSemanticIndexes]和[semanticIndexCallback]参数不能为null。
            ///如果子级的顺序从不改变，请考虑使用常量[SliverChildListDelegate.fixed]构造函数。
            delegate: SliverChildListDelegate(
              [
                Container(
                  height: 50,
                  color: Colors.redAccent,
                ),
                Container(
                  height: 80,
                  color: Colors.limeAccent,
                ),
                Container(
                  height: 100,
                  color: Colors.lightBlue,
                ),
                Container(
                  height: 100,
                  color: Colors.redAccent,
                ),
                Container(
                  height: 120,
                  color: Colors.limeAccent,
                ),
                Container(
                  height: 150,
                  color: Colors.lightBlue,
                ),
                Container(
                  height: 200,
                  color: Colors.redAccent,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SliverListDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'SliverList',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                height: index % 2 == 0 ? 50 : 100,
                color:
                    index % 2 == 0 ? Colors.pinkAccent : Colors.lightBlueAccent,
                child: Center(
                  child: Text('item: $index'),
                ),
              ),
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}

class SliverListDemo3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'SliverList',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: CustomScrollView(
        slivers: [
          SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                color: Colors.lightBlue[100 * (index % 9)],
                child: Center(
                  child: Text('item: $index'),
                ),
              ),
              childCount: 18,
            ),

            ///迫使孩子在主轴上拥有的程度。
            itemExtent: 50,
          ),
        ],
      ),
    );
  }
}

class SliverGridDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'SliverGrid',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: CustomScrollView(
        slivers: [
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                color: Colors.teal[100 * (index % 9)],
                child: Text('grid item $index'),
              ),
              childCount: 28,
            ),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
          ),
        ],
      ),
    );
  }
}

class SliverGridDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'SliverGrid',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: CustomScrollView(
        slivers: [
      ///创建一条条，将多个盒状子项按二维排列放置，并且在十字架上固定数量的瓷砖轴。
      ///使用[SliverGridDelegateWithFixedCrossAxisCount]作为[gridDelegate]，并使用[SliverChildListDelegate]作为[delegate]。
      /// * [new GridView.count]，[GridView]小部件的等效构造函数
          SliverGrid.count(
            crossAxisCount: 2,
            children: [
              Container(
                color: Colors.blueAccent,
              ),
              Container(
                color: Colors.yellowAccent,
              ),
              Container(
                color: Colors.redAccent,
              ),
              Container(
                color: Colors.greenAccent,
              ),
              Container(
                color: Colors.purpleAccent,
              ),
              Container(
                color: Colors.orangeAccent,
              ),
              Container(
                color: Colors.pinkAccent,
              ),
              Container(
                color: Colors.tealAccent,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SliverGridDemo3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'SliverGrid',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: CustomScrollView(
        slivers: [
          ///创建一个条，将多个盒状子项按二维排列放置，每个子项具有最大的横轴范围。
          ///使用[SliverGridDelegateWithMaxCrossAxisExtent]作为[gridDelegate]，并使用[SliverChildListDelegate]作为[delegate]。
          /// * [new GridView.extent]，[GridView]小部件的等效构造函数。
          SliverGrid.extent(
            maxCrossAxisExtent: 150,
            children: [
              Container(
                color: Colors.blueAccent,
              ),
              Container(
                color: Colors.yellowAccent,
              ),
              Container(
                color: Colors.redAccent,
              ),
              Container(
                color: Colors.greenAccent,
              ),
              Container(
                color: Colors.purpleAccent,
              ),
              Container(
                color: Colors.orangeAccent,
              ),
              Container(
                color: Colors.pinkAccent,
              ),
              Container(
                color: Colors.tealAccent,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
