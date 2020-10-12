import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


/// 最简单的模型，只有一个字段。
///
/// [ChangeNotifier] is a class in `flutter:foundation`.
/// [Counter] does _not_ depend on Provider.
class Counter with ChangeNotifier {
  int value = 0;

  void increment() {
    value += 1;
    notifyListeners();
  }
}


class ProviderCounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('您已多次按下按钮：'),
            // 消费者寻找祖先的Provider窗口小部件并检索其模型（在本例中为Counter），然后使用该模型构建窗口小部件，如果模型更新则将触发重建。
            Consumer<Counter>(
              builder: (context, counter, child) => Text(
                '${counter.value}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 您可以在有权访问上下文的任何地方访问提供程序。
          // 一种方法是使用Provider<Counter>.of（context）
          //
          // provider包还定义了上下文本身的扩展方法。
          // 您可以在任何窗口小部件的构建方法中调用context.watch <Counter>（）来访问Counter的当前状态，
          // 并在Counter变化时随时要求Flutter重建您的窗口小部件。
          //
          // 您不能在构建方法之外使用context.watch（），因为这通常会导致细微的错误。
          // 相反，您应该使用context.read <Counter>（），它获取当前状态，但不要求Flutter进行将来的重建。
          //
          // 由于我们处于一个回调，每当用户点击FloatingActionButton时都会调用该回调，因此我们不在这里的build方法中。
          // 我们应该使用context.read（）。
          var counter = context.read<Counter>();
          counter.increment();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}