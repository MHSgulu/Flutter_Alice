import 'package:flutter/material.dart';


/// 自定义 圆角矩形卡片 适用于处理圆角矩形卡片图片
class MyRRectCard extends StatelessWidget {
  final Clip clipBehavior;
  final double radius;
  final Widget child;

  const MyRRectCard({
    Key key,
    this.clipBehavior,
    this.radius,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: clipBehavior ?? Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius ?? 4.0),
      ),
      child: child,
    );
  }
}
