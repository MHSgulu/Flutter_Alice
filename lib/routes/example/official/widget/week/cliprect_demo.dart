import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';

//对于那些你希望你可以在应用程序中的方块内容上有圆角的时候，有ClipRRect（额外的R实际上代表圆形）！
// 用剪刀包裹你的小部件，设置半径，剩下的就完成了！ 您甚至可以自定义外观并尝试使用类似小部件的不同形状。
/// {@youtube 560 315 https://www.youtube.com/watch?v=eI43jkQkrvs}

/// ClipRRect
///
///一个小部件，它使用圆角矩形裁剪其子级。
///
///默认情况下，[ClipRRect]使用其自身的边界作为剪辑的基本矩形，但是可以使用自定义的[clipper]自定义剪辑的大小和位置。
///
/// 也可以看看：
///
/// * [CustomClipper]，有关创建自定义剪辑的信息。
/// * [ClipRect]，用于没有圆角的更高效剪辑。
/// * [ClipOval]，用于椭圆形剪辑。
/// * [ClipPath]，用于任意形状的剪辑。

/// ClipOval
///
///一个使用椭圆形修剪其子项的小部件。
///
/// {@youtube 560315 https://www.youtube.com/watch?v=vzWWDO6whIM}
///
///默认情况下，将与轴对齐的椭圆形标记到其布局尺寸中，并防止其子代在该椭圆形外部绘画，但是可以使用自定义[clipper]来定制椭圆形的大小和位置。
///
/// 也可以看看：
///
/// * [CustomClipper]，有关创建自定义剪辑的信息。
/// * [ClipRect]，用于没有圆角的更高效剪辑。
/// * [ClipRRect]，用于带有圆角的剪辑。
/// * [ClipPath]，用于任意形状的剪辑。


class ClipRectDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'ClipRect',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Center(child: Text('原始Image')),
            SizedBox(height: 5),
            Image.asset(
              'assets/images/img_daisy.webp',
              width: 300,
            ),
            SizedBox(height: 20),
            Center(child: Text('ClipRect与Align结合使用')),
            Center(child: Text('可以仅显示Image的上半部分')),
            SizedBox(height: 5),
            ClipRect(
              child: Align(
                alignment: Alignment.topCenter,
                heightFactor: 0.5,
                child: Image.asset(
                  'assets/images/img_daisy.webp',
                  width: 300,
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(child: Text('CliRRect')),
            SizedBox(height: 5),
            ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: Image.asset(
                'assets/images/img_daisy.webp',
                width: 300,
              ),
            ),
            SizedBox(height: 20),
            Center(child: Text('ClipOval')),
            SizedBox(height: 5),
            ClipOval(
              child: Image.asset(
                'assets/images/img_daisy.webp',
                width: 300,
              ),
            ),
            SizedBox(height: 20),
            ClipOval(
              ///调节子级大小，长宽等距的椭圆就是圆形
              child: Image.asset(
                'assets/images/img_daisy.webp',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }

}

