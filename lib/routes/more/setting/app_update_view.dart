import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';
import 'package:ota_update/ota_update.dart';

class AppUpdateRoute extends StatefulWidget {
  @override
  _AppUpdateRouteState createState() => _AppUpdateRouteState();
}

class _AppUpdateRouteState extends State<AppUpdateRoute> {
  OtaEvent currentEvent;

  @override
  void initState() {
    super.initState();
    tryOtaUpdate();
  }

  Future<void> tryOtaUpdate() async {
    try {
      //从FLUTTER SDK示例链接包含APK的HELLO WORLD
      OtaUpdate().execute(
        //必填 下载链接
        'http://3g.163.com/links/4636', // 拿网易新闻的测试
        //可选
        ///appname.apk !!!!!!!!!!! 不填闪退 报错
        ///Caused by: android.content.ActivityNotFoundException: No Activity found to handle Intent
        ///{ act=android.intent.action.INSTALL_PACKAGE dat=content://com.ow.alice.ota_update_provider/external_download/Alice flg=0x10000001 }
        destinationFilename: 'Alice.apk', //下载的时候显示的下载APP的名称
        //可选，仅ANDROID-能够验证文件的校验和：
        //sha256checksum: "d6da28451a1e15cf7a75f2c3f151befad3b80ad0bb232ab15c20897e54f21478",
      ).listen((OtaEvent event) {
          setState(() {
            currentEvent = event;
          });
        },
      );
    } catch (e) {
      print('更新失败: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: '应用更新',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: currentEvent == null
          ? Container()
          : downloadView(),
    );
  }

  Widget downloadView() {
    return Center(
      child: Container(
        child: Text(
            'OTA status: ${currentEvent.status} : ${currentEvent.value} \n'),
      ),
    );
  }

}

