import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';



///创建一个控件，用于控制[可滚动]控件在子树中的行为。[行为]和[子]参数不能为空。
class MyScrollBehavior extends ScrollBehavior{
  ///修改此函数时，还应考虑修改MaterialScrollBehavior中的实现。
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    if(Platform.isAndroid){
      return child;
    }else{
      return super.buildViewportChrome(context,child,axisDirection);
    }
  }
}