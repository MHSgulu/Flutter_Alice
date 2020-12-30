import 'package:alice/routes/more/article/article_of_the_day.dart';
import 'package:alice/routes/more/bing/bing_wallpaper.dart';
import 'package:alice/routes/more/chat/chat_settings.dart';
import 'package:alice/routes/more/chat/chat_with_robot.dart';
import 'package:alice/routes/more/chat/settings/set_chat_background.dart';
import 'package:alice/routes/more/guide/guide_dynamic_effect.dart';
import 'package:alice/routes/more/guide/guide_flutter_favorite.dart';
import 'package:alice/routes/more/show_page.dart';
import 'package:alice/routes/more/wallpaper/computer/computer_wallpaper.dart';
import 'package:alice/routes/more/wallpaper/computer/computer_wallpaper_list.dart';
import 'package:alice/routes/more/wallpaper/computer/popular_searches.dart';
import 'package:alice/routes/more/wallpaper/phone/phone_wallpaper.dart';
import 'package:alice/routes/more/wallpaper/phone/phone_wallpaper_list.dart';
import 'package:flutter/material.dart';

import 'package:alice/routes/more/setting.dart';
import 'package:alice/routes/more/english_quotations.dart';
import 'package:alice/routes/more/garbage/garbage_classification.dart';
import 'package:alice/routes/more/guide/guide_community_package.dart';
import 'package:alice/routes/more/guide/guide_cupertino_widget.dart';
import 'package:alice/routes/more/guide/guide_example_route.dart';
import 'package:alice/routes/more/guide/guide_hot_pub.dart';
import 'package:alice/routes/more/guide/guide_material_widget.dart';
import 'package:alice/routes/more/guide/guide_official_dart_package.dart';
import 'package:alice/routes/more/guide/guide_official_package.dart';
import 'package:alice/routes/more/guide/guide_official_plugin.dart';
import 'package:alice/routes/more/guide/guide_official_widget.dart';
import 'package:alice/routes/more/guide/guide_plugin.dart';
import 'package:alice/routes/more/guide/guide_rive.dart';
import 'package:alice/routes/more/joke/life_interest_picture.dart';
import 'package:alice/routes/more/model/tao_model_route.dart';
import 'package:alice/routes/more/query_mobile_home.dart';
import 'package:alice/routes/more/recipes/recipes_route.dart';
import 'package:alice/routes/more/setting/multi_language.dart';

Map<String, WidgetBuilder> routes = {
  //抽屉模块
  RouteName.showMoreRoute: (context) => ShowMoreRoute(), //功能列表页面
  RouteName.guideExampleRoute: (context) => GuideExampleRoute(), //示例页面
  RouteName.settingPage: (context) => SettingPage(), //设置页面
  //功能模块
  RouteName.queryMobileHome: (context) => QueryMobileHome(), //查询手机号码归属地页面
  RouteName.englishQuotations: (context) => EnglishQuotations(), //英文励志语录页面
  RouteName.bingWallpaperRoute: (context) => BingWallpaperRoute(), //必应壁纸页面
  RouteName.chatRobotList: (context) => ChatRobotList(), //聊天页面
  RouteName.chatSettingsRoute: (context) => ChatSettingsRoute(), //聊天设置页面
  RouteName.setChatBackgroundRoute: (context) => SetChatBackgroundRoute(), //设置聊天背景页面
  RouteName.taoModel: (context) => TaoModel(), //淘宝模特
  RouteName.lifeInterestPictureRoute: (context) => LifeInterestPictureRoute(), //搞笑趣图
  RouteName.recipesRoute: (context) => RecipesRoute(), //菜谱大全
  RouteName.garbageClassification: (context) => GarbageClassification(), //垃圾分类
  RouteName.articleOfTheDayRoute: (context) => ArticleOfTheDayRoute(), //每日一文
  RouteName.phoneWallpaperRoute: (context) => PhoneWallpaperRoute(), //手机壁纸类别
  RouteName.phoneWallpaperList: (context) => PhoneWallpaperList(), //手机壁纸列表
  RouteName.computerWallpaperRoute: (context) => ComputerWallpaperRoute(), //电脑壁纸类别
  RouteName.computerWallpaperList: (context) => ComputerWallpaperList(), //电脑壁纸列表
  RouteName.wallpaperPopularSearches: (context) => WallpaperPopularSearches(), //电脑壁纸搜索页
  //设置模块
  '/multiLanguage': (context) => MultiLanguage(),
  //示例模块
  '/guideMaterialWidgetRoute': (context) => GuideMaterialWidgetRoute(),
  '/guideCupertinoWidgetRoute': (context) => GuideCupertinoWidgetRoute(),
  '/guideDynamicEffectRoute': (context) => GuideDynamicEffectRoute(),
  '/guideOfficialWidgetRoute': (context) => GuideOfficialWidgetRoute(),
  '/guideHotPubLibraryRoute': (context) => GuideHotPubLibraryRoute(),
  '/guidePlugin': (context) => GuidePlugin(),
  '/guideFlutterFavoriteRoute': (context) => GuideFlutterFavoriteRoute(),
  '/guideOfficialPluginRoute': (context) => GuideOfficialPluginRoute(),
  '/guideOfficialPackageRoute': (context) => GuideOfficialPackageRoute(),
  '/guideCommunityPackageRoute': (context) => GuideCommunityPackageRoute(),
  '/guideDartTeamOfficialPackageRoute': (context) => GuideDartTeamOfficialPackageRoute(),
  '/guideRiveRoute': (context) => GuideRiveRoute(),
};


//考虑到功能模块 迭代十分频繁(由于代码的分离和更改经导致路由经常更换)
//所以设计 混合路由表 经常改动的路由名称设一个常量方便管理。
class RouteName {
  //抽屉模块
  static final String showMoreRoute = '/showMoreRoute';
  static final String guideExampleRoute = '/guideExampleRoute';
  static final String settingPage = '/settingPage';

  //功能模块
  static final String queryMobileHome = '/queryMobileHome';
  static final String englishQuotations = '/englishQuotations';
  static final String bingWallpaperRoute = '/bingWallpaperRoute';
  static final String chatRobotList = '/chatRobotList';
  static final String chatSettingsRoute = '/chatSettingsRoute';
  static final String setChatBackgroundRoute = '/setChatBackgroundRoute';
  static final String taoModel = '/taoModel';
  static final String lifeInterestPictureRoute = '/lifeInterestPictureRoute';
  static final String recipesRoute = '/recipesRoute';
  static final String garbageClassification = '/garbageClassification';
  static final String articleOfTheDayRoute = '/articleOfTheDayRoute';
  static final String phoneWallpaperRoute = '/phoneWallpaperRoute';
  static final String phoneWallpaperList = '/phoneWallpaperList';
  static final String computerWallpaperRoute = '/computerWallpaperRoute';
  static final String computerWallpaperList = '/computerWallpaperList';
  static final String wallpaperPopularSearches = '/wallpaperPopularSearches';

}


