import 'package:alice/custom/custom_scroll_behavior.dart';
import 'package:alice/custom/my_appbar.dart';
import 'package:alice/ui/example/example_badge.dart';
import 'file:///E:/Alice_flutter/alice/lib/ui/example/official/example_device_info.dart';
import 'package:alice/ui/example/example_font_awesome.dart';
import 'file:///E:/Alice_flutter/alice/lib/ui/example/official/example_google_fonts.dart';
import 'package:alice/ui/example/example_html.dart';
import 'package:alice/ui/example/example_marquee.dart';
import 'package:alice/ui/example/example_permission.dart';
import 'package:alice/ui/example/example_picture_compression.dart';
import 'package:alice/ui/example/official/example_image_picker.dart';
import 'package:alice/ui/example/picker/example_city_picker.dart';
import 'file:///E:/Alice_flutter/alice/lib/ui/example/official/example_palette.dart';
import 'file:///E:/Alice_flutter/alice/lib/ui/example/provider/example_provider_counter.dart';
import 'file:///E:/Alice_flutter/alice/lib/ui/example/official/example_webView.dart';
import 'package:alice/ui/example/plugin_get_android_version.dart';
import 'package:alice/ui/example/plugin_get_battery.dart';
import 'package:alice/ui/example/test_staggered_grid.dart';
import 'package:alice/ui/example/zefyr/example_zefyr.dart';
import 'package:alice/ui/more/guide/guide_chart.dart';
import 'package:alice/ui/more/guide/guide_rive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GuideExampleRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: '示例样品',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: ScrollConfiguration(
        behavior: CustomScrollBehavior(
            isShowLeading: true,
            isShowTrailing: true,
            color: Colors.brown[300]),
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => ExamplePictureCompression()));
                    },
                    splashColor: Colors.brown[100],
                    child: ListTile(
                      title: Text('flutter_image_compress 示例'),
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => ExampleImagePicker()));
                    },
                    splashColor: Colors.brown[100],
                    child: ListTile(
                      title: Text('image_picker 示例'),
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => ExamplePermission()));
                    },
                    splashColor: Colors.brown[100],
                    child: ListTile(
                      title: Text('权限处理'),
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => ExampleCityPicker()));
                    },
                    splashColor: Colors.brown[100],
                    child: ListTile(
                      title: Text('城市选择器'),
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => ZefyrApp()));
                    },
                    splashColor: Colors.brown[100],
                    child: ListTile(
                      title: Text('zefyr 文本编辑器'),
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => GuideChartRoute()));
                    },
                    splashColor: Colors.brown[100],
                    child: ListTile(
                      title: Text('Flutter 图表'),
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
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        // 为应用程序内的所有小部件提供模型。
                        // 我们使用ChangeNotifierProvider是因为这是在模型更改时重建小部件的简单方法。
                        // 我们也可以只使用Provider，但随后我们必须听听Counter
                        //
                        // 阅读提供者的文档以了解所有可用的提供者。
                        return ChangeNotifierProvider(
                          // 在构建器中初始化模型。 这样，Provider可以拥有Counter的生命周期，确保在不再需要时调用`dispose`。
                          create: (context) {
                            return Counter();
                          },
                          child: ProviderCounterPage(),
                        );
                      }));
                    },
                    splashColor: Colors.brown[100],
                    child: ListTile(
                      title: Text('基于provider实现的计数器'),
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => GuideRiveRoute()));
                    },
                    splashColor: Colors.brown[100],
                    child: ListTile(
                      title: Text('Rive 动画'),
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => ExampleBadgePage()));
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => ExampleMarquee()));
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => FontAwesomeGalleryHome()));
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => GoogleFontsPage()));
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => HtmlExamplePage()));
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ImageColors(
                                    title: '调色板示例',
                                    image: NetworkImage(
                                        'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=179292083,506023000&fm=26&gp=0.jpg'),
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WebViewExample()));
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TestStaggeredGrid()));
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DeviceInfo()));
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PluginGetBattery()));
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PluginGetVersion()));
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
