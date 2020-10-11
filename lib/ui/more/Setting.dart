import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/provider/asset_flare.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SettingPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SettingPageState();

}


class _SettingPageState extends State<SettingPage> {
  final asset = AssetFlare(bundle: rootBundle, name: "assets/animations/dark_switch.flr");
  bool isOnTap = false;
  bool isDark = false;
  String animationName = 'day_idle';

  //切换Switch
  void switchAnimation() {
    if(mounted){
      setState(() {
        ///正在执行动画 不允许点击
        isOnTap = true;
        if(isDark){
          Fluttertoast.showToast(msg: '切换到白天模式');
          animationName = 'switch_day';
        }else{
          Fluttertoast.showToast(msg: '切换到黑夜模式');
          animationName = 'switch_night';
        }
        isDark = ! isDark;
      });
    }
  }

  //更换Switch动画
  void replaceAnimation(String name) {
    Future.delayed(Duration(milliseconds: 1500), () {
      print('延时1.5秒更换动画');
      if(mounted){
        setState(() {
          if(name == 'switch_night'){
            animationName = 'night_idle';
          }else{
            animationName = 'day_idle';
          }
          ///执行动画完毕 可以点击
          isOnTap = false;
        });
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded,color: Colors.black,),
            onPressed: (){
              Navigator.pop(context);
            },
        ),
        title: Text(
          '设置',
          style: TextStyle(color: Colors.black, fontSize: 18,),
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(height: 10,),
            Card(
              child: Row(
                children: [
                  Container(width: 10,),
                  Text('昼夜模式'),
                  Expanded(child: Container()),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
                    width: 100,
                    height: 50,
                    //color: Colors.black,
                    child: GestureDetector(
                      onTap: isOnTap ? null : switchAnimation,
                      child: FlareActor.asset(
                        asset,
                        animation: animationName,
                        ///[animation]完成时调用回调。 如果[animation]正在循环，则永远不会调用此回调。
                        callback: replaceAnimation,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}




