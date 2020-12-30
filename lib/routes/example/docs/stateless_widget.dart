import 'package:flutter/material.dart';

///不需要可变状态的小部件。
///
///无状态窗口小部件是通过构建其他更详细描述用户界面的窗口小部件的星座来描述用户界面的一部分的窗口小部件。
///构建过程将以递归方式继续进行，直到用户界面的描述完全具体为止（例如，完全由描述具体RenderObject的RenderObjectWidget组成）。
///
/// 当您要描述的用户界面部分不依赖于对象本身以及膨胀了Widget的BuildContext中的配置信息时，无状态窗口小部件很有用。
/// 对于可以动态变化的成分，例如由于具有内部时钟驱动状态，或者取决于某些系统状态，请考虑使用StatefulWidget。
///
/// 性能考量
/// 通常仅在以下三种情况下调用无状态窗口小部件的构建方法：第一次将窗口小部件插入树中，窗口小部件的父级更改其配置时以及何时继承InheritedWidget时它依赖于更改。
///
/// 如果小部件的父级将定期更改小部件的配置，或者它依赖于频繁更改的继承小部件，则优化构建方法的性能以保持流畅的渲染性能非常重要。
///
/// 有几种技术可用于最大程度地减少重建无状态窗口小部件的影响：
///
/// 1、最小化由build方法及其创建的任何小部件临时创建的节点数。
/// 例如，可以考虑仅使用Align或CustomSingleChildLayout，而不是精心设计行，列，填充和SizedBox的位置以特别花哨的方式放置单个孩子。
/// 可以考虑使用一个CustomPaint小部件，而不是将多个Container复杂地层叠在一起，并使用Decorations来绘制正确的图形效果。
///
/// 2、尽可能使用const小部件，并为小部件提供const构造函数，以便小部件的用户也可以这样做。
///
/// 3、考虑将无状态窗口小部件重构为有状态窗口小部件，以便它可以使用StatefulWidget中描述的一些技术，
/// 例如缓存子树的公共部分，以及在更改树结构时使用GlobalKeys。
///
/// 4、如果由于使用InheritedWidgets而使窗口小部件可能频繁地重建，请考虑将无状态窗口小部件重构为多个窗口小部件，并将树中更改的部分推到叶子上。
/// 例如，最里面的窗口小部件取决于主题，而不是用四个窗口小部件构建树，
/// 而是考虑将构建函数的一部分分解为将最里面的窗口小部件构建到其自己的窗口小部件中，以便仅将最里面的窗口小部件 主题更改时需要重新构建。

//Sample
class GreenFrog extends StatelessWidget {
  const GreenFrog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: const Color(0xFF2DBD3A));
  }
}

//Sample
class Frog extends StatelessWidget {
  const Frog({
    Key key,
    this.color = const Color(0xFF2DBD3A),
    this.child,
  }) : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(color: color, child: child);
  }
}
