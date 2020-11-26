import 'package:alice/routes/example/official/example_font_awesome.dart';
import 'package:alice/widgets/custom/custom_scroll_behavior.dart';
import 'package:alice/widgets/custom/my_appbar.dart';

import 'package:flutter/material.dart';

class GuideCommunityPackageRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GuideCommunityPackageRouteState();
}

class GuideCommunityPackageRouteState
    extends State<GuideCommunityPackageRoute> {
  List<String> titleList = [
    'font_awesome_flutter',
  ];

  List<String> subTitleList = [
    'Font Awesome图标包以Flutter Icons的形式提供。提供1500个其他图标供您的应用程序使用',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'Community Package',
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
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => FontAwesomeGalleryHome()));
        break;
      case 1:
        //Navigator.push(context, MaterialPageRoute(builder: (_) => ExampleImagePicker()));
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
