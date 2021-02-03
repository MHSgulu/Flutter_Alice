import 'package:alice/pages/film/film_home_page.dart';
import 'package:alice/pages/news/news_home_page.dart';
import 'package:alice/pages/video/video_home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:alice/common/const/cupertino_routes.dart';


class CupertinoHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CupertinoHomePageState();
}

class CupertinoHomePageState extends State<CupertinoHomePage> {
  List<Widget> _widgetOptions;

  @override
  void initState() {
    _widgetOptions = [
      NewsHomePage(),
      FilmHomePage(),
      VideoHomePage(),
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
    ///一个iOS样式的底部导航选项卡栏。
    ///
    ///使用[BottomNavigationBarItem]显示多个标签，其中一个标签处于活动状态，默认情况下第一个标签。
    ///
    ///此[StatelessWidget]不存储活动选项卡本身。
    ///您必须监听[onTap]回调并使用新的[currentIndex]调用setState以反映新的选择。
    ///也可以通过用[CupertinoTabScaffold]包裹自动完成此操作。
    ///
    ///根据标准的iOS设计，更改制表符通常会触发[Navigator]之间的切换，每个都有自己的导航堆栈。
    ///这可以通过使用[CupertinoTabScaffold]中每个选项卡构建器中的[CupertinoTabView]来完成
    ///
    ///如果给定的[backgroundColor]的不透明度不是1.0（默认情况下是这种情况），它将对其后面的内容产生模糊效果。
    ///
    ///用作[CupertinoTabScaffold.tabBar]时，默认情况下，`CupertinoTabBar`的文本比例因子设置为1.0，并且不响应操作系统中文本比例因子的变化，以匹配本机iOS行为。
    ///要覆盖此行为，请使用所需的[MediaQueryData.textScaleFactor]值将每个`navigationBar`组件包装在[MediaQuery]中。
    ///可以通过多种方式检索操作系统中的文本比例因子值，例如，根据[CupertinoApp]的[BuildContext]查询[MediaQuery.textScaleFactorOf]。
    ///
    /// 也可以看看：
    ///
    /// * [CupertinoTabScaffold]，在底部托管[CupertinoTabBar]。
    /// * [BottomNavigationBarItem]，[CupertinoTabBar]中的一项。
    return CupertinoTabBar(///创建iOS风格的标签栏。
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
      builder: (BuildContext context) => _widgetOptions[index],
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
