import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';

// 滑块沿着条形图反映一系列值，用户可以从中选择一个值。它们是调整设置（例如音量，亮度或应用图像滤镜）的理想选择。
//滑块的条形两端可以具有反映一定范围值的图标。
// 一只拇指的滑块称为单点滑块，而两只拇指的滑块称为范围滑块。

//连续滑块允许用户进行不需要特定值的有意义的选择。
//离散滑块在按下拇指时会显示一个数值标签，从而允许用户输入一个精确值。

///材质设计滑块。
///
///用于从一系列值中进行选择。
///
///！[一个滑块小部件，由5个部分组成，并显示默认值指示符。]
///
///滑块值是有状态小部件子类的一部分，用于更改setState被调用的值。
///
///滑块可用于从一组连续值或一组离散值中进行选择。默认值是使用从[最小]到[最大]的连续范围的值。
///要使用离散值，请对[divings]使用非空值，该值指示离散间隔的数量。
///例如，如果[min]为0.0，[max]为50.0，[divings]为5，则滑块可以采用离散值0.0、10.0、20.0、30.0、40.0和50.0。
///
///滑块各部分的术语为：
///
/// *“拇指”，它是用户拖动时水平滑动的形状。
/// *“轨道”，是滑块的滑动方向。
/// *“值指示器”，当用户拖动拇指以指示所选值时弹出的形状。
/// *滑块的“活动”侧是拇指和最小值之间的一侧。
/// *滑块的“非活动”侧是拇指和最大值之间的一侧。
///
///如果[onChanged]为空或[min] .. [max]给定的范围为空（即[min]等于[max]），则将禁用滑块。
///
///滑块小部件本身不保持任何状态。
///相反，当滑块的状态更改时，窗口小部件将调用[onChanged]回调。
///大多数使用滑块的小部件都会侦听[onChanged]回调，并使用新的[value]重建滑块以更新滑块的外观。
///要知道该值何时开始更改或何时完成更改，请设置可选的回调[onChangeStart]和/或[onChangeEnd]。
///
///默认情况下，滑块会在垂直居中的情况下尽可能宽。
///当给出无限制的约束时，它将尝试使轨道宽144像素（每边都有空白），并将垂直收缩包装。
///
///要求其祖先之一是[Material]小部件。
///
///要求其祖先之一是[MediaQuery]小部件。
///通常，这些是由应用程序小部件树顶部的[MaterialApp]或[WidgetsApp]小部件引入的。
///
///为了确定其显示方式（例如颜色，拇指形状等），滑块使用[SliderTheme]小部件或上方的[ThemeData.sliderTheme] [Theme]小部件中的[SliderThemeData]在小部件树中。
///您也可以使用[activeColor]和[inactiveColor]属性来覆盖某些颜色，尽管使用[SliderThemeData]可以实现外观的更细粒度控制。
///
/// 也可以看看：
///
/// * [SliderTheme]和[SliderThemeData]提供有关控制滑块的视觉外观的信息。
/// * [Radio]，用于在一组显式值之间进行选择。
/// * [复选框]和[开关]，用于打开或关闭特定值。
/// * <https://material.io/design/components/sliders.html>
/// * [MediaQuery]，可从中获取文本比例因子。
///

///创建一个“材料设计”滑块。
///
///滑块本身不保持任何状态。相反，当滑块的状态更改时，窗口小部件将调用[onChanged]回调。大
///多数使用滑块的小部件都会侦听[onChanged]回调，并使用新的[value]重建滑块以更新视觉效果。滑块的外观。
///
/// * [value]确定此滑块当前选择的值。
/// * [onChanged]在用户为滑块选择新值时被调用。
/// *当用户开始为滑块选择新值时，将调用[onChangeStart]。
/// *当用户完成为滑块选择新值时，将调用[onChangeEnd]。
///
///您可以使用[activeColor]和[inactiveColor]属性，尽管可以更精细地控制使用[SliderThemeData]实现外观。

class MaterialSlider extends StatefulWidget {
  @override
  _MaterialSliderState createState() => _MaterialSliderState();
}

class _MaterialSliderState extends State<MaterialSlider> {
  double _sliderValue = 20;
  RangeValues _rangeSliderDiscreteValues = RangeValues(40, 80);
  double _sliderDiscreteValue = 20;
  RangeValues _rangeSliderDiscreteValues2 = RangeValues(40, 80);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: '滑杆',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('连续单点滑块示例'),
          Slider(
            value: _sliderValue,
            min: 0,
            max: 100,
            label: _sliderValue.round().toString(),
            onChanged: (value) {
              setState(() {
                _sliderValue = value;
              });
            },
          ),
          SizedBox(
            height: 20,
          ),
          Text('连续范围滑块示例'),
          RangeSlider(
            values: _rangeSliderDiscreteValues,
            min: 0,
            max: 100,
            labels: RangeLabels(
              _rangeSliderDiscreteValues.start.round().toString(),
              _rangeSliderDiscreteValues.end.round().toString(),
            ),
            onChanged: (values) {
              setState(() {
                _rangeSliderDiscreteValues = values;
              });
            },
          ),
          SizedBox(
            height: 40,
          ),
          Text('离散单点滑块示例'),
          Slider(
            value: _sliderDiscreteValue,
            min: 0,
            max: 100,
            divisions: 5,
            label: _sliderDiscreteValue.round().toString(),
            onChanged: (value) {
              setState(() {
                _sliderDiscreteValue = value;
              });
            },
          ),
          SizedBox(
            height: 20,
          ),
          Text('离散范围滑块示例'),
          RangeSlider(
            values: _rangeSliderDiscreteValues2,
            min: 0,
            max: 100,
            divisions: 5,
            labels: RangeLabels(
              _rangeSliderDiscreteValues2.start.round().toString(),
              _rangeSliderDiscreteValues2.end.round().toString(),
            ),
            onChanged: (values) {
              setState(() {
                _rangeSliderDiscreteValues2 = values;
              });
            },
          ),
        ],
      ),
    );
  }
}
