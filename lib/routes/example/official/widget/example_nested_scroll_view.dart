import 'package:flutter/material.dart';

///可以在其中嵌套其他滚动视图的滚动视图，其滚动位置是固有链接的。
///
///此小部件最常见的用例是可滚动的视图，
///其中的标题带有灵活的[SliverAppBar]，标题中包含[TabBar]（由[headerSliverBuilder]构建，[body]中具有[TabBarView]，
///这样可滚动视图的内容根据显示的选项卡而异。
///
/// ##动机
///
///在普通的[ScrollView]中，有一组碎片（滚动视图的组成部分）。
///如果这些条中的一个承载了一个[TabBarView]，
///并沿相反的方向滚动（例如，允许用户在标签所代表的页面之间水平滑动，而列表则垂直滚动），则该[TabBarView]内部的任何列表都不会交互与外部[ScrollView]。
///例如，浏览内部列表以滚动到顶部不会导致外部[ScrollView]中的[SliverAppBar]折叠以展开。
///
/// [NestedScrollView]通过为外部[ScrollView]和内部[ScrollView]（位于[TabBarView]内部的那些）提供自定义[ScrollController]，
/// 将它们挂钩在一起，以便它们在用户中出现，从而解决了此问题一个连贯的滚动视图。
///
///
/// ## [SliverAppBar] s与[NestedScrollView] s
///
///在[NestedScrollView]的外部滚动视图或[headerSliv​​erBuilder]中使用[SliverAppBar]可能需要特殊的配置才能正常工作，
///就像外部和内部是单个滚动视图一样，例如[CustomScrollView ]。
///
/// ###固定[SliverAppBar] s
///
///固定的[SliverAppBar]在[NestedScrollView]中的工作原理与在另一个滚动视图（例如[CustomScrollView]）中的工作完全相同。
///使用[SliverAppBar.pinned]时，应用程序栏在滚动视图的顶部保持可见。当用户滚动时，应用程序栏仍然可以展开和收缩，但是它将保持可见状态，而不是滚动到视线之外。
///
///这自然在[NestedScrollView]中起作用，因为固定的[SliverAppBar]不会移入或移出视口的可见部分。
///随着内部或外部[Scrollable]的移动，应用程序栏将按预期持续存在。
///
///如果应用栏是浮动的，固定的并且使用扩展的高度，请遵循下面列出的浮动约定。
///
/// ###浮动[SliverAppBar] s
///
///当放置在外部可滚动对象或[headerSliv​​erBuilder]中时，使用[SliverAppBar.floating]浮动的[SliverAppBar]不会被触发自动浮动在内部滚动视图或[body]上
///
///这是因为浮动应用程序栏使用其自己的[Scrollable]的滚动偏移量来指示浮动动作。
///作为两个独立的内部[Scrollable]和外部[Scrollable]，外部标头中的[SliverAppBar]不会意识到内部主体的滚动偏移量的变化。
///
///为了使外部浮动，请使用[NestedScrollView.floatHeaderSlivers]。
///设置为true时，嵌套滚动协调器将在将其余拖动应用于正文之前优先排列标题条中的浮动。
///
///此外，当使用浮动，固定和扩展高度的应用栏时，也应使用`floatHeaderSlivers`标志。
/// 在此配置中，应用程序栏的灵活空间将打开并折叠，而应用程序栏的主要部分仍保持固定状态。
///
/// ###捕捉[SliverAppBar] s
///
///浮动[SliverAppBar]也可以选择执行捕捉动画。
///如果[SliverAppBar.snap]为true，则显示浮动应用程序栏的滚动将触发动画，该动画会将整个应用程序栏滑动到视图中。
///同样，如果滚动取消了应用栏，则动画将使应用栏完全滑出视线。
///
/// [NestedScrollView]可以只执行捕捉动画而无需将应用程序栏浮动进出。
/// 通过不使用[NestedScrollView.floatHeaderSlivers]，应用程序栏将在不浮动的情况下卡入和移出。
///
///在[NestedScrollView]中实现时，[SliverAppBar.snap]动画应与[SliverOverlapAbsorber]和[SliverOverlapInjector]小部件一起使用。
///这些小部件在标题中采取[SliverAppBar]的任何重叠行为，并将其重定向到正文中的[SliverOverlapInjector]。
///如果丢失，则即使内部滚动视图认为尚未滚动，下面的嵌套“内部”滚动视图也有可能最终出现在[SliverAppBar]下。
///
/// ###捕捉和浮动[SliverAppBar] s
///
///参见 https://github.com/flutter/flutter/issues/59189
///当前，[NestedScrollView]不支持同时浮动和对齐外部可滚动对象，例如 同时使用[SliverAppBar.floating]和[SliverAppBar.snap]时。
///
/// ###拉伸[SliverAppBar] s
///
/// TODO（Piinks）：支持拉伸，
///  https：//github.com/flutter/flutter/issues/54059
///  当前，[NestedScrollView]不支持拉伸外部可滚动对象，例如 使用[SliverAppBar.stretch]时。
///
/// 也可以看看：
///
/// * [SliverAppBar]，例如关于浮动，固定和捕捉行为等不同配置的示例。
/// * [SliverOverlapAbsorber]，一条包裹另一根的条子，将其布局范围视为重叠。
/// * [SliverOverlapInjector]，根据存储在[SliverOverlapAbsorberHandle]中的值具有条几何形状的条。


