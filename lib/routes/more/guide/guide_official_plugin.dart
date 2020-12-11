import 'package:alice/routes/example/official/plugins/example_battery.dart';
import 'package:alice/routes/example/official/plugins/example_connectivity.dart';
import 'package:alice/routes/example/official/plugins/example_device_info.dart';
import 'package:alice/routes/example/official/plugins/example_image_picker.dart';
import 'package:alice/routes/example/official/plugins/example_local_auth.dart';
import 'package:alice/routes/example/official/plugins/example_package_info.dart';
import 'package:alice/routes/example/official/plugins/example_webView.dart';
import 'package:alice/widgets/custom/custom_scroll_behavior.dart';
import 'package:alice/widgets/custom/my_appbar.dart';

import 'package:flutter/material.dart';

class GuideOfficialPluginRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GuideOfficialPluginRouteState();
}

class GuideOfficialPluginRouteState extends State<GuideOfficialPluginRoute> {
  List<String> titleList = [
    'package_info',
    'image_picker',
    'webview_flutter',
    'device_info',
    'local_auth',
    'connectivity',
    'battery',
  ];

  List<String> subTitleList = [
    'Flutter插件，用于查询有关应用程序包的信息，例如iOS上的CFBundleVersion或Android上的versionCode',
    'Flutter插件，用于从Android和iOS图像库中选择图像，并使用相机拍摄新照片',
    'Flutter插件，可在Android和iOS上提供WebView小部件',
    'Flutter插件可提供有关设备（制造商，型号等）以及运行该应用程序的Android或iOS版本的详细信息',
    '适用于Android和iOS设备身份验证传感器的Flutter插件，例如指纹读取器和Touch ID',
    'Flutter插件，用于发现Android和iOS上的网络（WiFi和移动/蜂窝）连接状态。',
    'Flutter插件，用于在Android和iOS上访问有关电池状态（充满，充电，放电）的信息。',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'flutter.dev(Plugin)',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: ScrollConfiguration(
        behavior: CustomScrollBehavior(
            isShowLeading: true,
            isShowTrailing: true,
            color: Colors.indigo[400],
        ),
        child: ListView.builder(
          itemCount: titleList.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () => jumpToRoute(index),
                  splashColor: Colors.indigo[100],
                  child: ListTile(
                    title: Text(titleList[index]),
                    subtitle: Text(subTitleList[index]),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void jumpToRoute(int index) {
    switch (index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (_) => ExamplePackageInfo()));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (_) => ExampleImagePicker()));
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (_) => WebViewExample()));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (_) => DeviceInfo()));
        break;
      case 4:
        Navigator.push(context, MaterialPageRoute(builder: (_) => ExampleLocalAuth()));
        break;
      case 5:
        Navigator.push(context, MaterialPageRoute(builder: (_) => ConnectivityDemo()));
        break;
      case 6:
        Navigator.push(context, MaterialPageRoute(builder: (_) => BatteryDemo()));
        break;
    }
  }
}
