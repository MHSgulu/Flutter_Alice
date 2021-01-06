import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';

//“Hero过渡”是一种常见的UI模式。他们让用户知道他们改变了屏幕，同时让交互的焦点保持在前沿和中心。
// Flutter 的 Hero微件将自动在两个导航路线之间创建一个Hero过渡。
// {@youtube 560 315 https://www.youtube.com/watch?v=Be9UH1kXFDw}

///一个小部件，将其子级标记为候选
/// [英雄动画（https://flutter.dev/docs/development/ui/animations/hero-animations）。
///
///用[导航器]按下或弹出[PageRoute]时，将替换整个屏幕的内容。旧路线消失，新路线出现。
///如果两条路线上都有一个共同的视觉功能，那么有助于使用户定位该功能，以便在路线过渡期间从一页物理移动到另一页。这样的动画称为“英雄动画”。
///过渡期间，英雄小部件会在导航器的覆盖图中“飞行”，并且在飞行过程中默认情况下，它们不会在新旧路线的原始位置中显示。
///
///要将小部件标记为此类功能，请将其包装在[Hero]小部件中。
///导航发生时，每个路线上的[Hero]小部件由[HeroController]标识。
///对于具有相同标签的每对[Hero]小部件，都会触发英雄动画。
///
///如果导航时[英雄]已经在飞行中，则其飞行动画将重定向到其新目的地。
///默认情况下，转换期间在运行中显示的小部件是目标路线的[Hero]的子级。
///
///要触发英雄动画，英雄必须存在于新页面动画的第一帧中。
///
///每个[tag]的路由不得包含多个[Hero]。
///
/// ##讨论
///
///必须使Heroes和[Navigator]的[Overlay] [Stack]对齐，才能使所有这些工作。
///每个动画英雄的左上角和右下角坐标将转换为全局坐标，然后从那里转换为该[Stack]的坐标空间，并且在动画期间，整个Hero子树将被移出它的原始位置，并位于该堆栈上。
///如果[Hero]未对齐，则将以相当难看的方式失败。不要旋转英雄！
///
///为使动画看起来不错，至关重要的是，两个位置上的英雄的小部件树必须基本相同。
///默认情况下，* target *的小部件用于进行转换：从路线A到路线B时，路线B的英雄小部件放置在路线A的英雄小部件上。
///如果提供了[flightShuttleBuilder]，则会在飞行过渡期间显示其输出窗口小部件。
///
///默认情况下，当过渡小部件在2条路线上方进行飞行动画时，路线A和路线B的英雄均处于隐藏状态。
///一旦转换开始，[placeholderBuilder]可用于在其位置显示自定义窗口小部件。
///
///在过渡期间，将对过渡小部件进行动画处理，以路由B的英雄位置，然后将该小部件插入到路线B中。
///从B返回到A时，默认情况下，将路线A的英雄小部件放置在路线B的位置英雄的小部件是，然后动画进行另一种方式。
///
/// ###嵌套导航器
///
///如果两个路由中的一个或两个都包含嵌套的[Navigator]，则仅考虑嵌套的这些[Navigator] s中最顶层路由（由[Route.isCurrent]定义）中包含的[Hero]动画 。
///就像在非嵌套情况下一样，嵌套[Navigator]中包含这些[Hero]的最上面的路由也必须是[PageRoute]。
///
/// ##英雄过渡的部分
///
///！[带有Hero过渡部分的图。]（https://flutter.github.io/assets-for-apidocs/assets/interaction/heroes.png）

class HeroDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'Hero',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            ///创建一个英雄。
            /// [tag]和[child]参数不能为null。
            /// [child]参数及其所有后代不能为[Hero] es。
            child: GestureDetector(
              child: Hero(
                ///此特定英雄的标识符。 如果此英雄的标签与我们正在导航或从中导航的[PageRoute]上的英雄标签匹配，则将触发英雄动画。
                tag: 'hero1',
                child: Image.asset(
                  'assets/images/img_gatsby.webp',
                  //width: 250,
                ),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => HeroDemo1()));
              },
            ),
          ),
        ],
      ),
    );
  }
}

class HeroDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'Hero',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: 'hero1',
            child: Image.asset(
              'assets/images/img_gatsby.webp',
              //width: 300,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(12, 8, 12, 0),
            child: Text(
              '这种微笑是极为罕见的微笑，带有一种令人无比放心的感觉，也许你一辈子只可能碰上四五次。 \n '
              '一瞬间这种微笑面对着或者似乎面对着整个永恒的世界，然而又一瞬间，它凝聚到你身上，对你表现出一种不可抗拒的偏爱。 \n'
              '他所表现出的对你理解的程度，恰恰是你想要被理解的程度',
            ),
          ),
        ],
      ),
    );
  }
}
