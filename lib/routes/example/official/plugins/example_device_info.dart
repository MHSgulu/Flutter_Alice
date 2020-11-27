import 'dart:async';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:device_info/device_info.dart';


///ANDROID_ID可以作为设备标识，但需要注意：
///厂商定制系统的Bug：不同的设备可能会产生相同的ANDROID_ID：9774d56d682e549c。
///厂商定制系统的Bug：有些设备返回的值为null。
///设备差异：对于CDMA设备，ANDROID_ID和TelephonyManager.getDeviceId() 返回相同的值。
///它在Android <=2.1 or Android >=2.3的版本是可靠、稳定的，但在2.2的版本并不是100%可靠的


class DeviceInfo extends StatefulWidget {
  @override
  _DeviceInfoState createState() => _DeviceInfoState();
}

class _DeviceInfoState extends State<DeviceInfo> {
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  Map<String, dynamic> _deviceData = <String, dynamic>{};

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    Map<String, dynamic> deviceData;

    try {
      if (Platform.isAndroid) {
        deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
      } else if (Platform.isIOS) {
        deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
      }
    } on PlatformException {
      deviceData = <String, dynamic>{
        '失败:': '获取平台版本失败.'
      };
    }

    if (!mounted) return;

    setState(() {
      _deviceData = deviceData;
    });
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,  ///用户可见的版本字符串。
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,  ///基础源代码管理用来表示此生成的内部值。
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,   ///与产品/硬件相关联的消费者可见品牌（如有）。
      'device': build.device,  ///工业设计的名称。
      'display': build.display,  ///用于向用户显示的生成ID字符串。
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,   ///变更单编号或类似“M4-rc20”的标签。
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,  ///用逗号分隔的标记描述生成，如“unsigned，debug”。
      'type': build.type,  ///生成的类型，如“user”或“eng”。
      'isPhysicalDevice': build.isPhysicalDevice,
      'androidId': build.androidId,
      'systemFeatures': build.systemFeatures,
    };
  }

  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name, ///设备名称
      'systemName': data.systemName, ///当前操作系统的名称。
      'systemVersion': data.systemVersion, ///当前操作系统版本。
      'model': data.model, ///设备型号。
      'localizedModel': data.localizedModel, ///设备型号的本地化名称。
      'identifierForVendor': data.identifierForVendor, ///标识当前设备的唯一UUID值。    eg:367F5936-39E1-4DFA-8DD2-9542424256BE,
      'isPhysicalDevice': data.isPhysicalDevice, ///`如果应用程序在模拟器中运行，则为false，否则为true。
      //从“sys/utsname.h”派生的操作系统信息。
      'utsname.sysname:': data.utsname.sysname, ///操作系统名称。
      'utsname.nodename:': data.utsname.nodename, ///网络节点名称。
      'utsname.release:': data.utsname.release, ///释放级别。
      'utsname.version:': data.utsname.version, ///版本级别。  eg:Darwin Kernel Version 18.2.0: Thu Dec 20 20:46:53 PST 2018,
      'utsname.machine:': data.utsname.machine, ///硬件类型（例如，iPhone6 Plus的“iPhone7,1”）。
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            Platform.isAndroid ? 'Android Device Info' : 'iOS Device Info'),
      ),
      body: ListView(
        children: _deviceData.keys.map((String property) {
          return Row(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  property,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                    child: Text(
                      '${_deviceData[property]}',
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )),
            ],
          );
        }).toList(),
      ),
    );
  }
}