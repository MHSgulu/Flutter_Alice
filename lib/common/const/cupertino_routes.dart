import 'package:alice/pages/film/film_details_page.dart';
import 'package:alice/pages/news/news_detail_page.dart';
import 'package:alice/pages/video/play_video_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> cupertinoRoutes = {
  //新闻模块
  PageName.newsDetailPage: (_) => NewsDetailPage(), //新闻详情页面
  //电影模块
  PageName.filmDetailsPage: (_) => FilmDetailsPage(), //电影详情页面
  //视频模块
  PageName.playVideoPage: (_) => PlayVideoPage(), //视频详情页面
};

class PageName {
  //电影模块
  static final String newsDetailPage = '/newsDetailPage';
  //电影模块
  static final String filmDetailsPage = '/filmDetailsPage';
  //视频模块
  static final String playVideoPage = '/playVideoPage';
}
