import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'health/health_home.dart';
import 'movie/movie_home.dart';
import 'news/new_home.dart';
import 'video/featured_video_home.dart';

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
        child: HomePage(),

        ///由用户调用否决权尝试以关闭封闭的[ModalRoute]。
        ///如果回调返回的Future解析为false，则不会弹出封闭路由。
        onWillPop: () async {
          //如果用户初次点击返回键或者连续两次点击返回键间隔时间大于1秒
          if (_lastClickTime == null ||
              DateTime.now().difference(_lastClickTime) >
                  Duration(seconds: 1)) {
            ///返回[Duration]，其中包含[this]和[other]之间的差异。这种差异是以秒和秒的分数来衡量的。
            Fluttertoast.showToast(msg: '再按一次退出');
            _lastClickTime = DateTime.now();
            print('数据点位： _lastClickTime：$_lastClickTime');
            return false;
          } else {
            return true;
          }
        });
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

///这个小部件是应用程序的主页。它是有状态的，这意味着它有一个状态对象（定义如下），其中包含影响其外观的字段。
///这个类是状态的配置。它保存父程序提供的值，并由状态的build方法使用。小部件子类中的字段总是标记为“final”。
class _HomePageState extends State<HomePage> {
  int _currentIndex;
  PageController _pageController;

  @override
  void initState() {
    _currentIndex = 0;
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  Color _getSelectedItemColor() {
    return _currentIndex == 0
        ? Colors.blueAccent[200]
        : _currentIndex == 1
            ? Colors.teal[400]
            : _currentIndex == 2
                ? Colors.deepOrangeAccent[100]
                : Colors.cyan[300];
  }

  void _onPageChanged(int index){
    if (mounted) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  //原版 无PageView
  /* @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        ///返回第[index]个元素。
        ///[索引]必须为非负且小于[长度]。
        ///索引0表示第一个元素  (因此iterable.elementAt(0) 相当于 iterable.first)
        ///可以按迭代顺序迭代元素，忽略第一个[index]元素，然后返回下一个元素。
        ///有些iterable可能有更有效的方法来找到元素。
        child: _widgetOptions.elementAt(_currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        //backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        ///[showUnselectedLabels] 参数默认值
        ///如果[type]是[BottomNavigationBarType.fixed]   `true`
        ///如果[type]是[BottomNavigationBarType.shifting]. `false`
        //showUnselectedLabels: true,
        selectedItemColor: _getSelectedItemColor(),
        //unselectedItemColor: Colors.black38,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        ///当点击[item]之一时调用。
        ///创建底部导航栏的有状态小部件需要跟踪所选[BottomNavigationBarItem]的索引，并调用`setState`以使用新的[currentIndex]重建底部导航栏。
        onTap: _onItemTapped,
        currentIndex: _currentIndex,
        items: _bottomNavigationBarItemList,
      ),
    );
  }*/

  //结合PageView
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        //pageSnapping: false, ///禁用页面捕捉，滑动之后页面不会自动对齐。
        //allowImplicitScrolling: true, //灵敏的滑动，稍微滑一点就会到下一页。
        onPageChanged: _onPageChanged,
        children: [
          NewsHomePage(),
          MovieHomePage(),
          FeaturedVideoHomePage(),
          HealthHome(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => _pageController.jumpToPage(index),
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/icon_news.png'),
            ),
            activeIcon: Icon(Icons.library_books_rounded),
            label: '新闻',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/icon_picture.png'),
            ),
            activeIcon: Icon(Icons.collections_rounded),
            label: '电影',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/icon_movie.png'),
            ),
            label: '视频',
            activeIcon: Icon(Icons.video_library_rounded),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/icon_more.png'),
            ),
            activeIcon: Icon(Icons.library_add_rounded),
            label: '疫情',
          ),
        ],
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: _getSelectedItemColor(),
        selectedFontSize: 12,
        unselectedFontSize: 12,
        mouseCursor: SystemMouseCursors.click, //鼠标指针进入或悬停在图块上时的光标。//如果此属性为null，则将使用[SystemMouseCursors.click]。
      ),
    );
  }
}
