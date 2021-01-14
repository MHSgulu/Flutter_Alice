import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

/// 淡入效果的图片展示
class MyFadeInImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final BoxFit fit;

  const MyFadeInImage({
    Key key,
    @required this.imageUrl,
    this.width,
    this.height,
    this.fit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      placeholder: MemoryImage(kTransparentImage),
      image: NetworkImage(imageUrl),
      imageErrorBuilder: (
        BuildContext context,
        Object error,
        StackTrace stackTrace,
      ) {
        print('图片加载故障点位: error: ${error.toString()}');
        print('图片加载故障点位: stackTrace: ${stackTrace.toString()}');
        return Center(
          child: Image.asset(
            'assets/images/image_failed_load.png',
            //如果非空，则要求图像具有此宽度。
            //如果为null，则图像将选择最能保留其固有纵横比的尺寸。
            //强烈建议同时指定[width]和[height]，或者将小部件放置在设置严格布局约束的上下文中，以使图像在加载时不会改变大小。
            //如果事先不知道确切的图像尺寸，请考虑使用[fit]来调整图像的渲染以适合给定的宽度和高度。
            width: width,
            height: height,
            fit: fit ?? BoxFit.cover,
            //alignment: Alignment.centerRight,
          ),
        );
      },
      //如果非空，则要求图像具有此宽度。
      //如果为null，则图像将选择最能保留其固有纵横比的尺寸。
      // 如果占位符图像的大小与目标图像的大小不匹配，则可能会导致突然的更改。
      //大小也受比例因子的影响。
      width: width,
      height: height,
      fit: fit ?? BoxFit.cover,
    );
  }
}
