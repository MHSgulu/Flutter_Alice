import 'dart:ui';

import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';

//使用ImageFilter类和BackdropFilter微件将效果应用于Flutter应用程序支持的图像！
// {@youtube 560 315 https://www.youtube.com/watch?v=dYRs7Q1vfYI}

/// BackdropFilter
///
///一个小部件，将过滤器应用于现有的绘制内容，然后绘制[child]。
///
///过滤器将应用于其父级或祖先窗口小部件剪辑内的所有区域。
///如果没有剪辑，则滤镜将应用于全屏。
///
///这种效果相对昂贵，尤其是在滤镜不是本地滤镜（例如模糊）的情况下。
///
/// 也可以看看：
///
/// * [DecoratedBox]，它在小部件下方（或上方）绘制背景。
/// * [Opacity]，它会更改小部件本身的不透明度。

/// ImageFilter
///
///应用于栅格图像的过滤操作。
///
/// 也可以看看：
///
/// * [BackdropFilter]，将[ImageFilter]应用于其呈现的小部件。
/// * [ImageFiltered]，将[ImageFilter]应用于其子级的小部件。
/// * [SceneBuilder.pushBackdropFilter]，这是将此类用作背景过滤器的低级API。
/// * [SceneBuilder.pushImageFilter]，这是将此类用作子层过滤器的低级API。

class BackdropFilterDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
          label: 'BackdropFilter',
          onPressedBack: () => Navigator.pop(context),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => BackdropFilterDemo1())),
                child: Text('演示1'),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => BackdropFilterDemo2())),
                child: Text('演示2'),
              ),
            ),
          ],
        ));
  }
}

class BackdropFilterDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
          label: 'BackdropFilter',
          onPressedBack: () => Navigator.pop(context),
        ),
        //如果需要将BackdropFilter应用于与其子项完全匹配的区域，请使用完全裁剪到该子项的clip小部件包装BackdropFilter。
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Text('0' * 10000),
            Center(
              child: ClipRect(  // <-剪辑到下面的200x200 [Container]
                ///创建一个背景滤镜。
                /// [filter]参数不能为null。
                child: BackdropFilter(
                  //创建一个应用高斯模糊的图像滤镜。
                  filter: ImageFilter.blur(
                    sigmaX: 5.0,
                    sigmaY: 5.0,
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    width: 200.0,
                    height: 200.0,
                    child: Text('Hello World'),
                  ),
                ),
              ),
            ),
          ],
        ),
    );
  }
}

class BackdropFilterDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'BackdropFilter',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset('assets/images/bg_alice.png'),
          Positioned.fill(
            child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5.0,
              sigmaY: 5.0,
            ),
            child: Container(
              alignment: Alignment.center,
              child: Text('高斯模糊'),
            ),
          ),
          ),
        ],
      ),
    );
  }
}
