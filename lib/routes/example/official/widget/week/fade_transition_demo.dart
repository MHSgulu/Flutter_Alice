import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';

//当您只是寻找简单的转场并且不需要使用 Flutter 中更强大的动画时， 请尝试使用FadeTransition 小部件！
// FadeTransition 可让您轻松淡入淡出小部件，并且可以直接放入Flutter 应用程序。
// {@youtube 560315 https://www.youtube.com/watch?v=rLwWVbv3xDQ}

///对小部件的不透明度进行动画处理。
///
///有关自动在两个子项的大小之间进行动画处理（在它们之间渐隐的动画）的小部件，请参见[AnimatedCrossFade]。
///
///这是[FadeTransition]小部件的图示，它的[opacity]由[CurvedAnimation]设置为[Curves.fastOutSlowIn]设置动画：
///
/// {@animation 300378 https://flutter.github.io/assets-for-api-docs/assets/widgets/fade_transition.mp4}
///
/// 也可以看看：
///
/// * [不透明度]，它不为不透明度的变化设置动画。
/// * [AnimatedOpacity]，它可以对不透明度的变化进行动画处理，而无需使用显式的[Animation]参数。

class FadeTransitionDemo extends StatefulWidget {
  @override
  _FadeTransitionDemoState createState() => _FadeTransitionDemoState();
}

class _FadeTransitionDemoState extends State<FadeTransitionDemo>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );

    animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(controller);

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ///开始向前（朝末尾）运行此动画。
    ///返回动画完成时完成的[TickerFuture]。
    ///最近返回的[TickerFuture]（如果有的话）被标记为已取消，这意味着将来永远不会完成，并且其[TickerFuture.orCancel]派生的Future会出现[TickerCanceled]错误。
    ///在动画过程中，[状态]被报告为[AnimationStatus.forward]，当在动画结束时到达[upperBound]时，该状态将切换为[AnimationStatus.completed]。
    controller.forward();
    return Scaffold(
      appBar: MyAppBar(
        label: 'FadeTransition',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: Center(
        ///创建不透明度过渡。
        /// [opacity]参数不能为null。
        child: FadeTransition(
          ///控制孩子的不透明度的动画。
          ///如果不透明度动画的当前值为v，则子级将以v的不透明度进行绘制。
          ///例如，如果v为0.5，则子级将与其背景混合50％。 同样，如果v为0.0，则子级将完全透明。
          opacity: animation,
          child: Text('渐隐过渡'),
        ),
      ),
    );
  }
}
