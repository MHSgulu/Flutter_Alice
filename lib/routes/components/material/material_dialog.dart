import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';

///对话方块 告知用户有关一项任务的信息，并且可以包含关键信息，需要做出决定或涉及多个任务。
///对话框有四种类型：1。 警报，2。 简单，3。 确认书，4。 全屏
///对话框是一种模态窗口，出现在应用程序内容的前面，用于提供重要信息或要求决策。对话框在出现时会禁用所有应用程序功能，并一直显示在屏幕上，直到确认，关闭或已采取必要的措施为止。

// 对话框是故意打断的，因此应谨慎使用。
// 在使用“材质”对话框之前，您需要为Flutter导入“材质组件”包： 包：Flutter / material.dart。
// 您需要使用 MaterialApp。
// 有关使用Flutter的材料的更多信息，请访问Flutter 材料库 页。

///警报对话框以紧急信息，详细信息或操作打断用户。
///
///简单的对话框可以显示选择后立即可操作的项目。他们没有文字按钮。
///由于简单的对话框具有干扰性，因此应谨慎使用。或者，下拉菜单以非模式，破坏性较小的方式提供选项。
///
///确认对话框使用户能够在做出选择之前提供对选择的最终确认，因此他们有机会在必要时改变主意。
///如果用户确认选择，则执行该选择。否则，用户可以关闭该对话框。
///例如，用户可以收听多个铃声，但只有在点击“确定”后才能做出最终选择。
///注意：Flutter中没有明确的确认对话框，但是可以使用 Dialog 小部件作为空白板并提供您自己的自定义child
///
///全屏对话框将一系列任务组合在一起，例如使用事件标题，日期，位置和时间创建日历条目。
///因为它们占据了整个屏幕，所以全屏对话框是唯一可以显示其他对话框的对话框
///要使用全屏对话框，只需设置 全屏对话框 推新时为真 MaterialPageRoute。

class MaterialDialog extends StatefulWidget {
  @override
  _MaterialDialogState createState() => _MaterialDialogState();
}

