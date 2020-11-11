import 'package:flutter/material.dart';


/// 这个简单的示例显示了NestedScrollView，其标题包含捕捉的浮动SliverAppBar。
/// 在不设置任何其他标志的情况下，例如NestedScrollView.floatHeaderSliv​​ers，SliverAppBar会以动画形式进出，而不会浮动。
/// SliverOverlapAbsorber和 SliverOverlapInjector保持两个独立的滚动视图之间的适当对准。


class NestedScrollViewExample3 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
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
            },
            body: Builder(
                builder: (BuildContext context) {
                  return CustomScrollView(
                    // 应该保留“ controller”和“ primary”成员，以便NestedScrollView可以控制此内部滚动视图。
                    // 如果设置了“ controller”属性，则此滚动视图将不会与NestedScrollView关联。
                    slivers: <Widget>[
                      SliverOverlapInjector(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
                      SliverFixedExtentList(
                        itemExtent: 48.0,
                        delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) => ListTile(title: Text('Item $index')),
                          childCount: 30,
                        ),
                      ),
                    ],
                  );
                }
            )
        )
    );
  }
}

