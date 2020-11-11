import 'package:alice/custom/custom_scroll_behavior.dart';
import 'package:alice/custom/my_appbar.dart';
import 'package:alice/ui/example/official/example_device_info.dart';
import 'package:alice/ui/example/official/example_image_picker.dart';
import 'package:alice/ui/example/official/example_package_info.dart';
import 'package:alice/ui/example/official/example_palette.dart';
import 'package:alice/ui/example/official/example_webView.dart';


import 'package:flutter/material.dart';

class GuideOfficialPackageRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GuideOfficialPackageRouteState();
}

class GuideOfficialPackageRouteState extends State<GuideOfficialPackageRoute> {
  List<String> titleList = [
    'palette_generator',
  ];

  List<String> subTitleList = [
    'Flutter软件包，用于从图像中提取突出的颜色，通常用于查找用户界面的颜色',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'Package',
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
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ImageColors(
                  title: '调色板示例',
                  image: NetworkImage('https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=179292083,506023000&fm=26&gp=0.jpg'),
                  imageSize: Size(256.0, 170.0),
                )));
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
