import 'package:flutter/material.dart';


/// 这个简单的示例显示了一个NestedScrollView，其标题包含一个浮动SliverAppBar。
/// 通过使用floatHeaderSlivers属性，可以在外部Scrollable和内部Scrollable之间协调浮动行为，因此它的行为与在单个scrollable中的行为相同。


class NestedScrollViewExample2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
          // 必须将floatHeaderSlivers设置为true才能使外部条浮动在内部可滚动条上。
            floatHeaderSlivers: true,
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
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
                }
            )
        )
    );
  }
}

