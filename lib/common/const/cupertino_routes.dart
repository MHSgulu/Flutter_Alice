import 'package:alice/pages/film/film_details_page.dart';
import 'package:alice/pages/video/play_video_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> cupertinoRoutes = {
  //电影模块
  RouteName.filmDetailsPage: (_) => FilmDetailsPage(), //电影详情页面
  //视频模块
  RouteName.playVideoPage: (_) => PlayVideoPage(), //视频详情页面
};

class RouteName {
  //电影模块
  static final String filmDetailsPage = '/filmDetailsPage';
  //视频模块
  static final String playVideoPage = '/playVideoPage';
}
