import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';

//使用Positioned微件将Flutter微件放置在Stack中。
// 使用Positioned微件包裹Stack的子项并设置参数（顶部，底部，左侧，右侧，高度和宽度）以实现所需的Stack布局。
// 您还可以使用Positioned.fill使微件填充Stack的空间
// {@youtube 560 315 https://www.youtube.com/watch?v=EgtPleVwxBQ}

///一个控件，该控件控制[Stack]的子级的放置位置。
///
/// [Positioned]小部件必须是[Stack]的后代，
/// 并且从[Positioned]小部件到其封闭的[Stack]的路径必须仅包含[StatelessWidget]或[StatefulWidget]（其他类型的小部件，例如[RenderObjectWidget]）。
///
///如果小部件包装在[Positioned]中，则它是[Stack]中的_positioned_小部件。
///如果[top]属性为非null，则此子项的顶部边缘将位于堆栈小部件顶部的[top]布局单元中。 [right]，[bottom]和[left]属性的工作方式类似。
///
///如果[top]和[bottom]属性都不为空，则将强制子级具有完全满足两个约束所需的高度。
///同样，将[right]和[left]属性设置为非null值将强制子级具有特定的宽度。另外，[width]和[height]属性可用于给出尺寸，并带有一个相应的位置属性（例如[top]和[height]）。
///
///如果特定轴上的所有三个值都为空，则[Stack.alignment]属性用于定位子级。
///
///如果所有六个值都为空，则该子项是未定位的子项。 [堆栈]仅使用未定位的子项自行调整大小。
///
/// 也可以看看：
///
/// * [AnimatedPositioned]，只要给定位置发生变化，它就会在给定时间内自动转换孩子的位置。
/// * [PositionedTransition]，它使用提供的[Animation]来在给定的时间内转换孩子位置的变化。
/// * [PositionedDirectional]，它适应环境[Directionality]。

class PositionedDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'Positioned',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => PositionedDemo1())),
              child: Text('演示1'),
            ),
          ),
        ],
      ),
    );
  }

}

class PositionedDemo1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'Positioned',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.white,
          child: Stack(
            children: [
              Positioned(
                top: 25,
                left: 25,
                child: Container(
                  color: Colors.black12,
                  child: FlutterLogo(
                    size: 60,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}