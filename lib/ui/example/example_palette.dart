import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:palette_generator/palette_generator.dart';

const Color _kBackgroundColor = Color(0xffa0a0a0);
const Color _kSelectionRectangleBackground = Color(0x15000000);
const Color _kSelectionRectangleBorder = Color(0x80000000);
const Color _kPlaceholderColor = Color(0x80404040);

@immutable
class ImageColors extends StatefulWidget {
  const ImageColors({
    Key key,
    this.title,
    this.image,
    this.imageSize,
  }) : super(key: key);

  /// 显示在页面顶部的标题。
  final String title;

  /// 这是用于从中加载颜色的图像提供程序。
  final ImageProvider image;

  /// 图像的尺寸。
  final Size imageSize;

  @override
  _ImageColorsState createState() => _ImageColorsState();
}

class _ImageColorsState extends State<ImageColors> {
  Rect region;
  Rect dragRegion;
  Offset startDrag;
  Offset currentDrag;
  PaletteGenerator paletteGenerator;

  final GlobalKey imageKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    region = Offset.zero & widget.imageSize;
    _updatePaletteGenerator(region);
  }

  Future<void> _updatePaletteGenerator(Rect newRegion) async {
    paletteGenerator = await PaletteGenerator.fromImageProvider(
      widget.image,
      size: widget.imageSize,
      region: newRegion,
      maximumColorCount: 20,
    );
    setState(() {});
  }

  // 当用户开始拖动时调用
  void _onPanDown(DragDownDetails details) {
    final RenderBox box = imageKey.currentContext.findRenderObject();
    final Offset localPosition = box.globalToLocal(details.globalPosition);
    setState(() {
      startDrag = localPosition;
      currentDrag = startDrag;
      dragRegion = Rect.fromPoints(startDrag, currentDrag);
    });
  }

  // 当用户拖动时调用：只更新区域，而不是颜色。
  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      currentDrag += details.delta;
      dragRegion = Rect.fromPoints(startDrag, currentDrag);
    });
  }

  // 如果取消拖动（例如，通过旋转设备或切换应用程序）调用
  void _onPanCancel() {
    setState(() {
      dragRegion = null;
      startDrag = null;
    });
  }

  // 当拖动结束时调用。设置区域并更新颜色。
  Future<void> _onPanEnd(DragEndDetails details) async {
    Rect newRegion =
        (Offset.zero & imageKey.currentContext.size).intersect(dragRegion);
    if (newRegion.size.width < 4 && newRegion.size.width < 4) {
      newRegion = Offset.zero & imageKey.currentContext.size;
    }
    await _updatePaletteGenerator(newRegion);
    setState(() {
      region = newRegion;
      dragRegion = null;
      startDrag = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _kBackgroundColor,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            // GestureDetector用于处理选择矩形。
            child: GestureDetector(
              onPanDown: _onPanDown,
              onPanUpdate: _onPanUpdate,
              onPanCancel: _onPanCancel,
              onPanEnd: _onPanEnd,
              child: Stack(children: <Widget>[
                Image(
                  key: imageKey,
                  image: widget.image,
                  width: widget.imageSize.width,
                  height: widget.imageSize.height,
                ),
                // 这是选择矩形。
                Positioned.fromRect(
                    rect: dragRegion ?? region ?? Rect.zero,
                    child: Container(
                      decoration: BoxDecoration(
                          color: _kSelectionRectangleBackground,
                          border: Border.all(
                            width: 1.0,
                            color: _kSelectionRectangleBorder,
                            style: BorderStyle.solid,
                          )),
                    )),
              ]),
            ),
          ),
          // 使用FutureBuilder，这样当调色板生成器生成其数据时，将显示选项板。
          PaletteSwatches(generator: paletteGenerator),
        ],
      ),
    );
  }
}

/// 一个小部件，为给定的[PaletteGenerator]绘制样例，并显示选定的目标颜色。
class PaletteSwatches extends StatelessWidget {
  /// 创建调色板样例。
  ///
  /// [generator] 是可选的。如果它是空的，那么显示将只是一个空容器。
  const PaletteSwatches({Key key, this.generator}) : super(key: key);

  /// 包含我们要显示的所有样例的 [PaletteGenerator]。
  final PaletteGenerator generator;

  @override
  Widget build(BuildContext context) {
    final List<Widget> swatches = <Widget>[];
    if (generator == null || generator.colors.isEmpty) {
      return Container();
    }
    for (Color color in generator.colors) {
      swatches.add(PaletteSwatch(color: color));
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Wrap(
          children: swatches,
        ),
        Container(height: 30.0),
        PaletteSwatch(label: 'Dominant', color: generator.dominantColor?.color),
        PaletteSwatch(label: 'Light Vibrant', color: generator.lightVibrantColor?.color),
        PaletteSwatch(label: 'Vibrant', color: generator.vibrantColor?.color),
        PaletteSwatch(label: 'Dark Vibrant', color: generator.darkVibrantColor?.color),
        PaletteSwatch(label: 'Light Muted', color: generator.lightMutedColor?.color),
        PaletteSwatch(label: 'Muted', color: generator.mutedColor?.color),
        PaletteSwatch(label: 'Dark Muted', color: generator.darkMutedColor?.color),
      ],
    );
  }
}

/// 带有可选标签的颜色的小正方形。
@immutable
class PaletteSwatch extends StatelessWidget {
  /// 创建 PaletteSwatch.
  ///
  /// 如果省略了[color]参数，则样例将显示一个占位符，表示没有颜色。
  const PaletteSwatch({
    Key key,
    this.color,
    this.label,
  }) : super(key: key);

  /// 样本的颜色。可能为空。
  final Color color;

  /// 要显示在样例旁边的可选标签。
  final String label;

  @override
  Widget build(BuildContext context) {
    // 计算色样和背景色的“距离”，这样我们就可以在那些太接近背景饱和度和亮度的色样周围加上一个边框。为了比较我们忽略了色调。
    final HSLColor hslColor = HSLColor.fromColor(color ?? Colors.transparent);
    final HSLColor backgroundAsHsl = HSLColor.fromColor(_kBackgroundColor);
    final double colorDistance = math.sqrt(
        math.pow(hslColor.saturation - backgroundAsHsl.saturation, 2.0) +
            math.pow(hslColor.lightness - backgroundAsHsl.lightness, 2.0));

    Widget swatch = Padding(
      padding: const EdgeInsets.all(2.0),
      child: color == null
          ? const Placeholder(
              fallbackWidth: 34.0,
              fallbackHeight: 20.0,
              color: Color(0xff404040),
              strokeWidth: 2.0,
            )
          : Container(
              decoration: BoxDecoration(
                  color: color,
                  border: Border.all(
                    width: 1.0,
                    color: _kPlaceholderColor,
                    style: colorDistance < 0.2
                        ? BorderStyle.solid
                        : BorderStyle.none,
                  )),
              width: 34.0,
              height: 20.0,
            ),
    );

    if (label != null) {
      swatch = ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 130.0, minWidth: 130.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            swatch,
            Container(width: 5.0),
            Text(label),
          ],
        ),
      );
    }
    return swatch;
  }
}
