import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

//想要自定义的用户界面吗？Flutter可以使你快速高效的访问低级别的绘画调用。
//本期视频中，你可以了解更多CustomPaint的相关信息。
// {@youtube 560 315 https://www.youtube.com/watch?v=kp14Y4uHpHs}

///CustomPaint
///
///一个小部件，提供了一个在绘制阶段在其上进行绘制的画布。
///
///当被要求绘制时，[CustomPaint]首先要求其[painter]在当前画布上绘制，然后绘制其子级，然后在绘制其子级之后，请其[foregroundPainter]进行绘制。
///画布的坐标系与[CustomPaint]对象的坐标系匹配。画家应在从原点开始并围绕给定尺寸的区域内的矩形范围内进行绘画。
///（如果画家在这些界限之外绘画，则可能分配的内存不足以光栅化绘画命令，并且结果行为未定义。）要在这些界限内强制绘画，请考虑使用[ClipRect]小部件包装此[CustomPaint]。
///
///画家是通过继承[CustomPainter]来实现的。
///
///因为自定义绘画在绘画过程中会调用其绘画者，所以您不能在回调过程中调用`setState`或`markNeedsLayout`（此框架的布局已发生）。
///
///定制画家通常根据自己的孩子调整大小。如果没有孩子，他们将尝试将其大小调整为[size]，默认为[Size.zero]。 [size]不能为null。
///
/// [isComplex]和[willChange]是对合成器的栅格缓存的提示，并且不能为null。
/// 也可以看看：
///
/// * [CustomPainter]，创建自定义绘画程序时要扩展的类。
/// * [Canvas]，自定义画家用来绘画的类。

class CustomPaintDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'CustomPaint',
        onPressedBack: () => Navigator.pop(context),
      ),
      //此示例说明如何在[CustomPaint]小部件中使用[CustomPainter]中显示的示例自定义绘画工具来显示某些文本的背景。
      body: CustomPaint(
        painter: Sky(),
        child: Center(
          child: Text(
            '很久以前...',
            style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.w900,
              color: Color(0xFFFFFFFF),
            ),
          ),
        ),
      ),
    );
  }
}

/// {@youtube 560315 https://www.youtube.com/watch?v=vvI_NUXK00s}

///CustomPainter
///
/// CustomPaint（在小部件库中）和RenderCustomPaint（在渲染库中）使用的接口。
/// 要实现自定义画图器，可以子类化或实现此接口来定义您的自定义画图委托。
///[CustomPaint]子类必须实现[paint]和[shouldRepaint]方法，还可以选择实现[hitTest]和[shouldRebuildSemantics]方法以及[semanticsBuilder] getter。
///
/// 每当需要重绘自定义对象时，都会调用paint方法。
///当提供类的新实例时，将调用[shouldRepaint]方法，以检查新实例是否实际代表了不同的信息。
///
/// 触发重新绘制的最有效方法是：
/// *扩展此类，并向[CustomPainter]的构造函数提供一个`repaint`参数，该对象在需要重绘时通知其侦听器。
/// *扩展[Listenable]（例如，通过[ChangeNotifier]）并实现[CustomPainter]，以便对象本身直接提供通知。
///在这两种情况下，无论何时勾选动画，[CustomPaint]小部件或[RenderCustomPaint]渲染对象都将侦听[Listenable]并重新绘制，从而避免了管道的构建和布局阶段。
///
///当用户与基础渲染对象进行交互时，将调用[hitTest]方法，以确定用户是否击中了该对象或错过了该对象。
///
///每当自定义对象需要重建其语义信息时，都会调用[semanticsBuilder]。
///
///当提供类的新实例时，将调用[shouldRebuildSemantics]方法，以检查新实例是否包含影响语义树的其他信息。
///
/// 也可以看看：
///
/// * [Canvas]，自定义画家用来绘画的类。
/// * [CustomPaint]，使用[CustomPainter]的小部件，其示例代码说明如何使用上述`Sky`类。
/// * [RadialGradient]，其示例代码部分显示了与上面示例代码不同的观点。

//此示例扩展了与[RadialGradient]所示的代码相同的代码，以创建自定义的绘制天空的绘制器。
class Sky extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset.zero & size;
    var gradient = RadialGradient(
      center: const Alignment(0.7, -0.6),
      radius: 0.2,
      colors: [const Color(0xFFFFFF00), const Color(0xFF0099FF)],
      stops: [0.4, 1.0],
    );
    canvas.drawRect(
      rect,
      Paint()..shader = gradient.createShader(rect),
    );
  }

  @override
  SemanticsBuilderCallback get semanticsBuilder {
    return (Size size) {
      //用标签“ Sun”注释一个包含太阳图片的矩形。 在设备上启用文本到语音功能后，用户将可以通过触摸在此图片上定位太阳。
      var rect = Offset.zero & size;
      var width = size.shortestSide * 0.4;
      rect = const Alignment(0.8, -0.9).inscribe(Size(width, width), rect);
      return [
        CustomPainterSemantics(
          rect: rect,
          properties: SemanticsProperties(
            label: 'Sun',
            textDirection: TextDirection.ltr,
          ),
        ),
      ];
    };
  }

  // 由于此Sky Painter没有字段，因此它总是绘制相同的事物，并且语义信息相同。
  // 因此，我们在这里返回false。
  // 如果我们有字段（由构造函数设置），那么如果它们中的任何一个与oldDelegate上的相同字段不同，则将返回true。
  @override
  bool shouldRepaint(Sky oldDelegate) => false;
  @override
  bool shouldRebuildSemantics(Sky oldDelegate) => false;
}
