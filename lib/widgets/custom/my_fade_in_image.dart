import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class MyFadeInImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final BoxFit fit;

  const MyFadeInImage({
    Key key,
    @required this.imageUrl,
    @required this.width,
    @required this.height,
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
            width: width,
            height: height,
            fit: fit ?? BoxFit.cover,
          ),
        );
      },
      width: width,
      height: height,
      fit: fit ?? BoxFit.cover,
    );
  }
}
