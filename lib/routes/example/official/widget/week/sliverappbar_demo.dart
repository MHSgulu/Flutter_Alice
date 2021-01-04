import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';

//当您的滚动时，会发生变化或消失的花哨动画标题十分流行！
// 使用SliverAppBar，您可以轻松地在您的应用中使用它。
// 与CustomScrollView一起使用，您可以在应用栏中获得自定义滚动行为！

/// {@youtube 560 315 https://www.youtube.com/watch?v=R9C5KMJKluE}

///与[CustomScrollView]集成在一起的材质设计应用栏。
///
///应用栏由工具栏和其他可能的小部件组成，例如[TabBar]和[FlexibleSpaceBar]。
///应用程序栏通常会显示一个或多个带有[IconButton]的常用操作，然后可以选择后面带有[PopupMenuButton]进行较少的常用操作。
///
/// Sliver应用程序栏通常用作[CustomScrollView]的第一个子项，它使应用程序栏与滚动视图集成在一起，以便其高度可以根据滚动偏移量而变化，或者浮动在滚动条中的其他内容之上视图。
/// 有关屏幕顶部的固定高度的应用栏，请参阅[Scaffold.appBar]插槽中使用的[AppBar]。
///
/// AppBar在[底部]（如果有）上方显示工具栏小部件[前导]，[标题]和[动作]。
/// 如果指定了[flexibleSpace]小部件，则将其堆叠在工具栏和底部小部件的后面。
///
/// ##动画示例
///
///以下动画显示了当用户向上滚动然后再次向下滚动时，具有不同配置的应用栏的行为。
///
/// *应用栏，其中[floating]：false，[pined]：false，[snap]：false：
/// {@animation 476400 https://flutter.github.io/assets-for-api-docs/assets/material/app_bar.mp4}
///
/// *应用栏，其中[floating]：true，[pinned]：false，[snap]：false：
/// {@animation 476400 https://flutter.github.io/assets-for-api-docs/assets/material/app_bar_floating.mp4}
///
/// *应用栏，其中[floating]：true，[pinned]：false，[snap]：true：
/// {@animation 476400 https://flutter.github.io/assets-for-api-docs/assets/material/app_bar_floating_snap.mp4}
///
/// *应用栏，其中[floating]：true，[pinned]：true，[snap]：false：
/// {@animation 476400 https://flutter.github.io/assets-for-api-docs/assets/material/app_bar_pinned_floating.mp4}
///
/// *应用栏，其中[floating]：true，[pinned]：true，[snap]：true：
/// {@animation 476400 https://flutter.github.io/assets-for-api-docs/assets/material/app_bar_pinned_floating_snap.mp4}
///
/// *应用栏，其中[floating]：false，[pinned]：true，[snap]：false：
/// {@animation 476400 https://flutter.github.io/assets-for-api-docs/assets/material/app_bar_pinned.mp4}
///
///仅当[floating]也为true时，才能将属性[snap]设置为true。
///
/// 也可以看看：
///
/// * [CustomScrollView]，它将[SliverAppBar]集成到其滚动中。
/// * [AppBar]，它是固定高度的应用栏，可在[Scaffold.appBar]中使用。
/// * [TabBar]，如果屏幕上的选项卡中排列有多个页面，则通常放置在[AppBar]的[底部]插槽中。
/// * [IconButton]，与[actions]一起使用以在应用程序栏上显示按钮。
/// * [PopupMenuButton]，可通过[操作]在应用栏上显示弹出菜单。
/// * [FlexibleSpaceBar]，当应用栏可以展开和折叠时，它与[flexibleSpace]一起使用。
/// * <https://material.io/design/components/app-bars-top.html>

///  floating
///
///一旦用户滚动到应用栏，应用栏是否应立即可见。
///
///否则，用户将需要在滚动视图顶部附近滚动以显示应用栏。
///
///如果[snap]为true，则显示应用栏的滚动将触发动画，该动画会将整个应用栏滑动到视图中。同样，如果滚动取消了应用栏，则动画会将其完全滑出视线。
///
/// ##动画示例
///
///以下动画显示了应用栏如何基于此属性的值更改其滚动行为。
///
/// * * [floating]设置为false的应用栏：
/// {@animation 476400 https://flutter.github.io/assets-for-api-docs/assets/material/app_bar.mp4}
/// * * [浮动]设置为true的应用栏：
/// {@animation 476400 https://flutter.github.io/assets-for-api-docs/assets/material/app_bar_floating.mp4}
///
/// 也可以看看：
///
/// * [SliverAppBar]有关此属性如何结合[pinned]和[snap]更改应用程序栏行为的更多动画示例。


/// pinned
///
///应用栏在滚动视图开始时是否应保持可见。
///
///当用户滚动时，应用程序栏仍然可以展开和收缩，但是它将保持可见状态，而不是滚动到视线之外。
///
/// ##动画示例
///
///以下动画显示了应用栏如何基于此属性的值更改其滚动行为。
///
/// * [固定]设为false的应用栏：
/// {@animation 476400 https://flutter.github.io/assets-for-api-docs/assets/material/app_bar.mp4}
/// * * [固定]设置为true的应用栏：
/// {@animation 476400 https://flutter.github.io/assets-for-api-docs/assets/material/app_bar_pinned.mp4}
///
/// 也可以看看：
///
/// * [SliverAppBar]有关此属性如何结合[floating]更改应用程序栏行为的更多动画示例。


