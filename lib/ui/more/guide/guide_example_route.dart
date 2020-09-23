import 'package:alice/common/custom_scroll_behavior.dart';
import 'package:alice/ui/example/example_device_info.dart';
import 'package:alice/ui/example/example_webView.dart';
import 'package:alice/ui/more/plugin_get_android_version.dart';
import 'package:alice/ui/more/plugin_get_battery.dart';
import 'package:alice/ui/more/test_plug_screen.dart';
import 'package:alice/ui/more/test_staggered_grid.dart';
import 'package:flutter/material.dart';


class GuideExampleRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('示例代码'),
        backgroundColor: Colors.brown[300],
      ),
      body: ScrollConfiguration(
        behavior: CustomScrollBehavior(true, true, Colors.brown[300]),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(4),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewExample()));
                    },
                    splashColor: Colors.brown[100],
                    child: ListTile(
                      title: Text('WebView'),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(4),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => TestStaggeredGrid()));
                    },
                    splashColor: Colors.brown[100],
                    child: ListTile(
                      title: Text('瀑布流网格列表'),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(4),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DeviceInfo()));
                    },
                    splashColor: Colors.brown[100],
                    child: ListTile(
                      title: Text('获取设备信息'),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(4),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => TestPlugScreen()));
                    },
                    splashColor: Colors.brown[100],
                    child: ListTile(
                      title: Text('插件——内嵌方式-获取手机安卓系统版本'),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(4),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PluginGetBattery()));
                    },
                    splashColor: Colors.brown[100],
                    child: ListTile(
                      title: Text('插件——代码平台通信方式-获取手机电量'),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(4),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PluginGetVersion()));
                    },
                    splashColor: Colors.brown[100],
                    child: ListTile(
                      title: Text('插件——整合代码平台通信方式-获取手机安卓系统版本'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}