import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CupertinoDatePickerExample extends StatefulWidget {
  @override
  _CupertinoDatePickerExampleState createState() =>
      _CupertinoDatePickerExampleState();
}

class _CupertinoDatePickerExampleState
    extends State<CupertinoDatePickerExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: '库比蒂诺日期选择器',
        onPressedBack: () {
          Navigator.pop(context);
        },
      ),
      body: Center(
        child: CupertinoButton(
          child: Text('CupertinoDatePicker'),
          onPressed: () => showBottom(),
        ),
      ),
    );
  }

  void showBottom() {
    /**
        显示从屏幕底部向上滑动的模态iOS样式弹出窗口。
        这样的弹出窗口是菜单或对话框的替代，并阻止用户与应用程序的其余部分进行交互。
        该context参数用于在导航器中查找弹出窗口。仅在调用该方法时使用。在关闭弹出窗口之前，可以将其相应的窗口小部件安全地从树中删除。
        该useRootNavigator参数用于确定是否将弹出窗口推到离给定距离最近或最远的导航器context。这是false默认。
        该自semanticsDismissible变量用于确定模式障碍的语义是否包括在语义树中。
        该builder参数通常会构建CupertinoActionSheet小部件。小部件下方的内容通过ModalBarrier变暗。
        由构建的窗口小部件builder与showCupertinoModalPopup最初调用的位置不共享上下文 。
        如果窗口小部件需要动态更新，请使用 StatefulBuilder或自定义的StatefulWidget。
        返回一个Future，解析为关闭弹出窗口时传递给Navigator.pop的值 。
     */
    showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return Container(
            height: 200,
            /**
             * iOS风格的日期选择器小部件。
                CupertinoDatePickerMode中列出了日期选择器的几种模式。
                该班级将其子级显示为连续的列。它的子级顺序基于国际化。
                日期模式下的选择器示例：
                美国英语： | July | 13 | 2012 |
                越南文： | 13 | Tháng 7 | 2012 |
                可以与showCupertinoModalPopup一起使用，以在屏幕底部模态显示选择器。
                调整自身大小为其父级，如果未提供完整的屏幕宽度，则可能无法正确呈现。内容文本使用 CupertinoTextThemeData.dateTimePickerTextStyle显示。
                也可以看看：
                CupertinoTimerPicker，该类实现iOS样式的计时器选择器。
                CupertinoPicker，该类实现与内容无关的Spinner UI。
             */
            child: CupertinoDatePicker(
              onDateTimeChanged: (value) {
                Fluttertoast.showToast(msg: '$value');
              },
              backgroundColor: Colors.white,
            ),
          );
        });
  }


}
