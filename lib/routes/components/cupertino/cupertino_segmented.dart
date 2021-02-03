import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoSegmentedControlDemo extends StatefulWidget {
  const CupertinoSegmentedControlDemo();

  @override
  _CupertinoSegmentedControlDemoState createState() =>
      _CupertinoSegmentedControlDemoState();
}

class _CupertinoSegmentedControlDemoState
    extends State<CupertinoSegmentedControlDemo> {
  int currentSegment = 0;

  List<Widget> widgetList = [
    Container(
      height: 300,
      color: Colors.cyanAccent,
    ),
    Container(
      height: 600,
      color: Colors.teal,
    ),
    Container(
      height: 300,
      color: Colors.tealAccent,
    ),
  ];

  void onValueChanged(int newValue) {
    setState(() {
      currentSegment = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    final segmentedControlMaxWidth = 200.0;
    final children = <int, Widget>{
      0: Text('靛青色'),
      1: Text('蓝绿色'),
      2: Text('青色'),
    };

    return Scaffold(
      appBar: MyAppBar(
        label: '分段控件',
        onPressedBack: () => Navigator.pop(context),
      ),

      ///应用于没有显式样式的后代[Text]小部件的文本样式。
      ///
      /// 也可以看看：
      ///
      /// * [AnimatedDefaultTextStyle]，它可以在给定的时间内平滑地对文本样式的更改进行动画处理。
      /// * [DefaultTextStyleTransition]，它使用提供的[Animation]平滑地动画文本样式随时间的变化

      ///为给定的子树创建默认的文本样式。
      ///
      ///考虑使用[DefaultTextStyle.merge]从给定[BuildContext]的当前默认文本样式继承样式信息。
      ///
      /// [style]和[child]参数是必需的，并且不能为null。
      ///
      /// [softWrap]和[overflow]参数不能为null（尽管它们具有默认值）。
      ///
      /// [maxLines]属性可以为null（实际上默认为null），但如果不为null，则必须大于零。
      body: DefaultTextStyle(
        style: CupertinoTheme.of(context)
            .textTheme
            .textStyle
            .copyWith(fontSize: 14),
        child: SafeArea(
          child: ListView(
            children: [
              const SizedBox(height: 16),
              SizedBox(
                width: segmentedControlMaxWidth,
                child: CupertinoSegmentedControl<int>(
                  children: children,
                  onValueChanged: onValueChanged,
                  groupValue: currentSegment,
                ),
              ),
              SizedBox(
                width: segmentedControlMaxWidth,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: CupertinoSlidingSegmentedControl<int>(
                    children: children,
                    onValueChanged: onValueChanged,
                    groupValue: currentSegment,
                  ),
                ),
              ),
              Container(
                child: widgetList[currentSegment],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
