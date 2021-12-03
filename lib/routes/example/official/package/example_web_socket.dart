import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:web_socket_channel/io.dart';
import 'package:flutter/material.dart';

class ExampleWebSocket extends StatefulWidget{
  @override
  _ExampleWebSocketState createState() => _ExampleWebSocketState();
}

class _ExampleWebSocketState extends State<ExampleWebSocket> {
  String result;


  @override
  void initState() {

    super.initState();
  }

  @override
  void didChangeDependencies() {
    startWebSocket();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'WebSocket',
        onPressedBack: () => Navigator.pop(context),
      ),
    );
  }
}

void startWebSocket() async {
  final channel = IOWebSocketChannel.connect("wss://echo.websocket.org");
  channel.sink.add("连接成功!");

  ///将订阅添加到此流。
  ///
  ///返回一个[StreamSubscription]，该流使用提供的[onData]，[onError]和[onDone]处理程序处理此流中的事件。
  ///可以在订阅上更改处理程序，但是它们从提供的功能开始。
  ///
  ///在此流中的每个数据事件上，都将调用订阅者的[onData]处理程序。如果[onData]为'null'，则什么也不会发生。
  ///
  /// 对于来自此流的错误，将使用错误对象以及可能的堆栈跟踪调用[onError]处理程序。
  ///
  ///  [onError]回调必须为`void onError（Object error）`或`void onError（Object error，StackTrace stackTrace）`类型。
  ///  如果[onError]接受两个参数，则使用错误对象和堆栈跟踪来调用（如果此流本身在没有堆栈跟踪的情况下接收到错误，则可能为“ null”）。否则，仅使用错误对象来调用。
  ///如果省略[onError]，则此流上的任何错误都将被视为未处理，并将传递给当前[Zone]的错误处理程序。
  /// 默认情况下，未处理的异步错误被视为未捕获的顶级错误。
  ///
  /// 如果此流关闭并发送完成事件，则将调用[onDone]处理程序。如果[onDone]为'null'，则什么也不会发生。
  ///
  ///如果[cancelOnError]为true，则在传递第一个错误事件时，订阅将自动取消。默认值为“ false”。
  ///
  /// 暂停订阅或取消订阅时，订阅不会接收事件，并且不会调用任何事件处理函数。
  channel.stream.listen((message) {
    print('数据点位: ${message.toString()}');
  });

}

