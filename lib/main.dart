import 'package:alice/ui/life/third_bottom_navigationbar_itemview.dart';
import 'package:alice/ui/more/show_more.dart';
import 'package:alice/ui/movie/second_bottom_navigationbar_itemview.dart';
import 'package:alice/ui/one/first_bottom_navigationbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

///从Dart 2开始，new关键字是可选的

///将给定的路由推到最紧密地包围给定上下文的导航器上，然后删除所有先前的路由，直到“predicate”返回true。
///   Navigator.pushAndRemoveUntil(
///     context,
///     MaterialPageRoute(builder: (BuildContext context) => MyHomePage()),
///     ModalRoute.withName('/'),
///   );

///ModalRoute   阻止与以前的路由交互的路由。
///[ModalRoute]覆盖整个[Navigator]。他们不一定[不透明]，例如，一个弹出菜单使用了一个[ModalRoute]，但是只在一个小框中显示菜单，与前面的路径重叠。

///withName  如果路由具有指定的名称并且如果弹出路线不会产生相同的路线，即，如果路线的[willHandlePopInternally]属性为false。此函数通常与[Navigator.popntil导航器()].

void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
    /// 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent); //指定系统覆盖样式的首选项。
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle); ///顶部状态栏的颜色。仅支持Android M及更高版本中。
  }
}

class MyApp extends StatelessWidget {
  static const String _title = 'Alcie';

  //  这个小部件是应用程序的根。
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //去掉DuBug模式下 右上角的标志
      title: _title,
      theme: ThemeData(
          //这是应用程序的主题。
          /// dark   颜色是深色的，需要一个浅色的文本颜色来实现可读的对比。
          /// 例如，颜色可能是深灰色，需要白色文本。
          /// light  颜色是浅色的，需要深色文本颜色来实现可读的对比。
          /// 例如，颜色可能是亮白色，需要黑色文本.
          //brightness: Brightness.light,
          primarySwatch: Colors.blue),
      home: WillPopScopeHome(),
    );
  }
}

class WillPopScopeHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WillPopScopeHomeState();
}

class WillPopScopeHomeState extends State<WillPopScopeHome> {
  DateTime _lastClickTime; //在首页范围内上一次点击系统返回键的时间

  @override
  Widget build(BuildContext context) {
    ///创建一个小部件，该小部件注册一个回调，以回调用户的否决尝试，以关闭封闭的[ModalRoute]。
    /// [child]参数不能为null。
    return WillPopScope(
        child: HomeScreenWidget(),

        ///由用户调用否决权尝试以关闭封闭的[ModalRoute]。
        ///如果回调返回的Future解析为false，则不会弹出封闭路由。
        onWillPop: () async {
          //如果用户初次点击返回键或者连续两次点击返回键间隔时间大于1秒
          if (_lastClickTime == null ||
              DateTime.now().difference(_lastClickTime) >
                  Duration(seconds: 1)) {
            ///返回[Duration]，其中包含[this]和[other]之间的差异。这种差异是以秒和秒的分数来衡量的。
            Fluttertoast.showToast(msg: '连点两次返回键即可退出');
            _lastClickTime = DateTime.now();
            print('数据点位： 在首页范围内上一次点击系统返回键的时间：$_lastClickTime');
            return false;
          } else {
            return true;
          }
        });
  }
}

class HomeScreenWidget extends StatefulWidget {
  //Widget子类中的字段是始终标记为“final”。

  @override
  _HomeScreenWidgetState createState() => _HomeScreenWidgetState();
}

///这个小部件是应用程序的主页。它是有状态的，这意味着它有一个状态对象（定义如下），其中包含影响其外观的字段。
///这个类是状态的配置。它保存父程序提供的值，并由状态的build方法使用。小部件子类中的字段总是标记为“final”。
class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  int _currentIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    FirstBottomNavigationBarItemView(),
    SecondBottomNavigationBarItemView(),
    ThirdBottomNavigationBarItemView(),
    FourthBottomNavigationBarItemView(),
  ];

  List<BottomNavigationBarItem> _bottomNavigationBarItemList = [
    BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage('assets/icons/icon_news.png'),
      ),
      activeIcon: Icon(Icons.library_books /*book*/ /*collections_bookmark*/),
      title: Text('新闻'),
      //backgroundColor: Colors.blueAccent[200],
    ),
    BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage('assets/icons/icon_movie.png'),
      ),
      activeIcon: Icon(Icons.video_library /*movie_filter*/ /*library_music*/),
      title: Text('电影'),
      //backgroundColor: Colors.teal[400],
    ),
    BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage('assets/icons/icon_picture.png'),
      ),
      title: Text('待定'),
      activeIcon: Icon(Icons.collections /*perm_media*/),
      // backgroundColor: Colors.deepOrangeAccent[100],
    ),
    BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage('assets/icons/icon_more.png'),
      ),
      activeIcon: Icon(Icons.library_add /*widgets*/),
      title: Text('更多'),
      //backgroundColor: Colors.cyan[200],
    ),
  ];

  Color _getSelectedItemColor() {
    return _currentIndex == 0
        ? Colors.blueAccent[200]
        : _currentIndex == 1
            ? Colors.teal[400]
            : _currentIndex == 2
                ? Colors.deepOrangeAccent[100]
                : Colors.cyan[300];
  }

  ///对setState的调用告诉Flutter框架在这种状态下发生了一些变化，这导致它重新运行下面的build方法，以便显示可以反映更新的值。
  ///如果我们在不调用setState（）的情况下更改了索引，则不会再次调用生成方法，因此看起来不会发生任何事情。
  void _onItemTapped(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    //此方法在每次调用setState时都会重新运行
    return Scaffold(
      body: Container(
        ///返回第[index]个元素。
        ///[索引]必须为非负且小于[长度]。
        ///索引0表示第一个元素  (因此iterable.elementAt(0) 相当于 iterable.first)
        ///可以按迭代顺序迭代元素，忽略第一个[index]元素，然后返回下一个元素。
        ///有些iterable可能有更有效的方法来找到元素。
        child: _widgetOptions.elementAt(_currentIndex), /*_widgetOptions[_currentIndex],*/
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        ///The [showUnselectedLabels] argument defaults
        ///if [type] is [BottomNavigationBarType.fixed]   `true`
        ///if [type] is[BottomNavigationBarType.shifting]. `false`
        //showUnselectedLabels: true,
        selectedItemColor: _getSelectedItemColor(),
        unselectedItemColor: Colors.black38,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        ///当点击[item]之一时调用。
        ///创建底部导航栏的有状态小部件需要跟踪所选[BottomNavigationBarItem]的索引，并调用`setState`以使用新的[currentIndex]重建底部导航栏。
        onTap: _onItemTapped,
        currentIndex: _currentIndex,
        items: _bottomNavigationBarItemList,
      ),
    );
  }
}
