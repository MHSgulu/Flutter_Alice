import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_view/photo_view.dart';

class PhotoSingleView extends StatelessWidget {
  const PhotoSingleView({
    @required this.imgUrl, //图像的URL
    this.loadingBuilder, //加载时的widget
    this.backgroundDecoration, //背景修饰
    this.minScale, //最小缩放倍数
    this.maxScale, //最大缩放倍数
    this.heroTag, //hero动画tag
  });
  final String imgUrl;
  final LoadingBuilder loadingBuilder;
  final Decoration backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;
  final Object heroTag;

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
                imageProvider: NetworkImage(imgUrl), //当[imageProvider]无法解析时，[PhotoView]会调用[loadingBuilder]进入屏幕，默认情况下它是居中的[CircularProgressIndicator]
                loadingBuilder: (context, event) => Center(
                  child: CircularProgressIndicator(
                    value: event == null
                        ? 0
                        : event.cumulativeBytesLoaded /
                            event.expectedTotalBytes,
                  ),
                ),
                loadFailedChild: Center(
                  child: Image.asset('assets/images/image_failed_load.png'),
                ), //当图像加载失败时显示loadFailedChild
                //backgroundDecoration: backgroundDecoration,
                //定义允许图像采用的最小尺寸，它与原始图像尺寸成比例。 可以是双精度（绝对值）或可以乘以双精度的[PhotoViewComputedScale]  PhotoViewComputedScale.contained * 0.8,
                minScale: minScale ?? 0.2,
                //定义允许使用的最大图像尺寸，它与原始图像尺寸成比例。 可以是双精度（绝对值）或可以乘以双精度的[PhotoViewComputedScale]  PhotoViewComputedScale.covered * 1.1,
                maxScale: maxScale ?? 1.0,
                heroAttributes: heroTag == null ? PhotoViewHeroAttributes(tag: '') : PhotoViewHeroAttributes(tag: heroTag),
                enableRotation: false, //是否启用旋转手势支持
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
                onPressed: () => checkPermissions(),
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

  void downloadPicture() async {
    var time = DateTime.now().millisecondsSinceEpoch;

    var response = await Dio().get(
      imgUrl,
      options: Options(responseType: ResponseType.bytes),
    );
    final result = await ImageGallerySaver.saveImage(
      Uint8List.fromList(response.data),
      quality: 100,
      name: "$time",
    );
    if(result['isSuccess']){
      print('图片地址：${result['filePath']}');
      Fluttertoast.showToast(msg: '图片已保存到相册中');
    }else{
      print('错误信息：${result['errorMessage']}');
      Fluttertoast.showToast(msg: '图片保存失败');
    }
  }
}
