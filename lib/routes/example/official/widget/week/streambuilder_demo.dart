import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';

//今日的应用程序是高度不同步的，飞镖靶串流是管理非同步数据的好方法。
// 如何构建可以跟上串流的连续数据串流的小部件？ 试试StreamBuilder吧！
// 只需给它一个串流和一个构建器，它就会在串流发出新的数据事件时重建它的子节点。
// {@youtube 560 315 https://www.youtube.com/watch?v=MkKEWHfy99Y}

///根据与[Stream]交互的最新快照构建自身的小部件。
/// Widget的重建是由每个交互使用[State.setState]安排的，但是与流的时间无关。
/// Flutter管道会酌情调用[builder]，因此将接收快照的与时间有关的子序列，这些子序列表示与流的交互。
///
///例如，当与生成整数0到9的流进行交互时，可以使用以下快照的任何有序子序列（包括最后一个快照（带有ConnectionState.done的快照））调用[builder]：
///
/// *`new AsyncSnapshot <int> .withData（ConnectionState.waiting，null）`
/// *`new AsyncSnapshot <int> .withData（ConnectionState.active，0）`
/// *`new AsyncSnapshot <int> .withData（ConnectionState.active，1）`
/// * ...
/// *`new AsyncSnapshot <int> .withData（ConnectionState.active，9）`
/// *`new AsyncSnapshot <int> .withData（ConnectionState.done，9）`
///
/// [builder]的实际调用顺序取决于该流产生的事件的相对时间以及Flutter管道的生成速率。
///
///在事件生成期间将[StreamBuilder]配置更改为另一个流会引入以下形式的快照对：
///
/// *`new AsyncSnapshot <int> .withData（ConnectionState.none，5）`
/// *`new AsyncSnapshot <int> .withData（ConnectionState.waiting，5）`
///仅当新流为非空时才生成后者，而仅当旧流为非空时才生成前者。
///
///流可能会产生错误，从而产生以下形式的快照：
///
/// *`new AsyncSnapshot <int> .withError（ConnectionState.active，'some error'）`
///
///仅当状态为“ ConnectionState.active”时，才会更改快照的数据和错误字段。
///
///可以通过指定[initialData]来控制初始快照数据。
///这应该用于确保第一帧具有期望的值，因为将始终在流侦听器有机会被处理之前调用生成器。
///
/// 也可以看看：
///
/// * [ValueListenableBuilder]，它包装了[ValueListenable]而不是[Stream]。
/// * [StreamBuilderBase]，它支持基于计算的小部件构建，该计算跨越与流进行的所有交互。


/// StreamBuilder的Flutter代码示例

//此示例显示了[StreamBuilder]，该[StreamBuilder]侦听发出拍卖出价的Stream。
// 每次StreamBuilder收到来自Stream的出价时，它将在图标下方显示出价的价格。
// 如果Stream发出错误，则错误将显示在错误图标下方。 当信息流结束发送出价时，将显示最终价格。

/// 这是实例化的有状态窗口小部件。
class StreamBuilderDemo extends StatefulWidget{
  @override
  _StreamBuilderDemoState createState() => _StreamBuilderDemoState();
}

/// 这是StreamBuilderDemo附带的私有State类。
class _StreamBuilderDemoState extends State<StreamBuilderDemo> {
  Stream<int> _bids = (() async* {
    await Future<void>.delayed(Duration(seconds: 1));
    yield 1;
    await Future<void>.delayed(Duration(seconds: 1));
  })();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'StreamBuilder',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: DefaultTextStyle(
        style: Theme.of(context).textTheme.headline2,
        textAlign: TextAlign.center,
        child: Container(
          alignment: FractionalOffset.center,
          color: Colors.white,
          child: StreamBuilder<int>(
            stream: _bids,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              List<Widget> children;
              if (snapshot.hasError) {
                children = <Widget>[
                  Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text('Error: ${snapshot.error}'),
                  )
                ];
              }
              else {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    children = <Widget>[
                      Icon(
                        Icons.info,
                        color: Colors.blue,
                        size: 60,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text('选择很多'),
                      )
                    ];
                    break;
                  case ConnectionState.waiting:
                    children = <Widget>[
                      SizedBox(
                        child: const CircularProgressIndicator(),
                        width: 60,
                        height: 60,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text('等待出价...'),
                      )
                    ];
                    break;
                  case ConnectionState.active:
                    children = <Widget>[
                      Icon(
                        Icons.check_circle_outline,
                        color: Colors.green,
                        size: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text('\$${snapshot.data}'),
                      )
                    ];
                    break;
                  case ConnectionState.done:
                    children = <Widget>[
                      Icon(
                        Icons.info,
                        color: Colors.blue,
                        size: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text('\$${snapshot.data} (关闭)'),
                      )
                    ];
                    break;
                }
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: children,
              );
            },
          ),
        ),
      ),
    );
  }

}
