import 'package:alice/routes/example/plugin/baidu_map/location/example_baidu_location.dart';
import 'package:alice/routes/other/zego/zego_main.dart';
import 'package:alice/widgets/custom/custom_scroll_behavior.dart';
import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';

class GuidePlugin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'Flutter 插件/包',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: ScrollConfiguration(
        behavior: CustomScrollBehavior(),
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ZegoLiveHomePage()));
                    },
                    splashColor: Colors.blueGrey[100],
                    child: ListTile(
                      leading: Image.asset(
                        'assets/icons/icon_live.png',
                        width: 30,
                        height: 30,
                      ),
                      title: Text('即构实时音频/视频'),
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => BasicLoc()));
                    },
                    splashColor: Colors.blueGrey[100],
                    child: ListTile(
                      leading: Image.asset(
                        'assets/icons/icon_location.png',
                        width: 30,
                        height: 30,
                      ),
                      title: Text('百度地图'),
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
