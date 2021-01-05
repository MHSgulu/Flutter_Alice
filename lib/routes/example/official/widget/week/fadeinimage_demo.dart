import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

//为避免图像在加载时弹出到屏幕上的刺眼效果，请尝试使用FadeInImage！
// 您可以指定本地占位符图像并设置高度和宽度参数，以确定图像加载后应占用的空间大小。
/// {@youtube 560 315 https://www.youtube.com/watch?v=pK738Pg9cxc}

///加载目标[image]时显示[placeholder]图像的图像，然后在加载新图像时淡入。
///
///使用此类显示长时间加载的图像，例如[new NetworkImage]，以便图像以优美的动画显示在屏幕上，而不是突然弹出到屏幕上。
///如果[image]同步发出[ImageInfo]，例如当图像已加载和缓存时，[image]将立即显示，而[placeholder]则不会显示。
///
/// [fadeOutDuration]和[fadeOutCurve]属性控制[占位符]的淡出动画。
///
/// [fadeInDuration]和[fadeInCurve]属性控制目标[image]的淡入动画。
///
///首选已缓存的[占位符]，以便立即显示。这样可以防止它弹出到屏幕上。
///当[image]更改时，它将解析为新的[ImageStream]。
/// 如果新的[ImageStream.key]不同，则此小部件将订阅新的流，并将显示的图像替换为新流发出的图像。
///
///当[占位符]更改并且[图像]尚未发出[ImageInfo]，然后将[placeholder]解析为新的[ImageStream]。
///如果新的[ImageStream.key]不同，则此小部件将订阅新的流，并将显示的图像替换为新流发出的图像。
///
///当[占位符]或[图像]发生更改时，此小部件将继续显示以前加载的图像（如果有），直到新的图像提供程序提供了不同的图像为止。
///这称为“无间隙播放”（另请参阅[Image.gaplessPlayback]）。

class FadeInImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'FadeInImage',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => FadeInImageDemo1()));
              },
              child: Text('FadeInImage'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => FadeInImageDemo2()));
              },
              child: Text('FadeInImage.assetNetwork'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => FadeInImageDemo3()));
              },
              child: Text('FadeInImage.memoryNetwork'),
            ),
          ),
        ],
      ),
    );
  }
}

class FadeInImageDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'FadeInImage',
        onPressedBack: () => Navigator.pop(context),
      ),
      ///创建一个在加载[图像]时显示[占位符]的小部件，然后淡出占位符并淡入图像。
      /// [placeholder]和[image]可以在[ResizeImage]中组成，以提供自定义的解码/缓存大小。
      /// [占位符]，[图像]，[fadeOutDuration]，[fadeOutCurve] [fadeInDuration]，[fadeInCurve]，[alignment]，[repeat]和[matchTextDirection]参数不能为空。
      ///如果[excludeFromSemantics]为true，则将忽略[imageSemanticLabel]。
      body: FadeInImage(
        //这里的“ bytes”是一个Uint8List，其中包含内存映像的字节
        placeholder: MemoryImage(/*bytes*/ kTransparentImage),
        image: NetworkImage('https://icweiliimg6.pstatp.com/weili/l/429876877287489570.webp'),
      ),
    );
  }
}


///创建一个小部件，该小部件使用从资产捆绑包中存储的占位符图像，同时从网络加载最终图像。
///
///“占位符”参数是资产束中图像的键。
///
///`image`参数是最终图像的URL。
///
///将`placeholderScale`和`imageScale`参数传递给它们各自的[ImageProvider]（另请参见[ImageInfo.scale]）。
///
///如果`placeholderScale`被省略或为null，则将尝试对[placeholder]图像进行像素密度感知的资产解析。否则，将使用指定的确切资产。
///
///如果提供了[placeholderCacheWidth]，[placeholderCacheHeight]，[imageCacheWidth]或[imageCacheHeight]，则向引擎指示应以指定的大小解码相应的图像。
///不管这些参数如何，图像都将按照布局或[width]和[height]的约束进行渲染。这些参数主要用于减少[ImageCache]的内存使用量。
///
/// [placeholder]，[image]，[imageScale]，[fadeOutDuration]，[fadeOutCurve]，[fadeInDuration]，[fadeInCurve]，[alignment]，[repeat]和[matchTextDirection]参​​数不能为空。
///
/// 也可以看看：
///
/// * [new Image.asset]，其中包含有关从资产束中加载图像的更多详细信息。
/// * [new Image.network]，其中包含有关从网络加载图像的更多详细信息。

class FadeInImageDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'FadeInImage',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: FadeInImage.assetNetwork(
        placeholder: 'assets/images/loading2.gif',
        image: 'https://weiliicimg9.pstatp.com/weili/l/919768749733445706.webp',
      ),
    );
  }
}


///创建一个小部件，该小部件使用存储在内存中的占位符图像，同时从网络加载最终图像。
///
///“占位符”参数包含内存中图像的字节。
///
///`image`参数是最终图像的URL。
///
///将`placeholderScale`和`imageScale`参数传递给它们各自的[ImageProvider]（另请参见[ImageInfo.scale]）。
///
///如果提供了[placeholderCacheWidth]，[placeholderCacheHeight]，[imageCacheWidth]或[imageCacheHeight]，则向引擎指示应以指定的大小解码相应的图像。
///不管这些参数如何，图像都将按照布局或[width]和[height]的约束进行渲染。这些参数主要用于减少[ImageCache]的内存使用量。
///
/// [placeholder]，[image]，[placeholderScale]，[imageScale]，[fadeOutDuration]，[fadeOutCurve]，[fadeInDuration]，[fadeInCurve]，[alignment]，[repeat]和[matchTextDirection]参​​数必须不可以为null。
///
/// 也可以看看：
///
/// * [new Image.memory]，其中包含有关从内存加载图像的更多详细信息。
/// * [new Image.network]，其中包含有关从网络加载图像的更多详细信息。

class FadeInImageDemo3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'FadeInImage',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image: 'https://weiliicimg9.pstatp.com/weili/l/903487834380173423.webp',
      ),
    );
  }
}
