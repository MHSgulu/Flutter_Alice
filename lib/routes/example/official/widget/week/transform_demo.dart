import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';

//使用“Transform”小部件将Flutter应用程序转换为令人惊叹的东西。
//
// “Flutter的观点”文章→https://bit.ly/2TYvc31
// “被旋转的菜单图标”由Raouf Rahiche提供→https://bit.ly/2RE8fFC
// “折叠动画的过渡”，“有弹性的滚动”，“酷的卡菜单”由FaoB提供→https://bit.ly/2Rzq1tE
// “3D透视动画”由Hung HD提供→ https://bit.ly/2sx6fjy

class TransformDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'Transform',
        onPressedBack: () => Navigator.pop(context),
      ),
      /*body: Transform(
        transform: null,
      ),*/
    );
  }

}