import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoNavigationBarDemo extends StatelessWidget {
  const CupertinoNavigationBarDemo();

  @override
  Widget build(BuildContext context) {
    return Navigator(onGenerateRoute: (settings) {
      return _NoAnimationCupertinoPageRoute<void>(
        title: '导航栏',
        builder: (context) => Scaffold(
          body: CustomScrollView(
            slivers: [
              CupertinoSliverNavigationBar(),
              SliverPadding(
                padding: MediaQuery.of(context).removePadding(removeTop: true).padding,
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final title = '项 ${index + 1}';
                      return ListTile(
                        onTap: () {
                          Navigator.of(context).push(CupertinoPageRoute<void>(
                            title: title,
                            builder: (context) => _SecondPage(),
                          ));
                        },
                        title: Text(title),
                      );
                    },
                    childCount: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class _SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(),
      child: Container(),
    );
  }
}

/// 没有任何过渡动画的CupertinoPageRoute。
class _NoAnimationCupertinoPageRoute<T> extends CupertinoPageRoute<T> {
  _NoAnimationCupertinoPageRoute({
    @required WidgetBuilder builder,
    String title,
  }) : super(builder: builder, title: title);

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child;
  }
}
