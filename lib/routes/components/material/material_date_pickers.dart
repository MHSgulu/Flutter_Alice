import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MaterialDatePickers extends StatefulWidget {
  @override
  _MaterialDatePickersState createState() => _MaterialDatePickersState();
}

class _MaterialDatePickersState extends State<MaterialDatePickers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: '日期选择器',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () => show1(),
              child: Text('showDatePicker(移动日历选择器)'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () => show2(),
              child: Text('showDateRangePicker(移动日期范围选择器)'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () => show3(),
              child: Text('CalendarDatePicker类(提供日历网格）'),
            ),
          ),
        ],
      ),
    );
  }

  // ignore: slash_for_doc_comments
  /**
   * 显示一个包含“物料设计”日期选择器的对话框。

      当用户确认对话框时，返回的Future解析为用户选择的日期。如果用户取消对话框，则返回null。

      首次显示日期选择器时，它将显示的月份 initialDate，并带有initialDate。

      这firstDate是最早的允许日期。的lastDate是最新的允许的日期。initialDate必须介于这些日期之间，或者等于其中之一。对于每个这些DateTime参数，仅考虑其日期。他们的时间字段被忽略。它们必须全部为非空。

      该currentDate代表当前日（即今天）。该日期将在日网格中突出显示。如果为null，DateTime.now()将使用的日期 。

      可选initialEntryMode参数可用于在DatePickerEntryMode.calendar（日历月网格）或DatePickerEntryMode.input（文本输入字段）模式下显示日期选择器。它默认为DatePickerEntryMode.calendar，并且必须为非null。

      selectableDayPredicate可以传入一个可选函数，仅允许某些天进行选择。如果提供，则只能selectableDayPredicate选择返回true的日期 。例如，这可以用于仅允许工作日进行选择。如果提供，则必须为返回true initialDate。

      以下可选字符串参数使您可以覆盖用于对话框各个部分的默认文本：

      helpText，标签显示在对话框顶部。
      cancelText，取消按钮上的标签。
      confirmText，确定按钮上的标签。
      errorFormatText，当输入文本的日期格式不正确时使用的消息。
      errorInvalidText，当输入文本不是可选日期时使用的消息。
      fieldHintText，用于在字段中未输入任何文本时提示用户的文本。
      fieldLabelText，日期文本输入字段的标签。
      可选locale参数可用于设置日期选择器的语言环境。它默认为Localizations提供的环境语言环境。

      可选textDirection参数可用于设置日期选择器的文本方向（TextDirection.ltr或TextDirection.rtl）。默认为Directionality提供的环境文本方向。如果 locale和textDirection都不为空，则textDirection覆盖为选定的方向locale。

      的context，useRootNavigator并且routeSettings参数被传递到 的ShowDialog的文档，其中讨论了如何使用它。context 并且useRootNavigator必须为非null。

      该builder参数可用于包装对话框小部件以添加继承的小部件（例如Theme）。

      可选initialDatePickerMode参数可用于使日历日期选择器最初以DatePickerMode.year或 DatePickerMode.day模式显示。它默认为DatePickerMode.day，并且必须为非null。

      也可以看看：

      showDateRangePicker，显示用于选择日期范围的材料设计日期范围选择器。
      CalendarDatePicker，它提供日期选择器对话框使用的日历网格。
      InputDatePickerFormField，它提供用于输入日期的文本输入字段。
   */
  ///移动日历选择器 常见的用例包括： 预订餐厅 安排会议
  /// 对于选择需要更多导航的遥远的过去或将来的日期，例如输入出生日期或到期日期，它们并不是理想的选择。
  /// 不要使用日历选择器来提示过去或将来的日期，例如出生日期。在这些情况下，请改用移动输入选择器或文本字段。
  void show1() async {
    DateTime result = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), //选择器应显示的最初选择的[DateTime]。
      firstDate: DateTime(1970, 1, 1), //用户可以选择的最早允许的[DateTime]。
      lastDate: DateTime.now(), //用户可以选择的最新允许的[DateTime]。
      currentDate: DateTime.now(), //今天的[DateTime]。 它将在日网格中突出显示
      //可选的[initialEntryMode]参数可用于使日历日期选择器最初以[DatePickerEntryMode.calendar]或[DatePickerEntryMode.input]模式显示。
      // 默认为[DatePickerEntryMode.calendar]，并且必须为非null。
      initialEntryMode: DatePickerEntryMode.calendar,
      helpText: '唯时间不可辜负', //标头顶部显示的文本。这用于向用户指示他们正在选择日期的日期。
      cancelText: '取消', //在取消按钮上显示的文本。
      confirmText: '确定', //确认按钮上显示的文本。
      //可选的[initialDatePickerMode]参数可用于使日历日期选择器最初以[DatePickerMode.year]或[DatePickerMode.day]模式显示。
      // 默认为[DatePickerMode.day]，并且必须为非null。
      initialDatePickerMode: DatePickerMode.day,
    );
    Fluttertoast.showToast(msg: '$result');
  }

  // ignore: slash_for_doc_comments
  /**
   * 显示包含“材料设计”日期范围选择器的全屏模式对话框。

      当用户保存选择时，返回的Future解析为用户选择的DateTimeRange。如果用户取消对话框，则返回null。

      如果initialDateRange非零，则它将用作初始选择的日期范围。如果提供，则initialDateRange.start必须在之前或之上initialDateRange.end。

      这firstDate是最早的允许日期。的lastDate是最新的允许的日期。两者都必须为非null。

      如果提供了初始日期范围，initialDateRange.start 并且initialDateRange.end必须都介于firstDate和 之间lastDate。对于所有这些DateTime值，仅考虑其日期。他们的时间字段被忽略。

      该currentDate代表当前日（即今天）。该日期将在日网格中突出显示。如果为null，DateTime.now()将使用的日期 。

      可选initialEntryMode参数可用于在DatePickerEntryMode.calendar（可滚动的日历月份网格）或DatePickerEntryMode.input（两个文本输入字段）模式下显示日期选择器。它默认为DatePickerEntryMode.calendar，并且必须为非null。

      以下可选字符串参数使您可以覆盖用于对话框各个部分的默认文本：

      helpText，即显示在对话框顶部的标签。
      cancelText，即文本输入模式下“取消”按钮上的标签。
      confirmText，确定按钮在文本输入模式下的标签。
      saveText，即全屏日历模式的“保存”按钮上的标签。
      errorFormatText，当输入文本的日期格式不正确时使用的消息。
      errorInvalidText，当输入文本不是可选日期时使用的消息。
      errorInvalidRangeText，当日期范围无效（例如开始日期在结束日期之后）时使用的消息。
      fieldStartHintText，当在开始字段中未输入任何文本时用于提示用户的文本。
      fieldEndHintText，当在结束字段中未输入任何文本时，用于提示用户的文本。
      fieldStartLabelText，开始日期文本输入字段的标签。
      fieldEndLabelText，是结束日期文本输入字段的标签。
      可选locale参数可用于设置日期选择器的语言环境。它默认为Localizations提供的环境语言环境。

      可选textDirection参数可用于设置日期选择器的文本方向（TextDirection.ltr或TextDirection.rtl）。默认为Directionality提供的环境文本方向。如果 locale和textDirection都不为空，则textDirection覆盖为选定的方向locale。

      的context，useRootNavigator并且routeSettings参数被传递到的ShowDialog的文档，其中讨论了如何使用它。 context并且useRootNavigator必须为非null。

      该builder参数可用于包装对话框小部件以添加继承的小部件（例如Theme）。

      也可以看看：

      showDatePicker，显示用于选择单个日期的材料设计日期选择器。
      DateTimeRange，用于描述日期范围。
   */
  ///移动日期范围选择器 常见的用例包括：预订航班 预订酒店
  void show2() async {
    DateTimeRange result = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2020, 12, 31),
    );
    Fluttertoast.showToast(msg: '$result');
  }

  ///显示给定月份的天网格，并允许用户选择日期。
  ///星期几中的每一天都以矩形网格排列，每一列都有一列。提供控件以更改网格显示的年和月。
  ///日历选择器小部件很少直接使用
  void show3() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return CalendarDatePicker(
          initialDate: DateTime.now(),
          firstDate: DateTime(1970, 1, 1),
          lastDate: DateTime.now(),
          onDateChanged: (value) {
            Fluttertoast.showToast(msg: '$value');
          },
        );
      },
    );
  }

}
