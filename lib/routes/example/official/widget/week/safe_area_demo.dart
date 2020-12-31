import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';

//Flutter的SafeArea工具可以避免讨厌的消息通知栏和不规则的手机屏幕干扰您的应用程序的正常显示。
// 它使用MediaQuery来检查屏幕的尺寸，并使用一个子工具来匹配您的应用程序，确保它能在iOS和Android上都正常显示！

///一个小部件，它通过足够的填充来插入其子级，以避免操作系统的入侵。
///
///例如，这将使孩子缩进足够长的距离，以避免屏幕顶部的状态栏。
///
///这还将使孩子缩进，以避免在iPhone X上出现缺口或其他类似的创造性外观特征。
///
///当指定[minimum]填充时，将应用最小填充或安全区域填充中的较大者。
///
/// {@youtube 560315 https://www.youtube.com/watch?v=lkF0TQJO0bA}
///
/// 也可以看看：
///
/// * [SliverSafeArea]，用于插入碎片以避免操作系统入侵。
/// * [Padding]，通常用于插入小部件。
/// * [MediaQuery]，从中获取窗口填充。
/// * [dart：ui.Window.padding]，它从操作系统报告填充。

class SafeAreaDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'SafeArea',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => NoUserSafeAreaDemo()));
              },
              child: Text('无SafeArea'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => UserSafeAreaDemo()));
              },
              child: Text('有SafeArea'),
            ),
          ),
        ],
      ),
    );
  }
}

class NoUserSafeAreaDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('这是一条测试文本'),
        ],
      ),
    );
  }
}

class UserSafeAreaDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///创建一个避免操作系统界面的小部件。
      ///
      /// [left]，[top]，[right]，[bottom]和[minimum]参数不能为null。
      body: SafeArea(
        ///是否避免左侧的系统入侵。
        left: true,
        ///是否避免在屏幕顶部（通常是系统状态栏）出现系统入侵。
        top: true,
        ///是否避免右边的系统入侵。
        right: true,
        ///是否避免屏幕底部出现系统入侵。
        bottom: true,
        ///要应用的最小填充量。
        ///
        ///将使用最小插入量和介质填充中的较大者。
        minimum: EdgeInsets.zero,
        ///指定当由当前上下文的[MediaQuery]的[MediaQueryData.viewInsets]消耗时[SafeArea]是否应保留[MediaQueryData.viewPadding]而不是[MediaQueryData.padding]，默认为false。
        ///
        ///例如，如果在SafeArea上方显示了屏幕键盘，则可以将填充保持在障碍物下方，而不是被占用。
        ///这在布局包含灵活的小部件的情况下很有用，由于填充值的变化，这些小部件在打开软件键盘时可能会明显移动。
        ///将此设置为true将避免UI移位。
        maintainBottomViewPadding: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('这是一条测试文本'),
          ],
        ),
      ),
    );
  }
}