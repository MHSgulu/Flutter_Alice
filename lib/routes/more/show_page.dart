import 'package:alice/widgets/custom/custom_scroll_behavior.dart';
import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:alice/widgets/custom/my_list_tile_card.dart';
import 'package:flutter/material.dart';

class ShowMoreRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ShowMoreRouteState();
}

class ShowMoreRouteState extends State<ShowMoreRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: '功能列表',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: ScrollConfiguration(
        behavior: CustomScrollBehavior(
          isShowLeading: true,
          isShowTrailing: true,
          color: Colors.cyan[300],
        ),
        child: ListView(
          children: [
            MyFunctionCard(
              title: '智能聊天机器人菲菲',
              asset: 'assets/icons/icon_chat.png',
              onTap: ()=> Navigator.pushNamed(context, '/chatRobotList'),
            ),
            MyFunctionCard(
              title: '查询手机号码归属地',
              asset: 'assets/icons/icon_search.png',
              onTap: ()=> Navigator.pushNamed(context, '/queryMobileHome'),
            ),
            MyFunctionCard(
              title: '英文励志语录',
              asset: 'assets/icons/icon_record.png',
              onTap: ()=> Navigator.pushNamed(context, '/englishQuotations'),
            ),
            MyFunctionCard(
              title: '必应壁纸',
              asset: 'assets/icons/icon_camera.png',
              onTap: ()=> Navigator.pushNamed(context, '/bingWallpaperList'),
            ),
            MyFunctionCard(
              title: '壁纸大全',
              asset: 'assets/icons/icon_wallpaper.png',
              onTap: ()=> showDialogBox(),
            ),
            MyFunctionCard(
              title: '淘女郎模特',
              asset: 'assets/icons/icon_account.png',
              onTap: ()=> Navigator.pushNamed(context, '/taoModel'),
            ),
            MyFunctionCard(
              title: '菜谱大全',
              asset: 'assets/icons/icon_food.png',
              onTap: ()=> Navigator.pushNamed(context, '/recipesRoute'),
            ),
            MyFunctionCard(
              title: '垃圾分类',
              asset: 'assets/icons/icon_shopping_cart.png',
              onTap: ()=> Navigator.pushNamed(context, '/garbageClassification'),
            ),
            MyFunctionCard(
              title: '每日一文',
              asset: 'assets/icons/icon_edit.png',
              onTap: ()=> Navigator.pushNamed(context, '/articleOfTheDayRoute'),
            ),
          ],
        ),
      ),
    );
  }

  void showDialogBox() {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text(
            '选择数据源',
            style: TextStyle(fontSize: 16),
          ),
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/phoneWallpaperRoute');
              },
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 12, 0, 12),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icons/icon_phone.png',
                      width: 30,
                    ),
                    SizedBox(width: 16),
                    Text('手机壁纸'),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context); //先退出对话框，再进行导航
                Navigator.pushNamed(context, '/computerWallpaperRoute');
              },
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 12, 0, 12),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icons/icon_computer.png',
                      width: 30,
                    ),
                    SizedBox(width: 16),
                    Text('电脑壁纸'),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}