class _MaterialDialogState extends State<MaterialDialog> {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: '对话框',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: RaisedButton(
              onPressed: () => show1(),
              child: Text('AlertDialog(警报对话框)'),
            ),
          ),
          Center(
            child: RaisedButton(
              onPressed: () => show2(),
              child: Text('SimpleDialog(简单对话框)'),
            ),
          ),
          Center(
            child: RaisedButton(
              onPressed: () => show3(),
              child: Text('ConfirmationDialog(确认对话框)'),
            ),
          ),
          Center(
            child: RaisedButton(
              onPressed: () => show4(),
              child: Text('Full-screenDialog(全屏对话框)'),
            ),
          ),
        ],
      ),
    );
  }

  void show1() {
    ///在应用程序当前内容上方显示“材料”对话框，
    ///材质的入口和出口动画，模态屏障颜色和模态屏障行为（轻按屏障可忽略对话框）。
    ///
    ///此函数需要一个`builder`，通常会构建一个[Dialog]小部件。
    ///对话框下面的内容以[ModalBarrier]变暗。由builder返回的窗口小部件与最初调用showDialog的位置没有共享上下文。
    ///如果对话框需要动态更新，请使用[StatefulBuilder]或自定义[StatefulWidget]。
    ///
    ///不赞成使用`child`参数，而应将其替换为`builder`。
    ///
    ///`context`参数用于查找对话框的[Navigator]和[Theme]。
    ///仅在调用该方法时使用。在关闭对话框之前，可以从树中安全删除其对应的小部件。
    ///
    ///`barrierDismissible`参数用于指示是否点击障碍会关闭对话框。默认情况下为true，不能为null。
    ///
    ///`barrierColor`参数用于指定使所有对话框变暗的模式障碍的颜色。如果为null，则使用默认颜色Colors.black54。
    ///
    ///“ useSafeArea”参数用于指示对话框是否仅应在操作系统未使用的屏幕的“安全”区域中显示（有关更多详细信息，请参见[SafeArea]）。
    ///默认情况下为“ true”，这意味着对话框不会与操作系统区域重叠。如果将其设置为“ false”，则对话框仅受屏幕尺寸的限制。它不能为“ null”。
    ///
    ///`useRootNavigator`参数用于确定是否将对话框推入距给定上下文最远或最接近的[Navigator]。
    ///默认情况下，“ useRootNavigator”为“ true”，并且此方法创建的对话框路由被推送到根导航器。它不能为空。
    ///
    ///将`routeSettings`参数传递给[showGeneralDialog]，有关详细信息，请参见[RouteSettings]。
    ///
    ///如果应用程序具有多个[Navigator]对象，则可能有必要调用`Navigator.of（context，rootNavigator：true）.pop（result）`来关闭对话框，而不仅仅是Navigator.pop（context, result）
    ///
    ///返回关闭对话框时解析为传递给[Navigator.pop]的值（如果有）的[Future]。
    ///
    /// 也可以看看：
    ///
    /// * [AlertDialog]，用于在主体下方具有一排按钮的对话框。
    /// * [SimpleDialog]，用于处理内容的滚动，并且在其主体下方不显示按钮。
    /// * [Dialog]，[SimpleDialog]和[AlertDialog]基于。
    /// * [showCupertinoDialog]，它显示iOS样式的对话框。
    /// * [showGeneralDialog]，它允许自定义对话框弹出窗口。
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('重置设置？'),
          content: Text('这会将设备重置为出厂默认设置'),
          actions: [
            FlatButton(
              textColor: Color(0xFF6200EE),
              onPressed: () => Navigator.pop(context),
              child: Text('取消'),
            ),
            FlatButton(
              textColor: Color(0xFF6200EE),
              onPressed: () => Navigator.pop(context),
              child: Text('确定'),
            ),
          ],
        );
      },
    );
  }

  void show2() {
    showDialog<void>(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text('设置备份帐户'),
          children: [
            SimpleDialogItem(
              icon: Icons.account_circle,
              color: Colors.orange,
              text: 'user01@gmail.com',
              onPressed: () {
                Navigator.pop(context, 'user01@gmail.com');
              },
            ),
            SimpleDialogItem(
              icon: Icons.account_circle,
              color: Colors.green,
              text: 'user02@gmail.com',
              onPressed: () {
                Navigator.pop(context, 'user02@gmail.com');
              },
            ),
            SimpleDialogItem(
              icon: Icons.add_circle,
              color: Colors.grey,
              text: 'Add account',
              onPressed: () {
                Navigator.pop(context, 'user02@gmail.com');
              },
            ),
          ],
        );
      },
    );
  }

  void show3() {
    showDialog<void>(
      context: context,
      builder: (context) {
        ///如果对话框需要动态更新，请使用[StatefulBuilder]或自定义[StatefulWidget]。
        return StatefulBuilder(builder: (context,setState){
          return AlertDialog(
            title: Text('标题'),
            contentPadding: EdgeInsets.zero,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 1; i <= 3; i++)
                  ListTile(
                    title: Text(
                      '选项 $i',
                      /*style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(color: shrineBrown900),*/
                    ),
                    leading: Radio(
                      value: i,
                      groupValue: _value,
                      onChanged: (value) {
                        if (mounted) {
                          setState(() {
                            _value = value;
                          });
                        }
                      },
                    ),
                  ),
              ],
            ),
            actions: [
              FlatButton(
                onPressed: () => Navigator.pop(context),
                child: Text('取消'),
              ),
              FlatButton(
                onPressed: () => Navigator.pop(context),
                child: Text('确定'),
              ),
            ],
          );
        });
      },
    );
  }

  void show4() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => FullScreenDialog(),
          fullscreenDialog: true,
        ));
  }
}

class SimpleDialogItem extends StatelessWidget {
  const SimpleDialogItem(
      {Key key, this.icon, this.color, this.text, this.onPressed})
      : super(key: key);

  final IconData icon;
  final Color color;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SimpleDialogOption(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 36.0, color: color),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 16.0),
            child: Text(text),
          ),
        ],
      ),
    );
  }
}

class FullScreenDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('全屏对话框'),
      ),
      body: Center(
        child: Text('这是全屏对话框'),
      ),
    );
  }
}
