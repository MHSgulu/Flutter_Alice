import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'config/zego_config.dart';
import 'pages/init_sdk_page.dart';




class ZegoLiveHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    print(ZegoConfig.instance); // 加载配置实例

    return Scaffold(
        appBar: AppBar(
          title: Text('Zego即构实时音视频'),
        ),
        body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                  ),
                  CupertinoButton(
                      color: Color(0xff0e88eb),
                      child: Text('推流'),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                          return InitPage(true);
                        }));
                      }
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                  ),
                  CupertinoButton(
                      color: Color(0xff0e88eb),
                      child: Text('拉流'),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                          return InitPage(false);
                        }));
                      }
                  ),
                ],
              ),
            )
        )
    );
  }
}


