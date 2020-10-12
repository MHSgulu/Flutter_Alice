import 'package:alice/common/global.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/provider/asset_flare.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SwitchDark extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SwitchDarkState();
}

class SwitchDarkState extends State<SwitchDark> {
  final asset = AssetFlare(bundle: rootBundle, name: "assets/animations/dark_switch.flr");
  bool isAllowOnTap = true; //是否允许点击
  bool isDark = false; //是否黑夜模式
  String animationName = 'day_idle';

  //切换Switch
  void switchAnimation() {
    if (mounted) {
      setState(() {
        ///正在执行动画 不允许点击
        isAllowOnTap = false;
        if (isDark) {
          Fluttertoast.showToast(msg: '切换到白天模式');
          animationName = 'switch_day';
          Global.isDark = false;
        } else {
          Fluttertoast.showToast(msg: '切换到黑夜模式');
          animationName = 'switch_night';
          Global.isDark = true;
        }
        isDark = !isDark;
      });
    }
  }

  //更换Switch动画
  void replaceAnimation(String name) {
    Future.delayed(Duration(milliseconds: 1500), () {
      print('延时1.5秒更换动画');
      if (mounted) {
        setState(() {
          if (name == 'switch_night') {
            animationName = 'night_idle';
          } else {
            animationName = 'day_idle';
          }

          ///执行动画完毕 可以点击
          isAllowOnTap = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Container(
            width: 10,
          ),
          Text('昼夜模式'),
          Expanded(child: Container()),
          Container(
            margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
            width: 100,
            height: 50,
            //color: Colors.black,
            child: GestureDetector(
              onTap: isAllowOnTap ? switchAnimation : null,
              child: FlareActor.asset(
                asset,
                animation: animationName, ///要播放的动画的名称。
                callback: replaceAnimation, ///[animation]完成时调用回调。 如果[animation]正在循环，则永远不会调用此回调。
              ),
            ),
          ),
        ],
      ),
    );
  }
}