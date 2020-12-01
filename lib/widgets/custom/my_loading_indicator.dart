import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


///小部件的前景色（旋钮，文本，过度滚动边缘效果等）。
/// 强调色也称为辅助色。
/// 主题的[colorScheme]属性包含[ColorScheme.secondary]，以及与第二种颜色[ColorScheme.onSecondary]形成鲜明对比的颜色。 仅根据主题的[colorScheme]配置应用程序的视觉效果可能会更简单。
///
/// Theme.of(context).accentColor

class MyLoadingIndicator extends StatefulWidget{
  final String platform;
  final Color valueColor;
  final double strokeWidth;

  const MyLoadingIndicator({Key key, this.platform, this.valueColor, this.strokeWidth}) : super(key: key);

  @override
  _MyLoadingIndicatorState createState() => _MyLoadingIndicatorState();
}

class _MyLoadingIndicatorState extends State<MyLoadingIndicator> {
  @override
  Widget build(BuildContext context) {
    if(widget.platform != null){
      switch(widget.platform){
        case 'android':
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(widget.valueColor ?? Theme.of(context).accentColor),
              strokeWidth: widget.strokeWidth ?? 4.0,
            ),
          );
          break;
        case 'iOS':
          return Center(
            child: CupertinoActivityIndicator(),
          );
          break;
      }
    }else{
      switch(defaultTargetPlatform){
        case TargetPlatform.android:
          return Center(
            child: CircularProgressIndicator(
              ///如果不为空，则此进度指示器的值。
              ///值0.0表示没有进度，而值1.0表示进度已完成。
              ///如果为null，则此进度指示器不确定，这意味着该指示器显示预定的动画，该动画不指示正在执行多少实际进度。
              //value: 0.0,
              ///进度指示器背景颜色。默认情况下，当前主题为[ThemeData.backgroundColor]。
              //backgroundColor: widget.valueColor ?? ThemeData.backgroundColor,
              ///进度指示器的颜色为动画值。
              ///要指定恒定的颜色，请使用：AlwaysStoppedAnimation <Color>（color）`。
              ///如果为null，则进度指示器将使用当前主题的[ThemeData.accentColor]呈现。
              valueColor: AlwaysStoppedAnimation<Color>(widget.valueColor ?? Colors.lightBlueAccent),
              ///用于画圆的线的宽度。
              strokeWidth: widget.strokeWidth ?? 3.0,
              ///此值指示进度条的用途，屏幕阅读器将读出该值以指示此进度指示器的用途。
              //semanticsLabel: widget.semanticsLabel ?? '加载指示器',
              ///通过屏幕阅读软件，它将与[semanticsLabel]结合使用以标识小部件，并且主要用于确定进度指示器以宣布其进展情况。
              ///对于确定的进度指示器，默认为[ProgressIndicator.value]，以百分比表示，即“ 0.1”将变为“ 10％”。
              //semanticsValue: widget.semanticsValue ?? '0.1',
            ),
          );
          break;
        case TargetPlatform.iOS:
          return Center(
            ///创建一个iOS风格的活动指示器，该指示器顺时针旋转。
            child: CupertinoActivityIndicator(
              ///活动指示器是否正在运行其动画。 默认为true。
              animating: true,
              ///微调小部件的半径，默认为10像素。 必须为正，不能为null。
              radius: 10.0,
            ),
          );
          break;
        case TargetPlatform.fuchsia:
          return Container();
          break;
        case TargetPlatform.linux:
          return Container();
          break;
        case TargetPlatform.macOS:
          return Container();
          break;
        case TargetPlatform.windows:
          return Container();
          break;
      }
    }
    return null;
  }
}