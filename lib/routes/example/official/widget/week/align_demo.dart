import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';

//Align 小部件能让你将小部件置放在其父小部件中的明确位置。
// 你也可以用 Align 来将小部件叠起来。
// Align 是个小部件自定义组合的好工具！
// {@youtube 560 315 https://www.youtube.com/watch?v=g2E7yl3MwMk}

///一个小部件，可将其子级与自身对齐，并根据子级的大小（可选）调整自身大小。
///
///例如，要在右下角对齐一个框，您将向此框传递一个严格的约束，该约束大于孩子的自然大小，并对齐[Alignment.bottomRight]。
///
///如果此小部件的尺寸受到限制并且[widthFactor]和[heightFactor]为null，则它将尽可能大。
///如果尺寸不受限制并且相应的尺寸因子为null，则小部件将在该尺寸中匹配其子级的尺寸。
///如果尺寸因子不为空，则此小部件的相应尺寸将是孩子尺寸和尺寸因子的乘积。
///例如，如果widthFactor为2.0，则此小部件的宽度将始终是其子项宽度的两倍。
///
/// ＃＃ 这个怎么运作
///
/// [alignment]属性描述子控件的“孩子”坐标系统中的一个点和该坐标系统中的另一个点。 [Align]小部件将`child'定位为使两个点彼此对齐。
///
/// 也可以看看：
///
/// * [AnimatedAlign]，可以在给定的时间内平滑地调整[alignment]中的变化。
/// * [CustomSingleChildLayout]，它使用委托来控制单个子项的布局。
/// * [Center]，与[Align]相同，但[alignment]始终设置为[Alignment.center]。
/// * [FractionallySizedBox]，它将根据自身大小的一小部分调整子项的大小，并根据[Alignment]值对子项进行定位。

class AlignDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'Align',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AlignDemo1())),
              child: Text('演示1'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AlignDemo2())),
              child: Text('演示2'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AlignDemo3())),
              child: Text('演示3'),
            ),
          ),
        ],
      ),
    );
  }
}

//本例中 的Align小部件使用Alignment，Alignment.topRight中定义的常量之一 。
// 这会将FlutterLogo放置在父级蓝色Container的右上角。
//！[一个在右上角带有Flutter徽标的蓝色方形容器。]
// （https://flutter.github.io/assets-for-api-docs/assets/widgets/align_constant.png）
class AlignDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'Align',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: Center(
        child: Container(
          height: 120.0,
          width: 120.0,
          color: Colors.blue[50],
          child: Align(
            alignment: Alignment.topRight,
            child: FlutterLogo(
              size: 60,
            ),
          ),
        ),
      ),
    );
  }
}


//以下示例中使用的[Alignment]定义了一个点：
//   * (0.2 * width of [FlutterLogo]/2 + width of [FlutterLogo]/2, 0.6 * height  of [FlutterLogo]/2 + height of [FlutterLogo]/2) = (36.0, 48.0)
// [Alignment]类使用的坐标系的原点位于[Container]的中心，如上面的[Icon]所示。 [Align]将根据此坐标系将[FlutterLogo]放在（36.0，48.0）。
//！[一个蓝色方形容器，其Flutter徽标根据上述指定的对齐方式定位。在容器的中心标记一个点作为Alignment坐标系的原点。]
// (https://flutter.github.io/assets-for-api-docs/assets/widgets/align_alignment.png)
class AlignDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'Align',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: Center(
        child: Container(
          height: 120.0,
          width: 120.0,
          color: Colors.blue[50],
          child: Align(
            alignment: Alignment(0.2, 0.6),
            child: FlutterLogo(
              size: 60,
            ),
          ),
        ),
      ),
    );
  }
}

//以下示例中使用的[FractionalOffset]定义了两点：
// *在蓝色容器的坐标系中, (0.2 * width of [FlutterLogo], 0.6 * height of [FlutterLogo]) = (12.0, 36.0)
// *在[Align]小部件的坐标系中，(0.2 * width of [Align], 0.6 * height of [Align]) = (24.0, 72.0)
// [Align]小部件将[FlutterLogo]定位为使两个点彼此重叠。
// 在此示例中，[FlutterLogo]的左上角将位于[Align]小部件的左上角（24.0，72.0）-（12.0，36.0）=（12.0，36.0）处。
// [FractionalOffset]类使用一个坐标系，其原点位于[Container]的左上角，与上述示例中使用[Alignment]的面向中心的系统不同。
//！[一个蓝色方形容器，其Flutter徽标根据上面指定的FractionalOffset定位。在容器的左上角标记了一个点，作为FractionalOffset坐标系的原点。]
// （https://flutter.github.io/assets-for-api-docs/assets/widgets/align_fractional_offset.png）
class AlignDemo3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'Align',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: Center(
        child: Container(
          height: 120.0,
          width: 120.0,
          color: Colors.blue[50],
          child: Align(
            alignment: FractionalOffset(0.2, 0.6),
            child: FlutterLogo(
              size: 60,
            ),
          ),
        ),
      ),
    );
  }
}
