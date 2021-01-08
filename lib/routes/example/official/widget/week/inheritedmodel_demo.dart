import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';

// {@youtube 560 315 https://www.youtube.com/watch?v=Zbm3hjPjQMk}
// {@youtube 560 315 https://www.youtube.com/watch?v=1t-8rBCGBYw}

///小部件的基类，这些小部件可有效地沿树向下传播信息。
///
///要从构建上下文中获取特定类型的继承小部件的最近实例，请使用[BuildContext.dependOnInheritedWidgetOfExactType]。
///
///以这种方式引用继承的小部件时，当继承的小部件本身更改状态时，将导致使用者重建。
///
/// ##实现`of`方法
///
///约定是在[InheritedWidget]上提供静态方法`of`，该方法调用[BuildContext.dependOnInheritedWidgetOfExactType]。
///如果范围内没有小部件，这允许类定义自己的后备逻辑。在上面的示例中，在这种情况下，返回的值将为null，但也可能默认为一个值。
///
///有时，`of`方法返回数据，而不是继承的小部件；例如，在这种情况下，它可能返回了[Color]而不是`FrogColor`小部件。
///
///有时，继承的小部件是另一个类的实现细节，因此是私有的。在这种情况下，通常将“ of”方法放在公共类上。
///例如，[Theme]被实现为[StatelessWidget]，它构建了一个私有继承的窗口小部件；
/// [Theme.of]使用[BuildContext.dependOnInheritedWidgetOfExactType]查找继承的窗口小部件，然后返回[ThemeData]。
///
/// ##调用`of`方法
///
///当使用`of`方法时，`context`必须是[InheritedWidget]的后代，这意味着它必须在树中[InheritedWidget]的“下方”。
///
/// 也可以看看：
///
/// * [StatefulWidget]和[State]，用于在生命周期内可以多次构建的小部件。
/// * [StatelessWidget]，用于在特定配置和环境状态下始终以相同方式构建的窗口小部件。
/// * [Widget]，以概括了解小部件。
/// * [InheritedNotifier]，一个继承的窗口小部件，其值可以是[Listenable]，只要该值发送通知，它就会通知依赖项。
/// * [InheritedModel]，一个继承的小部件，它允许客户端订阅值的子部分的更改。

class InheritedModelDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'InheritedModel',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => MyPage())),
              child: Text('演示1(有效)'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => MyOtherPage())),
              child: Text('演示2(无效)'),
            ),
          ),
        ],
      ),
    );
  }
}

//以下是一个名为`FrogColor`的继承控件的框架：
class FrogColor extends InheritedWidget {
  const FrogColor({
    Key key,
    @required this.color,
    @required Widget child,
  })  : assert(color != null),
        assert(child != null),
        super(key: key, child: child);

  final Color color;

  static FrogColor of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<FrogColor>();
  }

  @override
  bool updateShouldNotify(FrogColor old) => color != old.color;
}

//在此示例中，使用的“上下文”是[Builder]中的上下文，它是FrogColor小部件的子级，因此可以使用。
class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'InheritedWidget',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: FrogColor(
        color: Colors.green,
        child: Builder(
          builder: (innerContext) {
            return Text(
              'Hello Frog',
              style: TextStyle(color: FrogColor.of(innerContext).color),
            );
          },
        ),
      ),
    );
  }
}

//在此示例中，所用的“上下文”是MyOtherPage小部件中的“上下文”，它是FrogColor小部件的父级，因此不起作用。
class MyOtherPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'InheritedWidget',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: FrogColor(
        color: Colors.green,
        child: Text(
          'Hello Frog',
          style: TextStyle(color: FrogColor.of(context).color),
        ),
      ),
    );
  }

}