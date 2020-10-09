import 'package:alice/custom/custom_scroll_behavior.dart';
import 'package:alice/ui/example/example_badge.dart';
import 'package:alice/ui/example/example_device_info.dart';
import 'package:alice/ui/example/example_font_awesome.dart';
import 'package:alice/ui/example/example_google_fonts.dart';
import 'package:alice/ui/example/example_html.dart';
import 'package:alice/ui/example/example_marquee.dart';
import 'package:alice/ui/example/example_palette.dart';
import 'file:///E:/Alice_flutter/alice/lib/ui/example/rive/example_rive.dart';
import 'package:alice/ui/example/example_webView.dart';
import 'package:alice/ui/example/plugin_get_android_version.dart';
import 'package:alice/ui/example/plugin_get_battery.dart';
import 'package:alice/ui/example/rive/button/example_like_button.dart';
import 'package:alice/ui/example/rive/example_fab.dart';
import 'package:alice/ui/example/rive/example_penguin.dart';
import 'package:alice/ui/example/rive/example_switch.dart';
import 'package:alice/ui/example/rive/reload/example_space_reload.dart';
import 'package:alice/ui/example/rive/slider/example_slider.dart';
import 'package:alice/ui/example/test_staggered_grid.dart';
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
                      Navigator.push(context, MaterialPageRoute(builder: (_) => ExampleSwitchPage()));
                    },
                    splashColor: Colors.brown[100],
                    child: ListTile(
                      title: Text('Rive 1(Flare)  switch 开关按钮动画'),
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
                      Navigator.push(context, MaterialPageRoute(builder: (_) => ExampleHeartButton()));
                    },
                    splashColor: Colors.brown[100],
                    child: ListTile(
                      title: Text('Rive 1(Flare)  Like Button 按钮动画 '),
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
                      Navigator.push(context, MaterialPageRoute(builder: (_) => ExampleRockPenguinPage()));
                    },
                    splashColor: Colors.brown[100],
                    child: ListTile(
                      title: Text('Rive 1(Flare)  摇滚企鹅动画 '),
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
                      Navigator.push(context, MaterialPageRoute(builder: (_) => ExampleFabPage()));
                    },
                    splashColor: Colors.brown[100],
                    child: ListTile(
                      title: Text('Rive 1(Flare)  动画(是否抗锯齿的显示差异) '),
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
                      Navigator.push(context, MaterialPageRoute(builder: (_) => ExampleSliderPage()));
                    },
                    splashColor: Colors.brown[100],
                    child: ListTile(
                      title: Text('Rive 1(Flare)  Slider滑块与房屋动态变化 '),
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
                      Navigator.push(context, MaterialPageRoute(builder: (_) => ExampleSpaceReloadPage()));
                    },
                    splashColor: Colors.brown[100],
                    child: ListTile(
                      title: Text('Rive 1(Flare)  卡通版太空主题下拉刷新 '),
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
                      Navigator.push(context, MaterialPageRoute(builder: (_) => ExampleRivePage()));
                    },
                    splashColor: Colors.brown[100],
                    child: ListTile(
                      title: Text('Rive 2 动画 示例'),
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
                      Navigator.push(context, MaterialPageRoute(builder: (_) => ExampleBadgePage()));
                    },
                    splashColor: Colors.brown[100],
                    child: ListTile(
                      title: Text('badge 示例'),
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
                      Navigator.push(context, MaterialPageRoute(builder: (_) => ExampleMarquee()));
                    },
                    splashColor: Colors.brown[100],
                    child: ListTile(
                      title: Text('marquee 示例'),
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
                      Navigator.push(context, MaterialPageRoute(builder: (_) => FontAwesomeGalleryHome()));
                    },
                    splashColor: Colors.brown[100],
                    child: ListTile(
                      title: Text('font_awesome_flutter 示例'),
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
                      Navigator.push(context, MaterialPageRoute(builder: (_) => GoogleFontsPage()));
                    },
                    splashColor: Colors.brown[100],
                    child: ListTile(
                      title: Text('google_fonts 示例'),
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
                      Navigator.push(context, MaterialPageRoute(builder: (_) => HtmlExamplePage()));
                    },
                    splashColor: Colors.brown[100],
                    child: ListTile(
                      title: Text('flutter_html(将静态HTML和CSS呈现为Flutter小部件)'),
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ImageColors(
                        title: '调色板示例',
                        image: NetworkImage('https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=179292083,506023000&fm=26&gp=0.jpg'),
                        imageSize: Size(256.0, 170.0),
                      )));
                    },
                    splashColor: Colors.brown[100],
                    child: ListTile(
                      title: Text('Palette 调色板'),
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
                /*Card(
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
                ),*/
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
                      title: Text('通道通信——获取手机电量'),
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
                      title: Text('通道通信——获取手机安卓系统版本'),
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