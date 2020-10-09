import 'package:alice/ui/example/rive/slider/house_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:ui';

import 'package:flutter/rendering.dart';
import 'package:flare_flutter/flare_actor.dart';


void main() {
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  //runApp(ExampleSliderPage());
}

class ExampleSliderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Page(title: 'Flutter Slider Page'),
    );
  }
}

class Page extends StatefulWidget {
  final String title;

  Page({this.title, Key key}) : super(key: key);

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> with SingleTickerProviderStateMixin {
  /// Inactivity [Timer]: if it fires, set the animation state back to "Demo Mode"
  /// 不活动[计时器]：如果触发，则将动画状态重新设置为“演示模式”。
  Timer _currentDemoSchedule;
  HouseController _houseController;

  @override
  void initState() {
    _houseController = HouseController(demoUpdated: _update);
    super.initState();
  }

  /// 触发更新。
  _update() => setState((){});

  _scheduleDemo(PointerUpEvent details) {
    if (!_houseController.isDemoMode) {
      if (_currentDemoSchedule != null) {
        _currentDemoSchedule.cancel();
      }
      _currentDemoSchedule = Timer(const Duration(seconds: 2), () {
        setState(() {
          /// 在此计时器结束时重新启动演示。
          _houseController.isDemoMode = true;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Listener(
              onPointerUp: _scheduleDemo,
              child: Stack(fit: StackFit.expand, children: [
                FlareActor("assets/animations/resizing_house.flr",
                  controller: _houseController,
                  fit: BoxFit.cover,
                ),
                Container(
                    margin: const EdgeInsets.only(left: 40, right: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(_houseController.rooms.toString() + "  房间",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Roboto",
                                fontSize: 14,
                                fontWeight: FontWeight.w700)),
                        Slider(
                            min: 0,
                            max: 3,
                            divisions: 3,
                            /// 获取房间值并将其调整为滑块的最小/最大值。
                            value: _houseController.rooms.toDouble() - 3,
                            onChanged: (double value) {
                              /// [setState（）]使用更新的参数触发视觉刷新。
                              setState(() {
                                /// 停止演示。
                                _houseController.isDemoMode = false;
                                /// 当滑块的值更改时，将调用Rooms setter，从而使新动画入队。
                                _houseController.rooms = value.toInt() + 3;

                                /// 停止预定的计时器（如果有）。
                                if (_currentDemoSchedule != null) {
                                  _currentDemoSchedule.cancel();
                                  _currentDemoSchedule = null;
                                }
                              });
                            }),
                        Text("通过拖曳滑块来控制房间变化",
                            style: TextStyle(
                                color: Colors.white.withAlpha(228),
                                fontFamily: "Roboto",
                                fontSize: 14,
                                fontWeight: FontWeight.w700)),
                        Text("（手动控制将停止自动演示模式）",
                            style: TextStyle(
                                color: Colors.white.withAlpha(228),
                                fontFamily: "Roboto",
                                fontSize: 14,
                            ),
                        ),
                      ],
                    ))
              ]),
            ),
        ),
    );
  }
}