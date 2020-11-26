import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bmflocation/bdmap_location_flutter_plugin.dart';
import 'package:flutter_bmflocation/flutter_baidu_location.dart';
import 'package:flutter_bmflocation/flutter_baidu_location_android_option.dart';
import 'package:flutter_bmflocation/flutter_baidu_location_ios_option.dart';

// 基础定位
class BasicLoc extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<BasicLoc> {
  Map<String, Object> _loationResult;
  BaiduLocation _baiduLocation; // 定位结果

  StreamSubscription<Map<String, Object>> _locationListener;

  LocationFlutterPlugin _locationPlugin = LocationFlutterPlugin();

  @override
  void initState() {
    super.initState();

    /// 动态申请定位权限
    _locationPlugin.requestPermission();

    /// 设置ios端ak, android端ak可以直接在清单文件中配置
    if (Platform.isIOS) {
      LocationFlutterPlugin.setApiKey("tf3bUxEDYet06xMtM2UMnV1fgTRgD9Qa");
    }

    _locationListener = _locationPlugin.onResultCallback().listen((Map<String, Object> result) {
      if (mounted) {
        setState(() {
          _loationResult = result;
          try {
            _baiduLocation = BaiduLocation.fromMap(result); // 将原生端返回的定位结果信息存储在定位结果类中
            print('数据点位: _baiduLocation.country: ${_baiduLocation.country}');
          } catch (e) {
            print(e);
          }
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    if (null != _locationListener) {
      _locationListener.cancel(); // 停止定位
    }
  }

  /// 设置android端和ios端定位参数
  void _setLocOption() {
    /// android 端设置定位参数
    BaiduLocationAndroidOption androidOption = BaiduLocationAndroidOption();
    androidOption.setCoorType("bd09ll"); // 设置返回的位置坐标系类型
    androidOption.setIsNeedAltitude(true); // 设置是否需要返回海拔高度信息
    androidOption.setIsNeedAddres(true); // 设置是否需要返回地址信息
    androidOption.setIsNeedLocationPoiList(true); // 设置是否需要返回周边poi信息
    androidOption.setIsNeedNewVersionRgc(true); // 设置是否需要返回最新版本rgc信息
    androidOption.setIsNeedLocationDescribe(true); // 设置是否需要返回位置描述
    androidOption.setOpenGps(true); // 设置是否需要使用gps
    androidOption.setLocationMode(LocationMode.Hight_Accuracy); // 设置定位模式
    androidOption.setScanspan(1000); // 设置发起定位请求时间间隔

    Map androidMap = androidOption.getMap();

    /// ios 端设置定位参数
    BaiduLocationIOSOption iosOption = BaiduLocationIOSOption();
    iosOption.setIsNeedNewVersionRgc(true); // 设置是否需要返回最新版本rgc信息
    iosOption.setBMKLocationCoordinateType(
        "BMKLocationCoordinateTypeBMK09LL"); // 设置返回的位置坐标系类型
    iosOption.setActivityType("CLActivityTypeAutomotiveNavigation"); // 设置应用位置类型
    iosOption.setLocationTimeout(10); // 设置位置获取超时时间
    iosOption.setDesiredAccuracy("kCLLocationAccuracyBest"); // 设置预期精度参数
    iosOption.setReGeocodeTimeout(10); // 设置获取地址信息超时时间
    iosOption.setDistanceFilter(100); // 设置定位最小更新距离
    iosOption.setAllowsBackgroundLocationUpdates(true); // 是否允许后台定位
    iosOption.setPauseLocUpdateAutomatically(true); //  定位是否会被系统自动暂停

    Map iosMap = iosOption.getMap();

    _locationPlugin.prepareLoc(androidMap, iosMap);
  }

  /// 启动定位
  void _startLocation() {
    if (null != _locationPlugin) {
      _setLocOption();
      _locationPlugin.startLocation();
    }
  }

  /// 停止定位
  void _stopLocation() {
    if (null != _locationPlugin) {
      _locationPlugin.stopLocation();
    }
  }

  Container _createButtonContainer() {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            onPressed: _startLocation,
            child: Text('开始定位'),
            color: Colors.blue,
            textColor: Colors.white,
          ),
          Container(width: 20.0),
          RaisedButton(
            onPressed: _stopLocation,
            child: Text('停止定位'),
            color: Colors.blue,
            textColor: Colors.white,
          )
        ],
      ),
    );
  }

  Widget _resultWidget(key, value) {
    return Container(
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('$key:' ' $value'),
            ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = List();

    if (_loationResult != null) {
      _loationResult.forEach((key, value) {
        widgets.add(_resultWidget(key, value));
      });
    }

    widgets.add(_createButtonContainer());

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('基础定位'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widgets,
      ),
    ));
  }
}
