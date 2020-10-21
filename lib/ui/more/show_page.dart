import 'package:alice/custom/custom_scroll_behavior.dart';
import 'package:alice/provider/theme_mode.dart';
import 'package:alice/ui/more/Setting.dart';
import 'package:alice/ui/more/bing/bing_wallpaper.dart';
import 'package:alice/ui/more/chat_with_robot.dart';
import 'package:alice/ui/more/english_quotations.dart';
import 'package:alice/ui/more/guide/guide_example_route.dart';
import 'package:alice/ui/more/guide/guide_plugin.dart';
import 'package:alice/ui/more/joke/life_interest_chart.dart';
import 'package:alice/ui/more/model/tao_model_route.dart';
import 'package:alice/ui/more/query_mobile_phon_number_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    'assets/icons/icon_edit.png',
    'assets/icons/icon_toolbox.png',
    'assets/icons/icon_setting.png',
  ];

  List<String> mbeBigIconList = [
    'assets/icons/mbe/icon_mbe_big_1.png',
    'assets/icons/mbe/icon_mbe_big_2.png',
    'assets/icons/mbe/icon_mbe_big_3.png',
    'assets/icons/mbe/icon_mbe_big_4.png',
    'assets/icons/mbe/icon_mbe_big_5.png',
    'assets/icons/mbe/icon_mbe_big_6.png',
    'assets/icons/mbe/icon_mbe_big_7.png',
    'assets/icons/mbe/icon_mbe_big_8.png',
    'assets/icons/mbe/icon_mbe_big_9.png',
  ];

  List<String> functionTitleList = [
    '查询手机号码归属地',
    '英文励志语录',
    '必应壁纸',
    '智能聊天机器人菲菲',
    '淘女郎模特',
    '生活趣图',
    '示例代码',
    '复杂业务的Flutter插件',
    '设置',
  ];

  void jumpToPage(int index) {
    switch (index) {
      case 0:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => QueryMobilePhoneNumberHomeView()));
        break;
      case 1:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => EnglishQuotations()));
        break;
      case 2:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => BingWallpaperView()));
        break;
      case 3:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ChatRobotList()));
        break;
      case 4:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => TaoModel()));
        break;
      case 5:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => LifeInterestChartRoute()));
        break;
      case 6:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => GuideExampleRoute()));
        break;
      case 7:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => GuidePlugin()));
        break;
      case 8:
        Navigator.push(context, MaterialPageRoute(builder: (context) => SettingPage())).then((value) {
          if (value == 'refresh') {
            if(mounted){
              setState(() {});
            }
          }
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('展示'),
        backgroundColor: Colors.cyan[300],
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
    );
  }
}
