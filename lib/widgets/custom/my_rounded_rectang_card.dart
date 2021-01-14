import 'package:flutter/material.dart';


/// 自定义 圆角矩形卡片 适用于处理圆角矩形卡片图片
class MyRRectCard extends StatelessWidget {
  final Clip clipBehavior;
  final double radius;
  final double elevation;
  final Widget child;

  const MyRRectCard({
    Key key,
    this.clipBehavior,
    this.radius,
    this.elevation,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation ?? 1.0,
      clipBehavior: clipBehavior ?? Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius ?? 4.0),
      ),
      child: child,
    );
  }
}
