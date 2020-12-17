import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class CupertinoPickerDemo extends StatefulWidget {
  const CupertinoPickerDemo();

  @override
  _CupertinoPickerDemoState createState() => _CupertinoPickerDemoState();
}

class _CupertinoPickerDemoState extends State<CupertinoPickerDemo> {
  Duration timer = const Duration();

  // 在日期模式下日期选择器中显示的值。
  DateTime date = DateTime.now();

  // 在时间模式下日期选择器中显示的值。
  DateTime time = DateTime.now();

  // 在dateAndTime模式下的日期选择器中显示的值。
  DateTime dateTime = DateTime.now();

  void _showDemoPicker({
    @required BuildContext context,
    @required Widget child,
  }) {
    final themeData = CupertinoTheme.of(context);
    final dialogBody = CupertinoTheme(
      data: themeData,
      child: child,
    );

    showCupertinoModalPopup<void>(
      context: context,
      builder: (context) => dialogBody,
    );
  }

  Widget _buildDatePicker(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showDemoPicker(
          context: context,
          child: _BottomPicker(
            child: CupertinoDatePicker(
              backgroundColor: CupertinoColors.systemBackground.resolveFrom(context),
              mode: CupertinoDatePickerMode.date,
              initialDateTime: date,
              onDateTimeChanged: (newDateTime) {
                setState(() => date = newDateTime);
              },
            ),
          ),
        );
      },
      child: _Menu(children: [
        Text('日期'),
        Text(
          DateFormat.yMMMMd().format(date),
          style: const TextStyle(color: CupertinoColors.inactiveGray),
        ),
      ]),
    );
  }

  Widget _buildTimePicker(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showDemoPicker(
          context: context,
          child: _BottomPicker(
            child: CupertinoDatePicker(
              backgroundColor:
                  CupertinoColors.systemBackground.resolveFrom(context),
              mode: CupertinoDatePickerMode.time,
              initialDateTime: time,
              onDateTimeChanged: (newDateTime) {
                setState(() => time = newDateTime);
              },
            ),
          ),
        );
      },
      child: _Menu(
        children: [
          Text('时间'),
          Text(
            DateFormat.jm().format(time),
            style: const TextStyle(color: CupertinoColors.inactiveGray),
          ),
        ],
      ),
    );
  }

  Widget _buildDateAndTimePicker(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showDemoPicker(
          context: context,
          child: _BottomPicker(
            child: CupertinoDatePicker(
              backgroundColor: CupertinoColors.systemBackground.resolveFrom(context),
              mode: CupertinoDatePickerMode.dateAndTime,
              initialDateTime: dateTime,
              onDateTimeChanged: (newDateTime) {
                setState(() => dateTime = newDateTime);
              },
            ),
          ),
        );
      },
      child: _Menu(
        children: [
          Text('日期和时间'),
          Flexible(
            child: Text(
              DateFormat.yMMMd().add_jm().format(dateTime),
              style: const TextStyle(color: CupertinoColors.inactiveGray),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCountdownTimerPicker(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showDemoPicker(
          context: context,
          child: _BottomPicker(
            child: CupertinoTimerPicker(
              backgroundColor:
                  CupertinoColors.systemBackground.resolveFrom(context),
              initialTimerDuration: timer,
              onTimerDurationChanged: (newTimer) {
                setState(() => timer = newTimer);
              },
            ),
          ),
        );
      },
      child: _Menu(
        children: [
          Text('倒计时器'),
          Text(
            '${timer.inHours}:'
            '${(timer.inMinutes % 60).toString().padLeft(2, '0')}:'
            '${(timer.inSeconds % 60).toString().padLeft(2, '0')}',
            style: const TextStyle(color: CupertinoColors.inactiveGray),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: '选择器',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: DefaultTextStyle(
        style: CupertinoTheme.of(context).textTheme.textStyle,
        child: ListView(
          children: [
            const SizedBox(height: 32),
            _buildDatePicker(context),
            _buildTimePicker(context),
            _buildDateAndTimePicker(context),
            _buildCountdownTimerPicker(context),
            const SizedBox(height: 60),
            Center(
              child: Column(
                children: [
                  CupertinoButton(
                    child: Text('CupertinoDatePicker'),
                    onPressed: () => showBottom(),
                  ),
                  Center(
                    child: CupertinoButton(
                      child: Text('CupertinoPicker'),
                      onPressed: () => showPicker(),
                    ),
                  ),
                ],
              ),
            ),
          ],
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
            /// iOS风格的日期选择器小部件。
            ///
            /// [CupertinoDatePickerMode]中列出了日期选择器的几种模式。
            ///
            ///该类将其子级显示为连续的列。 它的子级顺序基于国际化。
            ///
            ///日期模式下的选择器示例：
            ///
            /// *美国英语：`| 七月| 13 | 2012 |`
            /// *越南语：`| 13 | Tháng7 | 2012 |`
            ///
            ///可以与[showCupertinoModalPopup]一起使用，以在屏幕底部模态显示选取器。
            ///
            ///自行调整大小为其父级，如果未指定全屏宽度，则可能无法正确呈现。 内容文本显示为[CupertinoTextThemeData.dateTimePickerTextStyle]。
            ///
            /// 也可以看看：
            ///
            /// * [CupertinoTimerPicker]，实现iOS风格的计时器选择器的类。
            /// * [CupertinoPicker]，实现与内容无关的微调UI的类。
            child: CupertinoDatePicker(
              onDateTimeChanged: (value) {
                Fluttertoast.showToast(msg: '$value');
              },
              backgroundColor: Colors.white,
            ),
          );
        });
  }

  /// CupertinoPicker，该类实现与内容无关的Spinner UI。
  void showPicker() {
    showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return Container(
            height: 200,
            child: CupertinoPicker(
              itemExtent: 50.0,
              onSelectedItemChanged: (value) {
                Fluttertoast.showToast(msg: '$value');
              },
              children: [
                Text('马什么梅？'),
                Text('什么冬梅？'),
                Text('马东什么？'),
              ],
              backgroundColor: Colors.white,
            ),
          );
        });
  }

}

class _BottomPicker extends StatelessWidget {
  const _BottomPicker({
    Key key,
    @required this.child,
  })  : assert(child != null),
        super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 216,
      padding: const EdgeInsets.only(top: 6),
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      color: CupertinoColors.systemBackground.resolveFrom(context),
      child: DefaultTextStyle(
        style: TextStyle(
          color: CupertinoColors.label.resolveFrom(context),
          fontSize: 22,
        ),
        child: GestureDetector(
          // Blocks taps from propagating to the modal sheet and popping.
          onTap: () {},
          child: SafeArea(
            top: false,
            child: child,
          ),
        ),
      ),
    );
  }
}

class _Menu extends StatelessWidget {
  const _Menu({
    Key key,
    @required this.children,
  })  : assert(children != null),
        super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: CupertinoColors.inactiveGray, width: 0),
          bottom: BorderSide(color: CupertinoColors.inactiveGray, width: 0),
        ),
      ),
      height: 44,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children,
        ),
      ),
    );
  }
}
