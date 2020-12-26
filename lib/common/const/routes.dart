import 'package:alice/routes/more/article/article_of_the_day.dart';
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
import 'package:alice/routes/more/bing/bing_wallpaper_list.dart';
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
  '/showMoreRoute': (context) => ShowMoreRoute(), //功能列表页面
  '/guideExampleRoute': (context) => GuideExampleRoute(), //示例页面
  '/settingPage': (context) => SettingPage(), //设置页面
  //功能模块
  '/queryMobileHome': (context) => QueryMobileHome(),
  '/englishQuotations': (context) => EnglishQuotations(),
  '/bingWallpaperList': (context) => BingWallpaperList(),
  '/chatRobotList': (context) => ChatRobotList(), //聊天页面
  '/chatSettingsRoute': (context) => ChatSettingsRoute(), //聊天设置页面
  '/setChatBackgroundRoute': (context) => SetChatBackgroundRoute(), //设置聊天背景页面
  '/taoModel': (context) => TaoModel(),
  '/lifeInterestPictureRoute': (context) => LifeInterestPictureRoute(),
  '/recipesRoute': (context) => RecipesRoute(),
  '/garbageClassification': (context) => GarbageClassification(),
  '/articleOfTheDayRoute': (context) => ArticleOfTheDayRoute(), //每日一文
  '/phoneWallpaperRoute': (context) => PhoneWallpaperRoute(), //手机壁纸类别
  '/phoneWallpaperList': (context) => PhoneWallpaperList(), //手机壁纸列表
  '/computerWallpaperRoute': (context) => ComputerWallpaperRoute(), //电脑壁纸类别
  '/computerWallpaperList': (context) => ComputerWallpaperList(), //电脑壁纸列表
  '/wallpaperPopularSearches': (context) => WallpaperPopularSearches(), //电脑壁纸搜索页
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