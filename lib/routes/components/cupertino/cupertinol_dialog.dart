import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///在应用程序当前内容上方显示一个iOS样式的对话框，并带有iOS样式的入口和出口动画，模态屏障颜色和模态屏障行为（默认情况下，在屏障上轻击该对话框是不可用的）。
///此函数需要一个“构建器”，该构建器通常会构建一个[CupertinoDialog]或[CupertinoAlertDialog]小部件。对话框下面的内容以[ModalBarrier]变暗。
///由builder返回的窗口小部件与最初调用showCupertinoDialog的位置没有共享上下文。如果对话框需要动态更新，请使用[StatefulBuilder]或自定义[StatefulWidget]。
///
///`context`参数用于查找对话框的[Navigator]。
///仅在调用方法时使用。在关闭对话框之前，可以从树中安全删除其对应的小部件。
///
///`useRootNavigator`参数用于确定是否将对话框推入距给定上下文最远或最接近的[Navigator]。
///默认情况下，“ useRootNavigator”为“ true”，并且此方法创建的对话框路由被推送到根导航器。
///
///如果应用程序具有多个[Navigator]对象，则可能需要调用`Navigator.of（context，rootNavigator：true）.pop（result）`来关闭对话框，而不仅仅是`Navigator.pop（context，结果）。
///
///返回关闭对话框时解析为传递给[Navigator.pop]的值（如果有）的[Future]。
///
/// 也可以看看：
///
/// * [CupertinoDialog]，一种iOS样式的对话框。
/// * [CupertinoAlertDialog]，一种iOS风格的警报对话框。
/// * [showDialog]，显示材质样式对话框。
/// * [showGeneralDialog]，它允许自定义对话框弹出窗口。

class CupertinoDialogRoute extends StatefulWidget {
  @override
  _CupertinoDialogRouteState createState() => _CupertinoDialogRouteState();
}

class _CupertinoDialogRouteState extends State<CupertinoDialogRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'CupertinoAlertDialog',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CupertinoButton.filled(
              child: Text('提醒',style: TextStyle(fontSize: 14),),
              onPressed: () => show0(),
            ),
          ),
          SizedBox(height: 10,),
          Center(
            child: CupertinoButton.filled(
              child: Text('带标题的提醒',style: TextStyle(fontSize: 14),),
              onPressed: () => show1(),
            ),
          ),
          SizedBox(height: 10,),
          Center(
            child: CupertinoButton.filled(
              child: Text('带有按钮的提醒',style: TextStyle(fontSize: 14),),
              onPressed: () => show2(),
            ),
          ),
          SizedBox(height: 10,),
          Center(
            child: CupertinoButton.filled(
              child: Text('仅限提醒按钮',style: TextStyle(fontSize: 14),),
              onPressed: () => show3(),
            ),
          ),
        ],
      ),
    );
  }

  void show0() {
    showCupertinoDialog(
      context: context,
      builder: (context){
        return CupertinoAlertDialog(
          title: Text('要舍弃草稿么？'),
          actions: [
            CupertinoDialogAction(
              onPressed: ()=> Navigator.pop(context),
              child: Text('舍弃',style: TextStyle(color: Colors.redAccent),),
            ),
            CupertinoDialogAction(
              onPressed: ()=> Navigator.pop(context),
              child: Text('取消'),
            ),
          ],
        );
      },
    );
  }

  void show1() {
    showCupertinoDialog(
      context: context,
      builder: (context){
        return CupertinoAlertDialog(
          title: Text('是否允许“地图”在您使用该应用时获取您的位置信息'),
          content: Text('您当前所在的位置将显示在地图上，并用于提供路线、附近位置的搜索结果和预计的行程时间。'),
          actions: [
            CupertinoDialogAction(
              onPressed: ()=> Navigator.pop(context),
              child: Text('不允许'),
            ),
            CupertinoDialogAction(
              onPressed: ()=> Navigator.pop(context),
              child: Text('允许'),
            ),
          ],
        );
      },
    );
  }

  void show2() {
    showCupertinoDialog(
      context: context,
      builder: (context){
        return CupertinoAlertDialog(
          title: Text('选择最心爱的甜点'),
          content: Text('请从下面的列表中选择您最喜爱的甜点类型。系统将根据您的选择自定义您所在地区的推荐餐厅列表。'),
          actions: [
            CupertinoDialogAction(
              onPressed: ()=> Navigator.pop(context),
              child: Text('奶酪蛋糕'),
            ),
            CupertinoDialogAction(
              onPressed: ()=> Navigator.pop(context),
              child: Text('提拉米苏'),
            ),
            CupertinoDialogAction(
              onPressed: ()=> Navigator.pop(context),
              child: Text('苹果派'),
            ),
            CupertinoDialogAction(
              onPressed: ()=> Navigator.pop(context),
              child: Text('巧克力布朗尼'),
            ),
            CupertinoDialogAction(
              onPressed: ()=> Navigator.pop(context),
              child: Text('取消',style: TextStyle(color: Colors.redAccent),),
            ),
          ],
        );
      },
    );
  }

  void show3() {
    showCupertinoDialog(
      context: context,
      builder: (context){
        return CupertinoAlertDialog(
          actions: [
            CupertinoDialogAction(
              onPressed: ()=> Navigator.pop(context),
              child: Text('奶酪蛋糕'),
            ),
            CupertinoDialogAction(
              onPressed: ()=> Navigator.pop(context),
              child: Text('提拉米苏'),
            ),
            CupertinoDialogAction(
              onPressed: ()=> Navigator.pop(context),
              child: Text('苹果派'),
            ),
            CupertinoDialogAction(
              onPressed: ()=> Navigator.pop(context),
              child: Text('巧克力布朗尼'),
            ),
            CupertinoDialogAction(
              onPressed: ()=> Navigator.pop(context),
              child: Text('取消',style: TextStyle(color: Colors.redAccent),),
            ),
          ],
        );
      },
    );
  }

}
