import 'package:alice/common/custom_scroll_behavior.dart';
import 'package:alice/other/zego/zego_main.dart';
import 'package:flutter/material.dart';


class GuideRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('各大SDK服务商提供'),
        backgroundColor: Colors.blueGrey,
      ),
      body: ScrollConfiguration(
        behavior: CustomScrollBehavior(true, true, Colors.blueGrey),
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ZegoLiveHomePage()));
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
                       //Navigator.push(context, MaterialPageRoute(builder: (context) => ZegoLiveHomePage()));
                    },
                    splashColor: Colors.blueGrey[100],
                    child: ListTile(
                      leading: Image.asset(
                        'assets/icons/icon_mesage.png',
                        width: 30,
                        height: 30,
                      ),
                      title: Text('腾讯/极光IM'),
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
                      //Navigator.push(context, MaterialPageRoute(builder: (context) => ZegoLiveHomePage()));
                    },
                    splashColor: Colors.blueGrey[100],
                    child: ListTile(
                      leading: Image.asset(
                        'assets/icons/icon_location.png',
                        width: 30,
                        height: 30,
                      ),
                      title: Text('百度/高德地图'),
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
                      //Navigator.push(context, MaterialPageRoute(builder: (context) => ZegoLiveHomePage()));
                    },
                    splashColor: Colors.blueGrey[100],
                    child: ListTile(
                      leading: Image.asset(
                        'assets/icons/icon_notification.png',
                        width: 30,
                        height: 30,
                      ),
                      title: Text('极光推送'),
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