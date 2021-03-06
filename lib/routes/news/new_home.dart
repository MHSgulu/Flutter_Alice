import 'package:alice/common/const/colors.dart';
import 'package:alice/common/global/theme_mode.dart';
import 'package:alice/routes/drawer/my_drawer.dart';
import 'package:alice/widgets/custom/custom_scroll_behavior.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'hotspot/hot_word_classification.dart';
import 'search_news_screen.dart';
import 'tab_news_list.dart';

class NewsHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NewsHomePageState();
}

class NewsHomePageState extends State<NewsHomePage> with SingleTickerProviderStateMixin,AutomaticKeepAliveClientMixin{
  TabController _tabController;

  List<Tab> newsTabs = <Tab>[
    Tab(text: '头条'),
    Tab(text: '新闻'),
    Tab(text: '国内'),
    Tab(text: '国际'),
    Tab(text: '政治'),
    Tab(text: '财经'),
    Tab(text: '体育'),
    Tab(text: '娱乐'),
    Tab(text: '军事'),
    Tab(text: '教育'),
    Tab(text: '科技'),
    Tab(text: 'NBA'),
    Tab(text: '股票'),
    Tab(text: '星座'),
    Tab(text: '女性'),
    Tab(text: '健康'),
    Tab(text: '育儿'),
  ];

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: newsTabs.length);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider(
      create: (context) => AppThemeMode(),
      child: Consumer<AppThemeMode>(
        builder: (context, theme, child) => Scaffold(
          appBar: AppBar(
            backgroundColor: AppThemeMode.isDark ? MyColors.appBarDarkColor : Colors.blueAccent[200],
            leading: Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.menu_rounded),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
            title: Container(
              height: 32.5,
              decoration: ShapeDecoration(
                color: Colors.white, //此处颜色若不设置，会被同化成AppBar背景色
                shape: StadiumBorder(
                  /*side: BorderSide(
                    color: Colors.white,
                    width: 1.0,
                  ),*/
                ),
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    //color: Colors.black45,
                    padding: EdgeInsets.only(left: 4),
                    child: Image.asset('assets/icons/icon_search_news.png'),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 8),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SearchNewsScreen()));
                      },
                      child: Text(
                        '搜索你想了解的新闻',
                        style: TextStyle(color: Colors.black45, fontSize: 13.5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              IconButton(
                color: Colors.white,
                icon: Icon(Icons.assessment), //如果[onPressed]不为空，则启用该图标。 之前值为null 颜色没变化
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HotWordClassification()),
                  ),
              )
            ],
            elevation: 1,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(48.0),
              child: Material(
                color: AppThemeMode.isDark ? MyColors.appBarDarkColor : Colors.white,
                child: TabBar(
                  isScrollable: true,
                  indicatorColor: Colors.blueAccent[200],
                  indicatorWeight: 2.0,
                  indicatorPadding: EdgeInsets.zero,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelColor: Colors.blueAccent[200],
                  unselectedLabelColor: AppThemeMode.isDark ? Colors.white54 : Colors.black54,
                  controller: _tabController,
                  tabs: newsTabs,
                ),
              ),
            ),
          ),
          body: ScrollConfiguration(
            behavior: CustomScrollBehavior(),
            child: TabBarView(
            controller: _tabController,
            children: [
              for (final tab in newsTabs) TabNewsList(channelName: tab.text),
            ],
          ),
          ),
          drawer: MyDrawer(),
        ),
      ),
    );
  }

}
