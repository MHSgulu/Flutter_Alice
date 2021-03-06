import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoButtonRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: '按钮',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            ///iOS样式的按钮。
            ///接受淡入淡出并带有触摸效果的文本或图标。
            ///可能有背景。
            /// [padding]默认为16.0像素。
            /// 在固定高度的父级中使用[CupertinoButton]时，例如[CupertinoNavigationBar]，应使用较小的甚至是[EdgeInsets.zero]来防止剪切较大的[child]小部件。
            child: CupertinoButton(
              child: Text('常规按钮',style: TextStyle(fontSize: 14),),
              padding: EdgeInsets.zero,
              //按钮的最小尺寸。
              //默认为iOS人机界面指南推荐的kMinInteractiveDimensionCupertino，将其作为最小可点击区域。
              //根据iOS人机界面指南，任何交互式区域的最小尺寸。
              //用于避免用户难以与之交互的小区域。
              //它适用于区域的两个维度，因此，大小为kMinInteractiveDimension x kMinInteractiveDimension的正方形是应响应手势的最小可接受区域。
              minSize: 44,
              onPressed: () {

              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            ///创建一个具有填充背景的iOS样式的按钮。
            ///背景颜色来自[CupertinoTheme]的`primaryColor`。
            ///要指定自定义背景色，请使用默认构造函数的[color]参数。
            child: CupertinoButton.filled(
              child: Text('带填充背景的按钮',style: TextStyle(fontSize: 14),),
              onPressed: () {

              },
            ),
          ),
        ],
      ),
    );
  }
}
