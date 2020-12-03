import 'package:alice/routes/example/company/dash_overflow/provider/example_provider_counter.dart';
import 'package:alice/routes/example/plugin_get_android_version.dart';
import 'package:alice/routes/example/plugin_get_battery.dart';
import 'package:alice/widgets/custom/custom_scroll_behavior.dart';
import 'package:alice/widgets/custom/my_appbar.dart';
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
                    onTap: () => Navigator.pushNamed(context, '/guideMaterialWidgetRoute'),
                    splashColor: Colors.brown[100],
                    child: ListTile(
                      title: Text('Material Design Components'),
                      subtitle: Text('物质风格组件'),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(4),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () => Navigator.pushNamed(context, '/guideCupertinoWidgetRoute'),
                    splashColor: Colors.brown[100],
                    child: ListTile(
                      title: Text('Cupertino Components'),
                      subtitle: Text('库比蒂诺风格组件'),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(4),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () => Navigator.pushNamed(context, '/guideOfficialWidgetRoute'),
                    splashColor: Colors.brown[100],
                    child: ListTile(
                      title: Text('Widget 目录'),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(4),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () => Navigator.pushNamed(context, '/guideHotPubLibraryRoute'),
                    splashColor: Colors.brown[100],
                    child: ListTile(
                      title: Text('第三方开发者库(使用中/已了解)'),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(4),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () => Navigator.pushNamed(context, '/guidePlugin'),
                    splashColor: Colors.brown[100],
                    child: ListTile(
                      title: Text('企业级原生SDK的Flutter插件'),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(4),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () => Navigator.pushNamed(context, '/guideOfficialPluginRoute'),
                    splashColor: Colors.brown[100],
                    child: ListTile(
                      title: Text('Flutter团队维护的插件目录'),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(4),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () => Navigator.pushNamed(context, '/guideOfficialPackageRoute'),
                    splashColor: Colors.brown[100],
                    child: ListTile(
                      title: Text('Flutter团队维护的软件包目录'),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(4),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () => Navigator.pushNamed(context, '/guideCommunityPackageRoute'),
                    splashColor: Colors.brown[100],
                    child: ListTile(
                      title: Text('Flutter社区的软件包目录'),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(4),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () => Navigator.pushNamed(context, '/guideDartTeamOfficialPackageRoute'),
                    splashColor: Colors.brown[100],
                    child: ListTile(
                      title: Text('Dart团队发布的官方软件包'),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(4),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () => Navigator.pushNamed(context, '/guideRiveRoute'),
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
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        // 为应用程序内的所有小部件提供模型。
                        // 我们使用ChangeNotifierProvider是因为这是在模型更改时重建小部件的简单方法。
                        // 我们也可以只使用Provider，但随后我们必须听听Counter
                        //
                        // 阅读提供者的文档以了解所有可用的提供者。
                        return ChangeNotifierProvider(
                          // 在构建器中初始化模型。 这样，Provider可以拥有Counter的生命周期，确保在不再需要时调用`dispose`。
                          create: (context) => Counter(),
                          child: ProviderCounterPage(),
                        );
                      }));
                    },
                    splashColor: Colors.brown[100],
                    child: ListTile(
                      title: Text('provider'),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(4),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PluginGetBattery())),
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
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PluginGetVersion())),
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
