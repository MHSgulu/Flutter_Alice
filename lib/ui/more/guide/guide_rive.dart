import 'package:alice/custom/custom_scroll_behavior.dart';
import 'package:alice/ui/example/rive/flr/button/example_like_button.dart';
import 'package:alice/ui/example/rive/flr/example_fab.dart';
import 'package:alice/ui/example/rive/flr/example_flower.dart';
import 'package:alice/ui/example/rive/flr/example_penguin.dart';
import 'package:alice/ui/example/rive/flr/example_rocket_man.dart';
import 'package:alice/ui/example/rive/flr/example_switch.dart';
import 'package:alice/ui/example/rive/flr/reload/example_space_reload.dart';
import 'package:alice/ui/example/rive/flr/slider/example_slider.dart';
import 'package:alice/ui/example/rive/flr/teddy/example_teddy.dart';
import 'package:alice/ui/example/rive/riv/example_rive.dart';
import 'package:alice/ui/example/rive/riv/example_truck.dart';
import 'package:flutter/material.dart';


class GuideRiveRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('动画示例'),
        backgroundColor: Colors.deepOrangeAccent[100],
      ),
      body: ScrollConfiguration(
        behavior: CustomScrollBehavior(true, true, Colors.deepOrangeAccent[100]),
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
                      Navigator.push(context, MaterialPageRoute(builder: (_) => ExampleRocketManPage()));
                    },
                    splashColor: Colors.deepOrangeAccent[100],
                    child: ListTile(
                      title: Text('Rive 1(Flare)  火箭人动画'),
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
                      Navigator.push(context, MaterialPageRoute(builder: (_) => ExampleFlowerPage()));
                    },
                    splashColor: Colors.deepOrangeAccent[100],
                    child: ListTile(
                      title: Text('Rive 1(Flare)  植物动画'),
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
                      Navigator.push(context, MaterialPageRoute(builder: (_) => ExampleTeddyPage()));
                    },
                    splashColor: Colors.deepOrangeAccent[100],
                    child: ListTile(
                      title: Text('Rive 1(Flare)  泰迪熊登录动画'),
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
                      Navigator.push(context, MaterialPageRoute(builder: (_) => ExampleSwitchPage()));
                    },
                    splashColor: Colors.deepOrangeAccent[100],
                    child: ListTile(
                      title: Text('Rive 1(Flare)  switch 笑脸开关按钮动画'),
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
                      Navigator.push(context, MaterialPageRoute(builder: (_) => ExampleHeartButton()));
                    },
                    splashColor: Colors.deepOrangeAccent[100],
                    child: ListTile(
                      title: Text('Rive 1(Flare)  Like Button 按钮动画 '),
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
                      Navigator.push(context, MaterialPageRoute(builder: (_) => ExampleRockPenguinPage()));
                    },
                    splashColor: Colors.deepOrangeAccent[100],
                    child: ListTile(
                      title: Text('Rive 1(Flare)  摇滚企鹅动画 '),
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
                      Navigator.push(context, MaterialPageRoute(builder: (_) => ExampleFabPage()));
                    },
                    splashColor: Colors.deepOrangeAccent[100],
                    child: ListTile(
                      title: Text('Rive 1(Flare)  动画(是否抗锯齿的显示差异) '),
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
                      Navigator.push(context, MaterialPageRoute(builder: (_) => ExampleSliderPage()));
                    },
                    splashColor: Colors.deepOrangeAccent[100],
                    child: ListTile(
                      title: Text('Rive 1(Flare)  Slider滑块与房屋动态变化 '),
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
                      Navigator.push(context, MaterialPageRoute(builder: (_) => ExampleSpaceReloadPage()));
                    },
                    splashColor: Colors.deepOrangeAccent[100],
                    child: ListTile(
                      title: Text('Rive 1(Flare)  卡通版太空主题下拉刷新 '),
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
                      Navigator.push(context, MaterialPageRoute(builder: (_) => MyRiveAnimation()));
                    },
                    splashColor: Colors.deepOrangeAccent[100],
                    child: ListTile(
                      title: Text('Rive 2  混合动画'),
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
                      Navigator.push(context, MaterialPageRoute(builder: (_) => ExampleRivePage()));
                    },
                    splashColor: Colors.deepOrangeAccent[100],
                    child: ListTile(
                      title: Text('Rive 2 简单动画'),
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