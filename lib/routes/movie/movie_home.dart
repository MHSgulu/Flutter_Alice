import 'package:alice/common/const/colors.dart';
import 'package:alice/common/global/theme_mode.dart';
import 'package:alice/widgets/custom/custom_scroll_behavior.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home/hot_movie.dart';
import 'home/movie_carousel.dart';

class MovieHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppThemeMode(),
      child: Consumer<AppThemeMode>(
        builder: (context, theme, child) => Scaffold(
          appBar: AppBar(
            backgroundColor: AppThemeMode.isDark ? MyColors.appBarDarkColor : Colors.teal[400],
            title: Container(
              height: 35.0,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: StadiumBorder(
                  side: BorderSide(
                    color: Colors.white,
                    width: 1.0,
                  ),
                ),
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 8),
                    child: Image.asset('assets/icons/icon_search_movie.png',width: 24,),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      '点击此处搜索你想了解的电影',
                      style: TextStyle(color: Colors.grey[600], fontSize: 14.0),
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              IconButton(
                color: Colors.white,
                icon: Icon(Icons.movie_filter),
                onPressed: () {},
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
                      HotMovieView(), //正在热映
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
