import 'package:flutter/material.dart';

///一种材质设计面板，可从[脚手架]的边缘水平滑入以显示应用程序中的导航链接。
///
/// {@youtube 560315 https://www.youtube.com/watch?v=WRj86iHihgY}
///
///抽屉通常与[Scaffold.drawer]属性一起使用。抽屉的子级通常是[ListView]，其第一个子级是[DrawerHeader]，它显示有关当前用户的状态信息。其余的抽屉式子代通常使用[ListTile]构造，通常以[AboutListTile]结束。
///
///当[脚手架]中有[抽屉]时，[AppBar]自动显示适当的[IconButton]以显示[抽屉]。 [脚手架]自动处理边缘滑动手势以显示抽屉。
///
/// {@animation 350622 https://flutter.github.io/assets-for-api-docs/assets/material/drawer.mp4}
///
///可以通过调用[Navigator.pop]关闭打开的抽屉。例如，一个抽屉物品在点击时可能会关闭抽屉：
///
/// 也可以看看：
///
/// * [Scaffold.drawer]，其中一个指定了[Drawer]，以便可以显示它。
/// * [Scaffold.of]，以获得当前的[ScaffoldState]，该状态管理抽屉的显示和动画。
/// * [ScaffoldState.openDrawer]，显示其[Drawer]（如果有）。
/// * <https://material.io/design/components/navigation-drawer.html>

class NavigationDrawerDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer Demo'),
      ),
      ///此示例说明如何创建包含[AppBar]和[Drawer]的[Scaffold]。
      ///用户点击[AppBar]中的“菜单”图标以打开[抽屉]。
      ///[抽屉]显示四个项目：标题和三个菜单项目。
      /// [抽屉]使用[ListView]显示四个项目，允许用户在需要时滚动查看这些项目。
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),

            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
            /// ListTile(
            ///   leading: Icon(Icons.change_history),
            ///   title: Text('Change history'),
            ///   onTap: () {
            ///     // change app state...
            ///     Navigator.pop(context); // close the drawer
            ///   },
            /// );
          ],
        ),
      ),
    );
  }

}