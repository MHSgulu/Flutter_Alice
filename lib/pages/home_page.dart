import 'package:alice/pages/film/film_home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class CupertinoHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CupertinoHomePageState();
}

class CupertinoHomePageState extends State<CupertinoHomePage> {
  List<String> titleList = ['新闻', '电影', '视频', '待定',];

  List<Widget> _widgetOptions;

  @override
  void initState() {
    _widgetOptions = [
      Center(
        child: Text('新闻'),
      ),
      FilmHomePage(),
      Center(
        child: Text('视频'),
      ),
      Center(
        child: Text('待定'),
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //实现选项卡式iOS应用程序的根布局和行为结构。
    return CupertinoTabScaffold(
      //tabBar和tabBuilder是必需的。
      //CupertinoTabScaffold将自动监听提供的CupertinoTabBar的tap回调以更改活动选项卡。
      tabBar: _cupertinoTabBar(),
      //标签的内容是使用活动标签索引处提供的tabBuilder构建的。
      // tabBuilder必须能够构建与tabBar项相同数量的页面。
      // 不活动的标签将移到后台，并且其动画将被禁用
      tabBuilder: _tabBuilder,
      //controller可用于提供最初选择的选项卡索引并管理后续的选项卡更改。
      // 如果未指定控制器，则支架将创建其自己的CupertinoTabController并在内部进行管理。
      // 否则，在使用完控制器后，由控制器的所有者调用对其进行处置。
      //controller: ,
    );
  }

  Widget _cupertinoTabBar(){
    return CupertinoTabBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.book_circle),
          activeIcon: Icon(CupertinoIcons.book_circle_fill),
          label: '新闻',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.camera_circle),
          activeIcon: Icon(CupertinoIcons.camera_circle_fill),
          label: '电影',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.arrowtriangle_right_circle),
          activeIcon: Icon(CupertinoIcons.arrowtriangle_right_circle_fill),
          label: '视频',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons./*compass*/plus_circle),
          activeIcon: Icon(CupertinoIcons.plus_circle_fill),
          label: '更多',
        ),
      ],
    );
  }

  Widget _tabBuilder(BuildContext context, int index){
    //使用CupertinoTabView作为每个选项卡的根窗口小部件，以支持具有并行导航状态和历史记录的选项卡。
    // 由于每个CupertinoTabView都包含一个导航器，
    // 因此在CupertinoTabView.builder中使用其他WidgetBuilder实例重建CupertinoTabView不会重新创建CupertinoTabView的导航堆栈或更新其UI。
    // 要在CupertinoTabView生成后更新其内容，请从其后代而不是其祖先触发重建（例如，通过State.setState进行）。
    return CupertinoTabView(
      builder: (BuildContext context) {
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text(titleList[index]),
          ),
          child: _widgetOptions[index],
        );
      },
    );
  }

}