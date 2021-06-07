import 'package:alice/common/const/routes.dart';
import 'package:alice/routes/drawer/show/about_app.dart';
import 'package:alice/widgets/custom/custom_scroll_behavior.dart';
import "package:flare_flutter/flare_actor.dart";
import 'package:flare_flutter/provider/asset_flare.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flare_flutter/flare_cache_builder.dart';
import 'package:alice/widgets/custom/my_loading_indicator.dart';
import 'package:alice/common/const/constant.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  String _animationName = "idle";
  final asset =
      AssetFlare(bundle: rootBundle, name: "assets/animations/rocket_man.flr");

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ScrollConfiguration(
        behavior: CustomScrollBehavior(),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.pink[50],
                /*image: DecorationImage(
                  image: AssetImage('assets/images/playstore-icon.png'),
                  fit: BoxFit.cover,
                ),*/
              ),
              margin: EdgeInsets.only(bottom: 8),
              // 用于插入 [child] 的填充。[DrawerHeader] 额外偏移了系统状态栏的高度。
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: showDrawRiveView(),
            ),
            ListTile(
              leading:
                  ImageIcon(AssetImage('assets/icons/icon_draw_function.png')),
              title: Text('更多功能'),
              onTap: () =>
                  Navigator.pushNamed(context, RouteName.showMoreRoute),
            ),
            ListTile(
              leading:
                  ImageIcon(AssetImage('assets/icons/icon_draw_example.png')),
              title: Text('示例演示'),
              onTap: () =>
                  Navigator.pushNamed(context, RouteName.guideExampleRoute),
            ),
            ListTile(
              leading:
                  ImageIcon(AssetImage('assets/icons/icon_draw_settings.png')),
              title: Text('设置应用'),
              onTap: () => Navigator.pushNamed(context, RouteName.settingPage)
                  .then((value) {
                if (value == 'refresh') {
                  if (mounted) {
                    setState(() {
                      //不加这个 昼夜切换 抽屉头部没反应
                    });
                  }
                }
              }),
            ),
            AppAboutListTile(),
          ],
        ),
      ),
    );
  }

  Widget my23poem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '谨以此献给23年华' 'Alice',
          style: TextStyle(color: Colors.black54, fontSize: 20),
        ),
        SizedBox(height: 8),
        Text(
          '入梦常与之相连' '初心易得',
          style: TextStyle(color: Colors.black38),
        ),
        Text(
          '不觉已相隔久远' '始终难守',
          style: TextStyle(color: Colors.black38),
        ),
        Text(
          '时光若回溯初见' '念念不忘',
          style: TextStyle(color: Colors.black38),
        ),
        Text(
          '我心可晓之悲欢' '必有回响',
          style: TextStyle(color: Colors.black38),
        ),
      ],
    );
  }

  Widget showDrawRiveView() {
    return FlareCacheBuilder(
      [asset],
      builder: (BuildContext context, bool isWarm) {
        return !isWarm
            ? MyLoadingIndicator(
                style: Constant.cupertino,
              )
            : FlareActor.asset(
                asset,
                fit: BoxFit.fill, //用于将 Flare 内容缩放到此小部件边界的 BoxFit 策略
                animation: _animationName,
              );
      },
    );
  }
}
