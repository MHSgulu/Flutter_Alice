import 'package:alice/common/const/colors.dart';
import 'package:alice/common/global/theme_mode.dart';
import 'package:alice/widgets/custom/custom_scroll_behavior.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Setting.dart';
import 'bing/bing_wallpaper_list.dart';
import 'chat_with_robot.dart';
import 'english_quotations.dart';
import 'garbage/garbage_classification.dart';
import 'guide/guide_example_route.dart';
import 'joke/life_interest_chart.dart';
import 'model/tao_model_route.dart';
import 'query_mobile_home.dart';
import 'recipes/recipes_route.dart';


class ShowMorePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ShowMorePageState();
}

class ShowMorePageState extends State<ShowMorePage> {
  List<String> dayIconList = [
    'assets/icons/icon_search.png',
    'assets/icons/icon_record.png',
    'assets/icons/icon_camera.png',
    'assets/icons/icon_chat.png',
    'assets/icons/icon_account.png',
    'assets/icons/icon_placeholder.png',
    'assets/icons/icon_food.png',
    'assets/icons/icon_shopping_cart.png',
    'assets/icons/icon_toolbox.png',
    'assets/icons/icon_edit.png',
    'assets/icons/icon_setting.png',
  ];

  List<String> mbeBigIconList = [
    'assets/icons/mbe/icon_mbe_big_1.png',
    'assets/icons/mbe/icon_mbe_big_2.png',
    'assets/icons/mbe/icon_mbe_big_3.png',
    'assets/icons/mbe/icon_mbe_big_4.png',
    'assets/icons/mbe/icon_mbe_big_5.png',
    'assets/icons/mbe/icon_mbe_big_6.png',
    'assets/icons/mbe/icon_mbe_big_11.png',
    'assets/icons/mbe/icon_mbe_big_10.png',
    'assets/icons/mbe/icon_mbe_big_8.png',
    'assets/icons/mbe/icon_mbe_big_7.png',
    'assets/icons/mbe/icon_mbe_big_9.png',
  ];

  List<String> functionTitleList = [
    '查询手机号码归属地',
    '英文励志语录',
    '必应壁纸',
    '智能聊天机器人菲菲',
    '淘女郎模特',
    '生活趣图',
    '菜谱大全',
    '垃圾分类',
    '更多功能',
    '示例代码',
    '设置',
  ];


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppThemeMode(),
      child: Consumer<AppThemeMode>(
        builder: (context, theme, child) => Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('展示',style: TextStyle(fontSize: 18),),
            backgroundColor: AppThemeMode.isDark ? MyColors.appBarDarkColor : Colors.cyan[300],
            elevation: 1,
          ),
          body: ScrollConfiguration(
            behavior: CustomScrollBehavior(
              isShowLeading: true,
              isShowTrailing: true,
              color: Colors.cyan[300],
            ),
            child: ListView.builder(
              padding: EdgeInsets.fromLTRB(12, 16, 12, 16),
              itemCount: functionTitleList.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.fromLTRB(4, 6, 4, 6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () => jumpToPage(index),
                    splashColor: Colors.cyan[50],
                    child: ListTile(
                      leading: ChangeNotifierProvider(
                        create: (context) => AppThemeMode(),
                        child: Consumer<AppThemeMode>(
                          builder: (context, theme, child) => Image.asset(
                            AppThemeMode.isDark
                                ? mbeBigIconList[index]
                                : dayIconList[index],
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ),
                      title: Text(functionTitleList[index]),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void jumpToPage(int index) {
    switch (index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) => QueryMobilePhoneNumberHome()));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) => EnglishQuotations()));
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context) => BingWallpaperList()));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (context) => ChatRobotList()));
        break;
      case 4:
        Navigator.push(context, MaterialPageRoute(builder: (context) => TaoModel()));
        break;
      case 5:
        Navigator.push(context, MaterialPageRoute(builder: (context) => LifeInterestChartRoute()));
        break;
      case 6:
        Navigator.push(context, MaterialPageRoute(builder: (context) => RecipesRoute()));
        break;
      case 7:
        Navigator.push(context, MaterialPageRoute(builder: (context) => GarbageClassification()));
        break;
      case 8:
        Navigator.push(context, MaterialPageRoute(builder: (context) => GuideExampleRoute()));
        break;
        break;
      case 9:
        Navigator.push(context, MaterialPageRoute(builder: (context) => GuideExampleRoute()));
        break;
      case 10:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SettingPage())).then((value) {
          if (value == 'refresh') {
            if (mounted) {
              setState(() {});
            }
          }
        });
        break;
    }
  }
}
