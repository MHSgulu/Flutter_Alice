import 'package:alice/common/const/colors.dart';
import 'package:alice/common/const/constant.dart';
import 'package:alice/common/global/theme_mode.dart';
import 'package:alice/routes/drawer/my_drawer.dart';
import 'package:alice/widgets/custom/custom_scroll_behavior.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import 'home/hot_movie.dart';
import 'home/movie_carousel.dart';

class MovieHomePage extends StatefulWidget {
  @override
  _MovieHomePageState createState() => _MovieHomePageState();
}

class _MovieHomePageState extends State<MovieHomePage> with AutomaticKeepAliveClientMixin{

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
            backgroundColor: AppThemeMode.isDark ? MyColors.appBarDarkColor : Colors.teal[400],
            leading: Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.menu_rounded),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
            title: Container(
              height: 32.5,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: StadiumBorder(
                  side: BorderSide(
                    color: Colors.white,
                    width: 1.0,
                  ),
                ),
              ),
              child: GestureDetector(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      child: Image.asset('assets/icons/icon_search_movie.png',width: 24,),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        '搜索你想了解的电影',
                        style: TextStyle(color: Colors.grey[600], fontSize: 13.5),
                      ),
                    ),
                  ],
                ),
                onTap: (){
                  Fluttertoast.showToast(msg: '没这功能，就是玩，嘿嘿');
                },
              ),
            ),
            actions: <Widget>[
              IconButton(
                color: Colors.white,
                icon: Icon(Icons.movie_filter),
                onPressed: () => Fluttertoast.showToast(msg: '别点了，没这功能'),
              )
            ],
            elevation: 1,
          ),
          body: ScrollConfiguration(
            behavior: CustomScrollBehavior(),
            child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      MovieCarouselView(), //轮播图
                      HotMovieView(style: Constant.material,), //正在热映
                    ],
                  ),
                )),
          ),
          drawer: MyDrawer(),
        ),
      ),
    );
  }
}
