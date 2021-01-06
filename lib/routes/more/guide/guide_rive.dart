import 'package:alice/routes/example/company/rive/flr/button/example_like_button.dart';
import 'package:alice/routes/example/company/rive/flr/example_fab.dart';
import 'package:alice/routes/example/company/rive/flr/example_flower.dart';
import 'package:alice/routes/example/company/rive/flr/example_penguin.dart';
import 'package:alice/routes/example/company/rive/flr/example_rocket_man.dart';
import 'package:alice/routes/example/company/rive/flr/example_switch.dart';
import 'package:alice/routes/example/company/rive/flr/reload/example_space_reload.dart';
import 'package:alice/routes/example/company/rive/flr/slider/example_slider.dart';
import 'package:alice/routes/example/company/rive/flr/teddy/example_teddy.dart';
import 'package:alice/routes/example/company/rive/riv/example_rive.dart';
import 'package:alice/routes/example/company/rive/riv/example_truck.dart';
import 'package:alice/widgets/custom/custom_scroll_behavior.dart';
import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:alice/widgets/custom/my_list_tile_card.dart';
import 'package:flutter/material.dart';

class GuideRiveRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: '动画样品',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: ScrollConfiguration(
        behavior: CustomScrollBehavior(),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                MyCardTile(
                  text: 'Rive 1(Flare)  火箭人动画',
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ExampleRocketManPage())),
                ),
                MyCardTile(
                  text: 'Rive 1(Flare)  植物动画',
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ExampleFlowerPage())),
                ),
                MyCardTile(
                  text: 'Rive 1(Flare)  泰迪熊登录动画',
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ExampleTeddyPage())),
                ),
                MyCardTile(
                  text: 'Rive 1(Flare)  笑脸开关按钮动画',
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ExampleSwitchPage())),
                ),
                MyCardTile(
                  text: 'Rive 1(Flare)  Like Button 按钮动画',
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ExampleHeartButton())),
                ),
                MyCardTile(
                  text: 'Rive 1(Flare)  Like Button 摇滚企鹅动画',
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ExampleRockPenguinPage())),
                ),
                MyCardTile(
                  text: 'Rive 1(Flare)  动画(是否抗锯齿的显示差异)',
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ExampleFabPage())),
                ),
                MyCardTile(
                  text: 'Rive 1(Flare)  Slider滑块与房屋动态变化',
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ExampleSliderPage())),
                ),
                MyCardTile(
                  text: 'Rive 1(Flare)  卡通版太空主题下拉刷新',
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ExampleSpaceReloadPage())),
                ),
                MyCardTile(
                  text: 'Rive 2  简单动画',
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ExampleRivePage())),
                ),
                MyCardTile(
                  text: 'Rive 2  混合动画',
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => MyRiveAnimation())),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
