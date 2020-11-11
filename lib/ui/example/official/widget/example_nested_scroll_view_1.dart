import 'package:flutter/material.dart';

/**
 * 可以在其内部嵌套其他滚动视图的滚动视图，其滚动位置是固有链接的。
    此窗口小部件最常见的用例是可滚动视图，
    该视图具有一个灵活的SliverAppBar
    （在标头中包含TabBar）（由 headerSliv​​erBuilder构建，在主体中具有TabBarView），
    以便可滚动视图的内容根据可见的选项卡而有所不同。
    在普通的ScrollView中，有一组碎片（滚动视图的组成部分）。
    如果这些条中的一个托管了一个TabBarView，
    该TabBarView沿相反的方向滚动（例如，允许用户在由Tabs表示的页面之间水平滑动，而列表垂直滚动），
    则TabBarView内部的任何列表都不会与外部ScrollView交互。
    例如，将内部列表快速滚动到顶部不会导致外部ScrollView中折叠的SliverAppBar 展开。

    NestedScrollView通过为外部ScrollView和内部ScrollView（位于TabBarView内部的ScrollController）提供自定义ScrollController，
    从而将它们钩在一起，以便它们作为一个连贯的滚动视图显示给用户，从而解决了此问题
 */


/// 此示例示出了NestedScrollView其标题是一个组合 的TabBar在SliverAppBar，其主体是TabBarView。
/// 它使用 SliverOverlapAbsorber / SliverOverlapInjector对使内部列表正确对齐，
/// 并使用SafeArea避免任何水平干扰（例如，手机水平时，iOS上的“陷波”）。
/// 另外， PageStorageKey用来记住每个选项卡列表的滚动位置。

class NestedScrollViewExample1 extends StatefulWidget{
  @override
  _NestedScrollViewExample1State createState() => _NestedScrollViewExample1State();
}

class _NestedScrollViewExample1State extends State<NestedScrollViewExample1> {
  final List<String> _tabs = ['Tab 1', 'Tab 2'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length, // 这是选项卡的数量。
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            // 这些是显示在“外部”滚动视图中的slivers。
            return <Widget>[
              SliverOverlapAbsorber(
                // 此小部件采用SliverAppBar的重叠行为，并将其重定向到下面的SliverOverlapInjector。
                // 如果丢失，则即使内部滚动视图认为尚未滚动，下面的嵌套“内部”滚动视图也有可能最终到达SliverAppBar下。
                // 如果“ headerSliverBuilder”仅构建不与下一个sliver重叠的小部件，则没有必要。
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  title: const Text('Books'), // 这是应用程序栏中的标题。
                  pinned: true,
                  expandedHeight: 150.0,
                  //“ forceElevated”属性使SliverAppBar显示阴影。
                  // 当内部滚动视图滚动超出其“零”点时，即“ innerBoxIsScrolled”参数为true。
                  // 当它似乎在SliverAppBar下方滚动时。
                  // 否则，在某些情况下阴影会出现或不恰当地出现，因为SliverAppBar实际上并不了解内部滚动视图的精确位置。
                  forceElevated: innerBoxIsScrolled,
                  bottom: TabBar(
                    // 这些是可放置在选项卡栏中每个选项卡中的小部件。
                    tabs: _tabs.map((String name) {
                      return Tab(text: name);
                    }).toList(),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            // 这些是选项卡下方的选项卡视图的内容。
            children: _tabs.map((String name) {
              return SafeArea(
                top: false,
                bottom: false,
                child: Builder(
                  // 需要此Builder来提供NestedScrollView内部的BuildContext，
                  // 以便sliverOverlapAbsorberHandleFor（）可以找到NestedScrollView。
                  builder: (BuildContext context) {
                    return CustomScrollView(
                      // 应该保留“ controller”和“ primary”成员，以便NestedScrollView可以控制此内部滚动视图。
                      // 如果设置了“ controller”属性，则此滚动视图将不会与NestedScrollView关联。
                      // PageStorageKey对于此ScrollView应该是唯一的。
                      // 它允许列表来记住它的滚动位置时，标签的观点是不是在屏幕上。
                      key: PageStorageKey<String>(name),
                      slivers: <Widget>[
                        SliverOverlapInjector(
                          // 这是上方SliverOverlapAbsorber的反面。
                          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.all(8.0),
                          // 在此示例中，内部滚动视图具有固定高度的列表项，因此使用SliverFixedExtentList。
                          // 但是，这里可以使用任何sliver小部件，例如 SliverList或SliverGrid。
                          sliver: SliverFixedExtentList(
                            //此示例中的项目固定为48像素高。 这与ListTile小部件的材料设计规范匹配。
                            itemExtent: 48.0,
                            delegate: SliverChildBuilderDelegate(
                                  (BuildContext context, int index) {
                                // 该构建器被称为每个孩子, 在此示例中，我们只为每个列表项编号。
                                return ListTile(
                                  title: Text('Item $index'),
                                );
                              },
                              // SliverChildBuilderDelegate的childCount指定此内部列表具有多少个子代。
                              // 在此示例中，每个选项卡都有正好30个项目的列表，但这是任意的。
                              childCount: 30,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }


}