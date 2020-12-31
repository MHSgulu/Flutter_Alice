import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';

//你可以用显式动画来自己写出活动的变化，你也可以让Flutter帮你让它们动起来！
// 利用AnimatedContainer微件，你只需用某个特定的属性（如色彩）来实施一次建造，再用另一个值来再次实施建造。
// Flutter会自动地让两个值之间的变化动起来！而且你可以指定动画长度和个性化曲线。
// {@youtube 560315 https://www.youtube.com/watch?v=yI-8QHpGIP4}


/// [Container]的动画版本，会在一段时间内逐渐更改其值。
///
/// [AnimatedContainer]将使用提供的曲线和持续时间更改属性的旧值和新值时自动为其设置动画。不为null的属性不设置动画。它的子代和后代没有动画。
///
///此类对于在内部[AnimationController]的不同参数之间到[Container]生成简单的隐式转换非常有用。
///对于更复杂的动画，您可能希望使用[AnimatedWidget]的子类，例如[DecoratedBoxTransition]或使用自己的[AnimationController]。
///
/// 也可以看看：
///
/// * [AnimatedPadding]，它是此小部件的子集，仅支持对[padding]进行动画处理。
/// * [布局小部件目录]（https://flutter.dev/widgets/layout/）。
/// * [AnimatedPositioned]作为[Stack]的子元素，只要给定位置发生变化，它就会在给定时间内自动转换其子元素的位置。
/// * [AnimatedAlign]，只要给定的[alignment]发生变化，它就会在给定的时间内自动转换其孩子的位置。
/// * [AnimatedSwitcher]，它将一个子项切换为具有可自定义过渡的新子项。
/// * [AnimatedCrossFade]，它在两个子项之间淡入并插入其大小。



///创建一个隐式为其参数设置动画的容器。
///
/// [curve]和[duration]参数不能为null。


/// AnimatedContainer的Flutter代码示例
///以下示例（如上所示）在两个状态之间转换了AnimatedContainer。当点击时，它会调整“高度”，“宽度”，“颜色”和[alignment]属性。
class AnimatedContainerDemo extends StatefulWidget{
  @override
  _AnimatedContainerDemoState createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'AnimatedContainer',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                selected = !selected;
              });
            },
            child: Center(
              child: AnimatedContainer(
                width: selected ? 200.0 : 100.0,
                height: selected ? 100.0 : 200.0,
                color: selected ? Colors.red : Colors.blue,
                alignment: selected ? Alignment.center : AlignmentDirectional.topCenter,
                duration: Duration(seconds: 2),
                curve: Curves.fastOutSlowIn,
                child: FlutterLogo(size: 75),
              ),
            ),
          ),
        ],
      ),
    );
  }
}




