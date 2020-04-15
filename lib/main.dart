import 'package:alice/ui/function/fourth_bottom_navigationbar_itemview.dart';
import 'package:alice/ui/life/third_bottom_navigationbar_itemview.dart';
import 'package:alice/ui/movie/second_bottom_navigationbar_itemview.dart';
import 'package:alice/ui/news/first_bottom_navigationbar_itemview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';



void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
    /// 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}


// 全局配置子树下的SmartRefresher,下面列举几个特别重要的属性
/*RefreshConfiguration(
headerBuilder: () => WaterDropHeader(),        // 配置默认头部指示器,假如你每个页面的头部指示器都一样的话,你需要设置这个
footerBuilder:  () => ClassicFooter(),        // 配置默认底部指示器
headerTriggerDistance: 80.0,        // 头部触发刷新的越界距离
springDescription:SpringDescription(stiffness: 170, damping: 16, mass: 1.9),         // 自定义回弹动画,三个属性值意义请查询flutter api
maxOverScrollExtent :100, //头部最大可以拖动的范围,如果发生冲出视图范围区域,请设置这个属性
maxUnderScrollExtent:0, // 底部最大可以拖动的范围
enableScrollWhenRefreshCompleted: true, //这个属性不兼容PageView和TabBarView,如果你特别需要TabBarView左右滑动,你需要把它设置为true
enableLoadingWhenFailed : true, //在加载失败的状态下,用户仍然可以通过手势上拉来触发加载更多
hideFooterWhenNotFull: false, // Viewport不满一屏时,禁用上拉加载更多功能
enableBallisticLoad: true, // 可以通过惯性滑动触发加载更多
child: MaterialApp(
........
)
);*/


class MyApp extends StatelessWidget {
  static const String _title = 'Alcie';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: HomeScreenStatefulWidget(),
    );
  }
}


/*首页*/
class HomeScreenStatefulWidget extends StatefulWidget {
  HomeScreenStatefulWidget({Key key}) : super(key: key);

  @override
  _HomeScreenStatefulWidgetState createState() => _HomeScreenStatefulWidgetState();
}

class _HomeScreenStatefulWidgetState extends State<HomeScreenStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  List<Widget> _widgetOptions = <Widget>[
    FirstBottomNavigationBarItemView(),
    SecondBottomNavigationBarItemView(),
    ThirdBottomNavigationBarItemView(),
    FourthBottomNavigationBarItemView(),
  ];


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex),/*_widgetOptions[_selectedIndex],*/
      ),
      bottomNavigationBar: BottomNavigationBar(
        //type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.black54,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.description),
            title: Text('新闻'),
            backgroundColor: Colors.blueAccent[200],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            title: Text('电影'),
            backgroundColor: Colors.teal[400],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mood),
            title: Text('笑话'),
            backgroundColor: Colors.deepOrangeAccent[100],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more),
            title: Text('更多'),
            backgroundColor: Colors.cyan[200],
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}


















