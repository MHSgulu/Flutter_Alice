import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_view/photo_view.dart';


///一个小部件，将其子级标记为[英雄动画]的候选者（https://flutter.dev/docs/development/ui/animations/hero-animations）。
///
///用[导航器]按下或弹出[PageRoute]时，将替换整个屏幕的内容。旧路线消失，新路线出现。
///如果两条路线上都有一个共同的视觉功能，那么有助于使用户定位该功能，以便在路线过渡期间从一页物理移动到另一页。
///这样的动画称为“英雄动画”。
///过渡期间，英雄小部件在导航器的叠加层中“飞行”，并且在飞行过程中默认情况下，它们不会在新旧路线的原始位置中显示。
///
///要将小部件标记为此类功能，请将其包装在[Hero]小部件中。
///导航发生时，每个路线上的[Hero]小部件由[HeroController]标识。
///对于具有相同标签的每对[Hero]小部件，都会触发英雄动画。
///
///如果导航时[英雄]已经在飞行中，则其飞行动画将重定向到其新的目的地。
///默认情况下，转换期间在运行中显示的小部件是目标路线的[Hero]的子级。
///
///要触发英雄动画，英雄必须存在于新页面动画的第一帧中。
///
///每个[tag]的路由不得包含多个[Hero]。
///
/// {@youtube 560315 https://www.youtube.com/watch?v=Be9UH1kXFDw}
///
/// ##讨论
///
///必须使Heroes和[Navigator]的[Overlay] [Stack]对齐，才能使所有这些工作。
///每个动画英雄的左上角和右下角坐标将转换为全局坐标，然后从那里转换为该[Stack]的坐标空间，
///并且在动画期间，整个Hero子树将被移出它的原始位置，并位于该堆栈上。如果[Hero]未对齐，则将以相当难看的方式失败。
///不要旋转英雄！
///
///为使动画看起来不错，至关重要的是，两个位置上的英雄的小部件树必须基本相同。
///默认情况下，* target *的小部件用于进行转换：从路线A到路线B时，路线B的英雄小部件放置在路线A的英雄小部件上。
///如果提供了[flightShuttleBuilder]，则会在飞行过渡期间显示其输出窗口小部件
///默认情况下，当过渡小部件在2条路线上方进行飞行动画时，路线A和路线B的英雄均处于隐藏状态。
///一旦转换开始，[placeholderBuilder]可用于在其位置显示自定义窗口小部件。
///
///在过渡期间，将对过渡小部件进行动画处理，以路由B的英雄位置，然后将该小部件插入到路线B中。
///从B返回到A时，默认情况下，将路线A的英雄小部件放置在路线B的位置上英雄的小部件是，然后动画进行另一种方式。
///
/// ###嵌套导航器
///
///如果两个路由中的一个或两个都包含嵌套的[Navigator]，则仅考虑嵌套的这些[Navigator] *中最顶层路由（由[Route.isCurrent]定义）中包含的[Hero]动画。
///就像在非嵌套情况下一样，嵌套[Navigator]中包含这些[Hero]的最上面的路由也必须是[PageRoute]。
///
/// ##英雄过渡的部分
///
///！[带有Hero过渡部分的图。]（https://flutter.github.io/assets-for-api docs / assets / interaction / heroes.png）


class PhotoViewSingle extends StatelessWidget {
  const PhotoViewSingle({
    this.img, //图片
    this.loadingBuilder, //加载时的widget
    this.backgroundDecoration, //背景修饰
    this.minScale, //最小缩放倍数
    this.maxScale, //最大缩放倍数
    this.heroTag, //hero动画tagid
  });
  final String img;
  final LoadingBuilder loadingBuilder;
  final Decoration backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height,
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              bottom: 0,
              right: 0,
              child: PhotoView(
                imageProvider: NetworkImage(img),
                loadingBuilder: (context, event) => Center(
                  child: CircularProgressIndicator(
                    value: event == null
                        ? 0
                        : event.cumulativeBytesLoaded /
                            event.expectedTotalBytes,
                  ),
                ),
                backgroundDecoration: backgroundDecoration,
                minScale: minScale,
                maxScale: maxScale,
                heroAttributes: PhotoViewHeroAttributes(tag: heroTag),
                enableRotation: false,
                ///启用旋转手势支持的标志
              ),
            ),
            Positioned(
              //右上角关闭按钮
              right: 10,
              top: MediaQuery.of(context).padding.top,
              child: IconButton(
                icon: Icon(
                  Icons.close_rounded,
                  size: 30,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            Positioned(
              //右下角下载按钮
              right: 10,
              bottom: MediaQuery.of(context).padding.bottom,
              child: IconButton(
                icon: Icon(
                  Icons.download_rounded,
                  size: 30,
                  color: Colors.white,
                ),
                onPressed: () {
                  checkPermissions();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void checkPermissions() async {
    var status = await Permission.storage.status;
    //如果之前从未申请过许可。
    if (status.isUndetermined) {
      Permission.storage.request();
    } else if (status.isGranted) {
      //如果用户授予对请求的功能的访问权。
      downloadPicture();
    } else if (status.isDenied) {
      //如果用户拒绝访问请求的功能。
      Permission.storage.request();
      Fluttertoast.showToast(msg: '我们需要您授权该权限，才能下载该图片保存到手机图库中');
    } else if (status.isRestricted || status.isPermanentlyDenied) {
      //如果操作系统拒绝访问请求的功能。用户无法更改此应用的状态，可能是由于家长等活动限制
      //如果用户拒绝访问请求的功能，并选择不再显示对此权限的请求。用户仍可以更改设置中的权限状态。
      openAppSettings();
      Fluttertoast.showToast(msg: '访问权限受到限制或永久拒绝，请前往设置界面手动打开读写手机存储权限');
    }
  }

  void downloadPicture() async{
    var time = DateTime.now().millisecondsSinceEpoch;

    var response = await Dio().get(
      img,
      options: Options(responseType: ResponseType.bytes),
    );
    final result = await ImageGallerySaver.saveImage(
      Uint8List.fromList(response.data),
      quality: 100,
      name: "picture_$time",
    );
    print('数据点位： 图片地址： $result');
    Fluttertoast.showToast(msg: '图片已保存到相册中');
  }
}
