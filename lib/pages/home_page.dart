import 'package:alice/pages/film/film_home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:alice/common/const/cupertino_routes.dart';

class CupertinoHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CupertinoHomePageState();
}

class CupertinoHomePageState extends State<CupertinoHomePage> {
  List<String> titleList = [
    '新闻',
    '电影',
    '视频',
    '待定',
  ];

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

  Widget _cupertinoTabBar() {
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
          icon: Icon(CupertinoIcons. /*compass*/ plus_circle),
          activeIcon: Icon(CupertinoIcons.plus_circle_fill),
          label: '更多',
        ),
      ],
    );
  }

  Widget _tabBuilder(BuildContext context, int index) {
    //使用CupertinoTabView作为每个选项卡的根窗口小部件，以支持具有并行导航状态和历史记录的选项卡。
    // 由于每个CupertinoTabView都包含一个导航器，
    // 因此在CupertinoTabView.builder中使用其他WidgetBuilder实例重建CupertinoTabView不会重新创建CupertinoTabView的导航堆栈或更新其UI。
    // 要在CupertinoTabView生成后更新其内容，请从其后代而不是其祖先触发重建（例如，通过State.setState进行）。
    return CupertinoTabView(
      //选项卡视图的默认路由的窗口小部件构建器（[Navigator.defaultRouteName]，为`/`）。
      //如果指定了[builder]，则[routes]不得包含`/`的条目，因为[builder]会代替它。
      //用其他[builder]重建[CupertinoTabView]不会清除其当前导航堆栈或更新其后代。 而是从其子树中的后代触发重建。 这可以通过以下方法来完成：
      // *在子孙[StatefulWidget]的[State]上调用[State.setState]
      // *修改后代将其注册为从属的[InheritedWidget]。
      builder: (BuildContext context) {
        //实现单个iOS应用程序页面的布局。
        //支架将导航栏布置在顶部，并将内容布置在导航栏之间或之后。
        return CupertinoPageScaffold(
          //为页面创建布局，顶部带有导航栏。
          navigationBar: CupertinoNavigationBar(
            ///放置在导航栏开始处的小部件。
            ///通常，正常页面的后退按钮或整页对话框的取消按钮。
            ///如果为null且[automaticallyImplyLeading]为true，则会自动创建一个适当的按钮。
            leading: null,
            middle: Text(titleList[index]),
          ),
          child: _widgetOptions[index],
        );
      },
      ///默认路由的标题。
      defaultTitle: 'Cuperitino Home',
      ///此选项卡视图的路由表。
      ///在此选项卡视图中使用[Navigator.pushNamed]推送命名的路线时，将在此地图中查找路线名称。
      ///如果存在该名称，则使用关联的[WidgetBuilder]构造一个[CupertinoPageRoute]，以执行到新路由的适当转换。
      ///如果选项卡视图只有一页，则可以使用[builder]来指定它。
      ///如果指定了[builder]，则表示此表中的条目[Navigator.defaultRouteName]路由（`/`），并且在[routes]表中冗余地提供这样的路由是错误的。
      ///如果请求的路由未在此表中指定（或通过[builder]），然后调用[onGenerateRoute]回调来构建页面。
      ///此路由表不与任何祖先或后代[Navigator]的路由表共享。
      routes: cupertinoRoutes,
    );
  }
}