//此示例显示一个[NestedScrollView]，其标头是[SliverAppBar]中的[TabBar]的组合，其主体是[TabBarView]。
//它使用[SliverOverlapAbsorber] / [SliverOverlapInjector]对使内部列表正确对齐，并使用[SafeArea]避免任何水平干扰（例如，手机水平时在iOS上为“缺口”）。
//另外，[PageStorageKey]用于记住每个选项卡列表的滚动位置。
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


//这个简单的示例显示了[NestedScrollView]，其标题包含一个浮动的[SliverAppBar]。
//通过使用[floatHeaderSlivers]属性，可在外部[Scrollable]和内部[Scrollable]之间协调浮动行为，因此它的行为与在单个可滚动对象中的行为相同。
class NestedScrollViewExample2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
          // 必须将floatHeaderSlivers设置为true才能使外部条浮动在内部可滚动条上。
            floatHeaderSlivers: true,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  title: const Text('Floating Nested SliverAppBar'),
                  floating: true,
                  expandedHeight: 200.0,
                  forceElevated: innerBoxIsScrolled,
                ),
              ];
            },
            body: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: 30,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 50,
                    child: Center(child: Text('Item $index')),
                  );
                })));
  }
}


//这个简单的示例显示了[NestedScrollView]，其标题包含捕捉的浮动[SliverAppBar]。
//_不设置任何其他标志，例如[NestedScrollView.floatHeaderSlivers]，[SliverAppBar]会动画设置动画，而不会浮动。
//[SliverOverlapAbsorber]和[SliverOverlapInjector]保持两个单独的滚动视图之间的正确对齐。
class NestedScrollViewExample3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(headerSliverBuilder:
            (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                title: const Text('Snapping Nested SliverAppBar'),
                floating: true,
                snap: true,
                expandedHeight: 200.0,
                forceElevated: innerBoxIsScrolled,
              ),
            )
          ];
        }, body: Builder(builder: (BuildContext context) {
          return CustomScrollView(
            // 应该保留“ controller”和“ primary”成员，以便NestedScrollView可以控制此内部滚动视图。
            // 如果设置了“ controller”属性，则此滚动视图将不会与NestedScrollView关联。
            slivers: <Widget>[
              SliverOverlapInjector(
                  handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
              SliverFixedExtentList(
                itemExtent: 48.0,
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) =>
                      ListTile(title: Text('Item $index')),
                  childCount: 30,
                ),
              ),
            ],
          );
        })));
  }
}