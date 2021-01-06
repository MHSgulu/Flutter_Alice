import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';

//大多数Flutter widget都是盒子。FittedBox有助于管理空间限制和盒子的布局。
// {@youtube 560 315 https://www.youtube.com/watch?v=T4Uehk3_wlY}

///根据[fit]缩放并定位其子对象。
///
/// 也可以看看：
///
/// * [Transform]，它在绘制时对其子控件进行任意变换。
/// * [布局小部件目录]（https://flutter.dev/widgets/layout/）。

class FittedBoxDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'FittedBox',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: Column(
        children: [
          ///创建一个小部件，该小部件根据[fit]在其内部缩放和定位其子级。
          /// [fit]和[alignment]参数不能为null。
          Container(
            height: 400,
            color: Colors.blue,
            child: FittedBox(
              fit: BoxFit.contain,
              alignment: Alignment.center,
              child: Image.asset('assets/images/img_daisy.webp'),
            ),
          ),
        ],
      ),
    );
  }

}