///  snap
///
///如果[snap]和[floating]为true，则浮动应用程序栏将“捕捉”到视图中。
///
///如果[snap]为true，则显示浮动应用程序栏的滚动将触发动画，该动画会将整个应用程序栏滑动到视图中。
///同样，如果滚动取消了应用栏，则动画将使应用栏完全滑出视线。
///此外，当框架尝试通过调用[RenderObject.showOnScreen]来显示应用栏的内容时，将[snap]设置为true将完全扩展浮动应用栏。
///例如，当浮动应用程序栏中的[TextField]获得焦点时，如果[snap]为true，则框架将始终完全展开浮动应用程序栏，以显示聚焦的[TextField]。
///
///仅当应用程序栏处于浮动状态时，才应用快照，而当应用程序栏出现在其滚动视图的顶部时，则不适用。
///
/// ##动画示例
///
///以下动画显示了应用栏如何基于此属性的值更改其滚动行为。
///
/// * * [snap]设置为false的应用栏：
/// {@animation 476400 https://flutter.github.io/assets-for-api-docs/assets/material/app_bar_floating.mp4}
/// * * [snap]设置为true的应用栏：
/// {@animation 476400 https://flutter.github.io/assets-for-api-docs/assets/material/app_bar_floating_snap.mp4}
///
/// 也可以看看：
///
/// * [SliverAppBar]有关此属性如何结合[pinned]和[floating]更改应用程序栏行为的更多动画示例。



class SliverAppBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'SliverAppBar',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => SliverAppBarDemo1())),
              child: Text('演示1'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => SliverAppBarDemo2())),
              child: Text('演示2'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => SliverAppBarDemo3())),
              child: Text('演示3'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => SliverAppBarDemo4())),
              child: Text('演示4'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => SliverAppBarDemo5())),
              child: Text('演示5'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => SliverAppBarDemo6())),
              child: Text('演示6'),
            ),
          ),
        ],
      ),
    );
  }
}


//以下演示显示了当用户向上滚动然后再次向下滚动时，具有不同配置的应用栏的行为。

class SliverAppBarDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('演示1'),
            expandedHeight: 150,
            flexibleSpace: FlexibleSpaceBar(),
            floating: false,
            pinned: false,
            snap: false,
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
            sliver: SliverToBoxAdapter(
              child: Center(
                child: Text(
                  'floating: false, pinned: false, snap: false,',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                color: index % 2 == 0 ? Colors.white : Colors.grey[300],
                child: Center(
                  child: Text('item: $index'),
                ),
              ),
              childCount: 20,
            ),
            itemExtent: 50,
          ),
        ],
      ),
    );
  }
}

class SliverAppBarDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('演示2'),
            expandedHeight: 150,
            flexibleSpace: FlexibleSpaceBar(),
            floating: true,
            pinned: false,
            snap: false,
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
            sliver: SliverToBoxAdapter(
              child: Center(
                child: Text(
                  'floating: true, pinned: false, snap: false,',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) => Container(
                color: index % 2 == 0 ? Colors.white : Colors.grey[300],
                child: Center(
                  child: Text('item: $index'),
                ),
              ),
              childCount: 20,
            ),
            itemExtent: 50,
          ),
        ],
      ),
    );
  }
}

class SliverAppBarDemo3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('演示3'),
            expandedHeight: 150,
            flexibleSpace: FlexibleSpaceBar(),
            floating: true,
            pinned: false,
            snap: true,
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
            sliver: SliverToBoxAdapter(
              child: Center(
                child: Text(
                  'floating: true, pinned: false, snap: true,',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) => Container(
                color: index % 2 == 0 ? Colors.white : Colors.grey[300],
                child: Center(
                  child: Text('item: $index'),
                ),
              ),
              childCount: 20,
            ),
            itemExtent: 50,
          ),
        ],
      ),
    );
  }
}

class SliverAppBarDemo4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('演示4'),
            expandedHeight: 150,
            flexibleSpace: FlexibleSpaceBar(),
            floating: true,
            pinned: true,
            snap: false,
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
            sliver: SliverToBoxAdapter(
              child: Center(
                child: Text(
                  'floating: true, pinned: true, snap: false,',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) => Container(
                color: index % 2 == 0 ? Colors.white : Colors.grey[300],
                child: Center(
                  child: Text('item: $index'),
                ),
              ),
              childCount: 20,
            ),
            itemExtent: 50,
          ),
        ],
      ),
    );
  }
}

class SliverAppBarDemo5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('演示5'),
            expandedHeight: 150,
            flexibleSpace: FlexibleSpaceBar(),
            floating: true,
            pinned: true,
            snap: true,
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
            sliver: SliverToBoxAdapter(
              child: Center(
                child: Text(
                  'floating: true, pinned: true, snap: true,',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) => Container(
                color: index % 2 == 0 ? Colors.white : Colors.grey[300],
                child: Center(
                  child: Text('item: $index'),
                ),
              ),
              childCount: 20,
            ),
            itemExtent: 50,
          ),
        ],
      ),
    );
  }
}

class SliverAppBarDemo6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('演示6'),
            expandedHeight: 150,
            flexibleSpace: FlexibleSpaceBar(),
            floating: false,
            pinned: true,
            snap: false,
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
            sliver: SliverToBoxAdapter(
              child: Center(
                child: Text(
                  'floating: false, pinned: true, snap: false,',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) => Container(
                color: index % 2 == 0 ? Colors.white : Colors.grey[300],
                child: Center(
                  child: Text('item: $index'),
                ),
              ),
              childCount: 20,
            ),
            itemExtent: 50,
          ),
        ],
      ),
    );
  }
}
