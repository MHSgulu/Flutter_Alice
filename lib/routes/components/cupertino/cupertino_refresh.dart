

import 'dart:math' show Random;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoRefreshControlDemo extends StatefulWidget {
  const CupertinoRefreshControlDemo();

  @override
  _CupertinoRefreshControlDemoState createState() =>
      _CupertinoRefreshControlDemoState();
}

class _CupertinoRefreshControlDemoState
    extends State<CupertinoRefreshControlDemo> {
  static const listCount = 20;
  var randomList = List<int>.generate(listCount, (i) => i + 1);

  void _shuffleList() => randomList.shuffle(Random());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        //如果未指定，则[CustomScrollView]会附加一个[AlwaysScrollableScrollPhysics]。
        // 在后台，ScrollableState会将[AlwaysScrollableScrollPhysics]附加到[ScrollConfiguration.of]的输出，
        // 该输出在Android上将是[ClampingScrollPhysics]。
        //为了演示此演示中的iOS行为并确保列表始终滚动，
        // 我们专门将[BouncingScrollPhysics]与[AlwaysScrollableScrollPhysics]结合使用
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: [
          CupertinoSliverNavigationBar(
            automaticallyImplyLeading: false,
            largeTitle: Text('下拉即可刷新'),
          ),
          CupertinoSliverRefreshControl(
            onRefresh: () {
              return Future<void>.delayed(const Duration(seconds: 1))
                ..then<void>((_) {
                  if (mounted) {
                    setState(() => _shuffleList());
                  }
                });
            },
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                final title = '项 ${randomList[index]}';
                return ListTile(title: Text(title));
              },
              childCount: listCount,
            ),
          ),
        ],
      ),
    );
  }
}

