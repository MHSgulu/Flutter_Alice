import 'package:alice/ui/life/third_bottom_navigationbar_itemview.dart';
import 'package:alice/ui/more/fourth_bottom_navigationbar_itemview.dart';
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




class MyApp extends StatelessWidget {
  static const String _title = 'Alcie';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,  ///去掉DuBug模式下 右上角的标志
      title: _title,
      /*theme: ThemeData(
        primarySwatch: Colors.red
      ),*/
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


















