import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';

//如果你想让一个微件在屏幕中不可见，且原来的页面布局保持不变？那就请试一试我们的Opacity微件吧！
// 你只要设置一个透明度的数值，它就能让你的子褪色以便匹配。
// 你也可以用它来混合不同子部件，或是用AnimatedOpacity来创建动画
// {@youtube 560315 https://www.youtube.com/watch?v=9hltevOHQBw}


///使其子级部分透明的小部件。
///
///此类将其子级绘制到中间缓冲区中，然后将子级重新混合到部分透明的场景中。
///
///对于0.0和1.0以外的不透明度值，此类相对昂贵，因为它需要将子级绘制到中间缓冲区中。
///对于值0.0，根本不绘制子级。对于值1.0，将立即绘制没有中间缓冲区的子对象。
///
/// 比按需从树中添加和删除子窗口小部件效率更高。
///
/// ##不透明度动画的性能注意事项
///
/// 对[Opacity]小部件进行动画处理直接导致该小部件（可能还有其子树）重建每个帧，这不是很有效。考虑改用[AnimatedOpacity]。
///
/// ##透明图像
///
/// 如果仅需要将[图像]或[颜色]的不透明度在0.0到1.0之间进行合成，则无需[不透明度]小部件就可以直接使用它们，这要快得多。
///
/// 例如，“ Container（color：Color.fromRGBO（255，0，0，0.5））”比“ Opacity（opacity：0.5，child：Container（color：Colors.red））”要快得多。
///
/// 直接用不透明性绘制[图像]或[颜色]比在其上使用[不透明性]更快，因为[不透明性]可以将不透明性应用于一组小部件，因此将使用昂贵的屏幕外缓冲区。
/// 将内容绘制到屏幕外缓冲区中也可能会触发渲染目标切换，并且这种切换在较旧的GPU中特别慢。
///
/// 也可以看看：
///
/// * [Visibility]，它可以更有效地隐藏子对象（尽管隐含性较低，因为它是可见的或隐藏的，而不是允许部分不透明度值）。
/// * [ShaderMask]，可以对其子级应用更精细的效果。
/// * [Transform]，它在绘制时对其子控件进行任意变换。
/// * [AnimatedOpacity]，它在内部使用动画来有效地对不透明度进行动画处理。
/// * [FadeTransition]，它使用提供的动画有效地对不透明度进行动画处理。
/// * [Image]，它可以直接提供部分透明的图像，而对性能的影响要小得多。



///创建一个小部件，使其子级部分透明。
///
/// [opacity]参数不能为null，且必须在0.0到1.0（含）之间。

class OpacityDemo extends StatefulWidget{
  @override
  _OpacityDemoState createState() => _OpacityDemoState();
}

class _OpacityDemoState extends State<OpacityDemo> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'Opacity',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: Column(
        children: [
          ///此示例在_visible成员字段为true时显示一些[Text]，在为false时将其隐藏：
          GestureDetector(
            onTap: (){
              setState(() {
                _visible = ! _visible;
              });
            },
            child: Container(
              color: Colors.cyan,
              child: Center(
                child: Opacity(
                  opacity: _visible ? 1.0 : 0.0,
                  child: const Text("现在你看到我了，现在你没有了！"),
                ),
              ),
            ),
          ),
          ///以下示例在不使用[不透明度]的情况下绘制了具有0.5透明度的[Image]
          Image.network(
              'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2844699124,1559327949&fm=26&gp=0.jpg',
              color: Color.fromRGBO(255, 255, 255, 0.5),
              colorBlendMode: BlendMode.modulate,
          ),
        ],
      ),
    );
  }
}