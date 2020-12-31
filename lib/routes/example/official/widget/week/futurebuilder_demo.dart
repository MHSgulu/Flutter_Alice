import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';

//有一个Future并且需要一些小部件来显示其价值？试试FutureBuilder吧！
// 给它一个Future和一个构建方法，它将根据未来的状态创建小部件，并在它发生变化时更新它们
// {@youtube 560315 https://www.youtube.com/watch?v=ek8ZPdWj4Qo}

///基于与Future交互的最新快照构建自身的小部件。
///
/// [future]必须较早获得，例如在[State.initState]，[State.didUpdateWidget]或[State.didChangeDependencies]期间。
/// 构造[FutureBuilder]时，不得在[State.build]或[StatelessWidget.build]方法调用期间创建它。
/// 如果[future]与[FutureBuilder]同时创建，则每次重新构建[FutureBuilder]的父代时，异步任务都将重新启动。
///
/// 一般准则是假设每个`build`方法都可以在每一帧调用，并将忽略的调用视为优化。
///
///  ## 时间
///小部件重建是使用[State.setState]在将来的完成时进行安排的，但是与未来的时机无关。
///由Flutter管道决定是否调用[builder]回调，因此将接收快照的与时间有关的子序列，这些子序列表示与未来的交互。
///
/// 这样的副作用是，为[FutureBuilder]提供了一个新的但已经完成的未来，将导致单个帧处于[ConnectionState.waiting]状态。
/// 这是因为无法同步确定[Future]已完成。
///
/// ##建造者合同
///
/// 对于成功完成数据的未来，假设initialData 为null，将使用以下两个快照之一或仅使用后者来调用构建器：
/// new AsyncSnapshot<String>.withData(ConnectionState.waiting, null)
/// new AsyncSnapshot<String>.withData(ConnectionState.done, 'some data')
///
/// 如果相同的将来完成时出现错误，则将同时调用或仅调用后者的构建器：
/// new AsyncSnapshot<String>.withData(ConnectionState.waiting, null)
/// new AsyncSnapshot<String>.withError(ConnectionState.done, 'some error')
///
/// 可以通过指定initialData来控制初始快照数据。
/// 您将使用此工具来确保如果在将来完成之前调用了构建器，则快照将携带您选择的数据，而不是默认的空值。
///
/// 快照的数据和错误字段仅在连接状态字段从“正在等待”过渡到“完成”时更改，并且在将[FutureBuilder]配置更改为另一个将来时将保留它们。
/// 如果旧的future已经如上所述成功地完成了数据，那么将配置更改为新的future将产生以下形式的快照对：
///
/// new AsyncSnapshot<String>.withData(ConnectionState.none, 'data of first future')
/// new AsyncSnapshot<String>.withData(ConnectionState.waiting, 'data of second future')
///
/// 通常，仅当新的未来不为空时才生成后者，而仅当旧的未来不为空时才生成前者。
///
/// [FutureBuilder]的行为与配置有`future？.asStream（）的[StreamBuilder]相同，
/// 不同之处在于后者可能会显示带有“ ConnectionState.active”的快照，具体取决于流的实现方式。



class FutureBuilderDemo extends StatefulWidget{
  @override
  _FutureBuilderDemoState createState() => _FutureBuilderDemoState();
}

/// FutureBuilder的Flutter代码示例
class _FutureBuilderDemoState extends State<FutureBuilderDemo> {
  Future<String> _calculation = Future<String>.delayed(
    Duration(seconds: 2),
        () => 'Data Loaded',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'FutureBuilder',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: DefaultTextStyle(
        style: Theme.of(context).textTheme.bodyText2,
        textAlign: TextAlign.center,
        ///此示例显示了FutureBuilder，它在加载数据时显示加载微调器。
        ///它显示了一个成功的图标和文本，如果未来完成与结果，或者错误图标和文本未来出错完成。
        ///假设_calculation通过在UI的其他位置按下按钮来设置该字段。
        child: FutureBuilder<String>(
          future: _calculation, // 先前获得的Future <String>或null
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            List<Widget> children;
            if (snapshot.hasData) {
              children = <Widget>[
                Icon(
                  Icons.check_circle_outline,
                  color: Colors.green,
                  size: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text('Result: ${snapshot.data}'),
                )
              ];
            }
            else if (snapshot.hasError) {
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
              children = <Widget>[
                SizedBox(
                  child: CircularProgressIndicator(),
                  width: 60,
                  height: 60,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text('等待结果...'),
                )
              ];
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: children,
              ),
            );
          },
        ),
      ),
    );
  }
}


