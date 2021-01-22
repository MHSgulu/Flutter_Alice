import 'package:alice/common/const/routes.dart';
import 'package:alice/widgets/custom/custom_scroll_behavior.dart';
import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:alice/widgets/custom/my_list_tile_card.dart';
import 'package:flutter/material.dart';

class GuideExampleRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: '示例演示',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: ScrollConfiguration(
        behavior: CustomScrollBehavior(),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                MyCardTile(
                  text: 'Material Design Components',
                  onTap: () => Navigator.pushNamed(context, RouteName.guideMaterialWidgetRoute),
                ),
                MyCardTile(
                  text: 'Cupertino Components',
                  onTap: () => Navigator.pushNamed(context, RouteName.guideCupertinoWidgetRoute),
                ),
                MyCardTile(
                  text: '深入理解 Flutter 布局约束',
                  onTap: () => Navigator.pushNamed(context, RouteName.flutterLayoutConstraintsExample),
                ),
                MyCardTile(
                  text: 'Flutter小部件系列',
                  onTap: () => Navigator.pushNamed(context, RouteName.guideWeekWidgetRoute),
                ),
                MyCardTile(
                  text: '复杂组合型Widget',
                  onTap: () => Navigator.pushNamed(context, RouteName.guideOfficialWidgetRoute),
                ),
                MyCardTile(
                  text: 'Flutter Favorite 库',
                  onTap: () => Navigator.pushNamed(context, RouteName.guideFlutterFavoriteRoute),
                ),
                MyCardTile(
                  text: 'Flutter团队维护的插件',
                  onTap: () => Navigator.pushNamed(context, RouteName.guideOfficialPluginRoute),
                ),
                MyCardTile(
                  text: 'Flutter团队维护的软件包',
                  onTap: () => Navigator.pushNamed(context, RouteName.guideOfficialPackageRoute),
                ),
                MyCardTile(
                  text: 'Flutter社区维护的软件包',
                  onTap: () => Navigator.pushNamed(context, RouteName.guideCommunityPackageRoute),
                ),
                MyCardTile(
                  text: 'Dart团队发布的软件包',
                  onTap: () => Navigator.pushNamed(context, RouteName.guideDartTeamOfficialPackageRoute),
                ),
                MyCardTile(
                  text: 'pub 库',
                  onTap: () => Navigator.pushNamed(context, RouteName.guideHotPubLibraryRoute),
                ),
                MyCardTile(
                  text: '状态管理库',
                  onTap: () => Navigator.pushNamed(context, RouteName.guideStateRoute),
                ),
                MyCardTile(
                  text: '原生SDK业务插件',
                  onTap: () => Navigator.pushNamed(context, RouteName.guidePlugin),
                ),
                MyCardTile(
                  text: 'Rive 动画',
                  onTap: () => Navigator.pushNamed(context, RouteName.guideRiveRoute),
                ),
                /*MyCardTile(
                  text: '插件——获取手机电量',
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PluginGetBattery())),
                ),*/
                /*MyCardTile(
                  text: '插件——获取手机安卓系统版本',
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PluginGetVersion())),
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
