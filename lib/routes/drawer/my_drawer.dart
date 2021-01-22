import 'package:alice/common/const/routes.dart';
import 'package:alice/routes/drawer/show/about_app.dart';
import 'package:alice/widgets/custom/custom_scroll_behavior.dart';
import 'package:flutter/material.dart';


class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
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
                image: DecorationImage(
                  image: AssetImage('assets/images/bg_alice.png'),
                  fit: BoxFit.cover,
                ),
              ),
              margin: EdgeInsets.only(bottom: 8.0),
              padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '谨以此献给23年华',
                    style: TextStyle(color: Colors.black54, fontSize: 20),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '入梦常与之相连',
                    style: TextStyle(color: Colors.black38),
                  ),
                  Text(
                    '不觉已相隔久远',
                    style: TextStyle(color: Colors.black38),
                  ),
                  Text(
                    '时光若回溯初见',
                    style: TextStyle(color: Colors.black38),
                  ),
                  Text(
                    '我心可晓之悲欢',
                    style: TextStyle(color: Colors.black38),
                  ),
                ],
              ),
            ),
            ListTile(
              leading:
              ImageIcon(AssetImage('assets/icons/icon_draw_function.png')),
              title: Text('更多功能'),
              onTap: () => Navigator.pushNamed(context, RouteName.showMoreRoute),
            ),
            ListTile(
              leading:
              ImageIcon(AssetImage('assets/icons/icon_draw_example.png')),
              title: Text('示例演示'),
              onTap: () => Navigator.pushNamed(context, RouteName.guideExampleRoute),
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
}