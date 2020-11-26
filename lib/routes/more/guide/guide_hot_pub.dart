import 'package:alice/routes/example/company/baseflow/cached_network_image/example_cached_network_image.dart';
import 'package:alice/widgets/custom/custom_scroll_behavior.dart';
import 'package:alice/widgets/custom/my_appbar.dart';

import 'package:flutter/material.dart';

class GuideHotPubLibraryRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GuideHotPubLibraryRouteState();
}

class GuideHotPubLibraryRouteState extends State<GuideHotPubLibraryRoute> {
  List<String> titleList = [
    'cached_network_image',
  ];

  List<String> subTitleList = [
    '用于显示来自互联网的图像并将其保存在缓存目录中',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'Pub热门',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: ScrollConfiguration(
        behavior: CustomScrollBehavior(
            isShowLeading: true,
            isShowTrailing: true,
            color: Colors.indigo[400]),
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
        Navigator.push(context, MaterialPageRoute(builder: (_) => BaseflowPluginExample()));
        break;
      case 1:

        break;
      case 2:
        //Navigator.push(context, MaterialPageRoute(builder: (_) => WebViewExample()));
        break;
      case 3:
        //Navigator.push(context, MaterialPageRoute(builder: (_) => DeviceInfo()));
        break;
      case 4:
        //Navigator.push(context, MaterialPageRoute(builder: (_) => BarChartSample5()));
        break;
      case 5:
        //Navigator.push(context, MaterialPageRoute(builder: (_) => LineChartSample1()));
        break;
    }
  }
}
