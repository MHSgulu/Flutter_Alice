import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

//AbsorbPointer为您的小部件提供了一种禁止输入的好方法。
// 如果您有一个复杂的小部件子树，并且需要一种方法将它们全部从触摸事件中移除，请尝试使用AbsorbPointer。
// {@youtube 560315 https://www.youtube.com/watch?v=65HoWqBboI8}

///一个在命中测试期间吸收指针的小部件。
///
///当[吸收]为true时，此小部件通过终止自身的命中测试来防止其子树接收指针事件。
///它仍然在布局过程中占用空间，并像往常一样绘制其子级。
///它只是防止其子级成为所定位事件的目标，因为它从[RenderBox.hitTest]返回true。
///
/// 也可以看看：
///
/// * [IgnorePointer]，它还阻止其子级接收指针事件，但对于命中测试而言本身是不可见的。

class AbsorbPointerDemo extends StatefulWidget {
  @override
  _AbsorbPointerDemoState createState() => _AbsorbPointerDemoState();
}

class _AbsorbPointerDemoState extends State<AbsorbPointerDemo> {
  bool _absorbing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'AbsorbPointer',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: AbsorbPointer(
        //此小部件是否在命中测试期间吸收指针。
        //无论此渲染对象在命中测试期间是否吸收指针，它在布局期间仍将占用空间，并且在绘制期间将可见。
        absorbing: _absorbing,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Fluttertoast.showToast(msg: '拉哩哩啦啦');
                },
                child: Text(
                  _absorbing ? '按钮点击事件被吸收' : '按钮点击事件正常',
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: _absorbing ? '输入框触摸事件被移除' : '输入框触摸事件正常',
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (mounted) {
            setState(() {
              _absorbing = !_absorbing;
            });
          }
        },
        child: Text(
          _absorbing ? '开放' : '禁止',
        ),
      ),
    );
  }
}
