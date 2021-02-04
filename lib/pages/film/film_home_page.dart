import 'package:alice/common/const/constant.dart';
import 'package:alice/routes/movie/home/hot_movie.dart';
import 'package:alice/routes/movie/home/movie_carousel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilmHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('热映电影'),
      ),
      child: ListView(
      children: [
        MovieCarouselView(),
        HotMovieView(style: Constant.cupertino,),
      ],
    ),
    );
  }

}