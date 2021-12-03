import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';

///使用小吃店 经常会遇到的错误提示！！！！！！
///在不包含Scaffold的上下文中调用Scaffold.of（）。

/// 从传递给Scaffold.of（）的上下文开始，找不到Scaffold的祖先。
/// 当所提供的上下文与其构建函数实际创建要查找的Scaffold小部件的状态来自同一StatefulWidget时，通常会发生这种情况。

/// 有几种方法可以避免此问题。最简单的方法是使用构建器来获取“位于”脚手架下方的上下文。
/// 有关此示例，请参阅Scaffold.of（）的文档： https://api.flutter.dev/flutter/material/Scaffold/of.html
/// 一个更有效的解决方案是将您的构建功能分成几个小部件。
/// 这引入了一个新的上下文，您可以从中获得脚手架。
/// 在此解决方案中，您将拥有一个外部小部件，该外部小部件创建由新内部小部件的实例填充的Scaffold，然后在这些内部小部件中使用Scaffold.of（）。
/// 一个不太优雅但更方便的解决方案是为Scaffold分配一个GlobalKey，然后使用key.currentState属性获得ScaffoldState而不是使用Scaffold.of（）函数。

class MaterialSnackDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'SnackBar',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: Builder(builder: (context){
        return Center(
          child: ElevatedButton(
            onPressed: (){
              final snackBar = SnackBar(
                behavior: SnackBarBehavior.floating,
                content: Text('Text label'),
                action: SnackBarAction(
                  label: 'Action',
                  onPressed: () {},
                ),
              );

              //在小部件树中找到脚手架，并使用它显示SnackBar。
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            child: Text('Show SnackBar'),
          ),
        );
      }),
    );
  }

}