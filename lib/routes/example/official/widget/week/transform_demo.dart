import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';

//使用“Transform”小部件将Flutter应用程序转换为令人惊叹的东西。
// {@youtube 560 315 https://www.youtube.com/watch?v=9z_YNlRlWfA}

// “Flutter的观点”文章→https://bit.ly/2TYvc31 （demo2、3 代码来源）
// “被旋转的菜单图标”由Raouf Rahiche提供→https://bit.ly/2RE8fFC
// “折叠动画的过渡”，“有弹性的滚动”，“酷的卡菜单”由FaoB提供→https://bit.ly/2Rzq1tE
// “3D透视动画”由Hung HD提供→ https://bit.ly/2sx6fjy

///一个小部件，可在绘制其子级之前应用转换。
///
///与[RotatedBox]不同，后者在布局之前应用旋转，此对象仅在绘画之前应用其转换，这意味着在计算此窗口小部件的子项（因此该窗口小部件）消耗多少空间时，不考虑该转换。
///
/// 也可以看看：
///
/// * [RotatedBox]，它在布局过程中旋转子控件，而不仅仅是在绘画过程中。
/// * [FractionalTranslation]，它将相对于孩子大小的翻译应用于孩子。
/// * [FittedBox]，它根据给定的[BoxFit]准则调整其子控件的大小和位置以适合其父控件。
/// * [布局小部件目录]（https://flutter.dev/widgets/layout/）。

class TransformDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'Transform',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (_) => TransformDemo1())),
              child: Text('文本'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (_) => TransformDemo2())),
              child: Text('3D透视图'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (_) => TransformDemo3())),
              child: Text('旋转3D透视图'),
            ),
          ),
        ],
      ),
    );
  }
}

class TransformDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'Transform',
        onPressedBack: () => Navigator.pop(context),
      ),

      ///创建一个可转换其子级的小部件。
      /// [transform]参数不能为null。
      body: Container(
        ///此示例旋转并倾斜一个包含文本的橙色框，将右上角固定在其原始位置。
        child: Transform(
          alignment: Alignment.topRight,
          transform: Matrix4.skewY(0.3)..rotateZ(100),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            color: const Color(0xFFE8581C),
            child: const Text('公寓出租！'),
          ),
        ),
      ),
    );
  }
}

// v1：将默认应用移动到具有固定名称的单独功能中添加变换小部件，旋转和透视
class TransformDemo2 extends StatefulWidget {

  @override
  _TransformDemo2State createState() => _TransformDemo2State();
}

class _TransformDemo2State extends State<TransformDemo2> {
  int _counter = 0;
  Offset _offset = Offset(0.4, 0.7); // new

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Transform(  // 转换小部件
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001) // 透视
        ..rotateX(_offset.dy)
        ..rotateY(_offset.dx),
      alignment: FractionalOffset.center,
      child: _defaultApp(context),
    );
  }

  _defaultApp(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'The Matrix 3D',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '你已经按了很多次了:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

}

// v2: 添加手势检测器
class TransformDemo3 extends StatefulWidget {
  @override
  _TransformDemo3State createState() => _TransformDemo3State();
}

class _TransformDemo3State extends State<TransformDemo3> {
  int _counter = 0;
  Offset _offset = Offset.zero; // changed

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Transform(  // Transform widget
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001) // perspective
          ..rotateX(0.01 * _offset.dy) // changed
          ..rotateY(-0.01 * _offset.dx), // changed
        alignment: FractionalOffset.center,
        child: GestureDetector( // new
          onPanUpdate: (details) => setState(() => _offset += details.delta),
          onDoubleTap: () => setState(() => _offset = Offset.zero),
          child: _defaultApp(context),
        )
    );
  }

  _defaultApp(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'The Matrix 3D',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

}

