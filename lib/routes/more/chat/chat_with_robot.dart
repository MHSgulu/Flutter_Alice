import 'dart:io';

import 'package:alice/common/global/theme_mode.dart';
import 'package:alice/common/network/http_util.dart';
import 'package:alice/common/util/data_base_util.dart';
import 'package:alice/common/util/sp_util.dart';
import 'package:alice/model/chat_message.dart';
import 'package:alice/routes/more/chat/chat_settings.dart';
import 'package:alice/widgets/custom/custom_scroll_behavior.dart';
import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:alice/widgets/library/bubble.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

class Message {
  final int identifier; //0 代表用户  1代表机器人
  final String content;
  Message(this.identifier, this.content);
}

class ChatRobotList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ChatRobotListState();
}

class ChatRobotListState extends State<ChatRobotList> {
  ScrollController _scrollController;
  TextEditingController _controller;
  List<Message> messageList = List();
  ChatMessage chatMessage;
  Database db;
  String chatBgImagePath;
  bool isOnlyReady = false;

  @override
  void initState() {
    _scrollController = ScrollController();
    _controller = TextEditingController();
    if (AppThemeMode.isSaveChat) {
      //当前需要获取聊天历史
      getChatHistory();
    }
    getChatBackgroundImage();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    _controller?.dispose();
    if (AppThemeMode.isSaveChat) {
      //当前需要保存聊天历史
      operatingDatabase();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isOnlyReady
          ? PreferredSize(
              child: SafeArea(
                child: Container(),
              ),
              preferredSize: Size.fromHeight(0),
            )
          : MyAppBar(
              label: '菲菲',
              onPressedBack: () => Navigator.pop(context),
              actions: [
                IconButton(
                  icon: Image.asset(
                    'assets/icons/icon_chat_setting.png',
                    width: 24,
                  ),
                  onPressed: () => jumpToPage(),
                ),
              ],
            ),
      body: chatListView(),
      bottomSheet: isOnlyReady ? Container(height: 0) : bottomChatInputBox(),
    );
  }

  Widget chatListView() {
    return ChangeNotifierProvider(
      create: (context) => AppThemeMode(),
      child: Consumer<AppThemeMode>(
        builder: (context, theme, child) => Container(
          decoration: AppThemeMode.isTurnOnChatBackground
              ? chatBgImagePath == null
                  ? BoxDecoration()
                  : BoxDecoration(
                      image: DecorationImage(
                        image: FileImage(File(chatBgImagePath)),
                        fit: BoxFit.cover,
                        //加载[image]时发出的错误的可选错误回调。
                        onError: (dynamic exception, StackTrace stackTrace) {
                          print('数据点位: exception: $exception');
                          print('数据点位: stackTrace: $stackTrace');
                        },
                      ),
                    )
              : BoxDecoration(),
          child: ScrollConfiguration(
            behavior: CustomScrollBehavior(),
            child: ListView.builder(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 80),
              controller: _scrollController,
              itemCount: messageList.length,
              itemBuilder: (context, index) {
                if (messageList[index].identifier == 0) {
                  return Container(
                    margin: EdgeInsets.fromLTRB(66, 8, 12, 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ///这里使用 [Expanded] 效果不好 使用 [Flexible]
                        ///强制孩子填充可用空间。 [Expanded]小部件将这种[FlexFit]分配给其子级。
                        ///这个孩子最多可以和可用空间一样大（但可以更小）。[Flexible]小部件将这种[FlexFit]分配给其子级。
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(0, 15, 4, 0),
                            child: Bubble(
                              elevation: 0.5,
                              nip: BubbleNip.rightTop,
                              color: Colors.lightBlue,
                              child: Text(
                                messageList[index].content,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Card(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.network(
                              'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=574971970,2943644506&fm=26&gp=0.jpg',
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Container(
                    margin: EdgeInsets.fromLTRB(12, 8, 66, 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Card(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.network(
                              'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2987585290,3939268306&fm=26&gp=0.jpg',
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(4, 15, 0, 0),
                            child: Bubble(
                              elevation: 0.5,
                              nip: BubbleNip.leftTop,
                              child: Text(
                                messageList[index].content,
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  ///使用 bottomSheet 软件盘可以正常顶起输入框 bottomNavigationBar 无效
  Widget bottomChatInputBox() {
    return Container(
      //color: Colors.lightBlueAccent,
      height: 50,
      child: Column(
        children: [
          Divider(height: 0),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 40,
                  margin: EdgeInsets.fromLTRB(12, 4, 12, 4),
                  padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: StadiumBorder(),
                  ),
                  child: TextField(
                    controller: _controller,
                    style: TextStyle(color: Colors.black, fontSize: 14),
                    onTap: () => layoutAdjustment(),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '点击此处输入聊天信息',
                      hintStyle: TextStyle(color: Colors.black54, fontSize: 14),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 12),
                child: ElevatedButton(
                  onPressed: () => sendMsg(),
                  onLongPress: () => enterReadOnlyMode(),
                  child: Text('发送'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void sendMsg() {
    if (_controller.text.trim().isNotEmpty) {
      if (mounted) {
        setState(() {
          messageList.add(Message(0, _controller.text));
        });
      }
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      fetchChatMessageData(_controller.text);
      _controller.clear();
    } else {
      Fluttertoast.showToast(msg: '请输入聊天消息');
    }
  }

  void fetchChatMessageData(String msg) async {
    var json = await HttpUtil.requestChatMessage(msg);
    chatMessage = ChatMessage.fromJson(json);
    if (chatMessage.result == 0) {
      //print('数据点位：' + chatMessage.content);
      if (mounted) {
        setState(() {
          //如果此字符串包含[other]的匹配项，则返回true
          if (chatMessage.content.contains('{br}')) {
            //用[replace]替换所有与[from]匹配的子字符串。
            String newMessage = chatMessage.content.replaceAll('{br}', '\n');
            messageList.add(Message(1, newMessage));
          } else {
            messageList.add(Message(1, chatMessage.content));
          }
        });
      }
      //测试手机每行消息的长度大约在12个字符，所以针对超出两行消息的，自适应增加距离
      //增加距离是因为持久性底部遮挡,加上不确定消息文本长度带来的高度增加,设置一个大数值
      if (chatMessage.content.length < 12 * 2) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent + 150.0,
          duration: Duration(milliseconds: 500),
          curve: Curves.decelerate,
        );
      } else {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent + 9999,
          duration: Duration(milliseconds: 500),
          curve: Curves.decelerate,
        );
      }
    } else {
      Fluttertoast.showToast(msg: '${chatMessage.content}');
    }
  }

  void layoutAdjustment() {
    //沿轴向相反方向偏移子代的像素数。
    //print("当前移动的像素数: _scrollController.position.pixels: ${_scrollController.position.pixels}");
    //print("_scrollController.position.maxScrollExtent: ${_scrollController.position.maxScrollExtent}");
    if (messageList.length >= 4) {
      ///弹出软键盘，一开始的消息列表并不是最下方，需要手动滚动最下方  手动调出一个大概数值 总体效果不太理想 暂且放下
      _scrollController
          .jumpTo(_scrollController.position.maxScrollExtent + 400);
    }
  }

  void operatingDatabase() async {
    var result = await DataBaseUtil.checkTableExists('chat_history.db');
    var path = await DataBaseUtil.fetchDatabasesPath('chat_history.db');
    if (result) {
      await deleteDatabase(path);
    }
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE ChatHistory (id INTEGER PRIMARY KEY, tag INTEGER, content TEXT)');
    });
    await db.transaction((txn) async {
      messageList.forEach((e) async {
        ///将消息列表的数据循环插入到数据库中
        await txn.rawInsert(
            'INSERT INTO ChatHistory(tag, content) VALUES(?, ?)',
            [e.identifier, e.content]);
      });
    });
    List<Map> list = await db.rawQuery('SELECT * FROM ChatHistory');
    print("数据点位: 已存储的聊天记录:  $list");
    await db.close();
  }

  void getChatHistory() async {
    var result = await DataBaseUtil.checkTableExists('chat_history.db');
    //print("数据点位: chat_history.db是否存在: $result");
    var path = await DataBaseUtil.fetchDatabasesPath('chat_history.db');
    if (result) {
      db = await openDatabase(path);
      //获取记录
      List<Map> list = await db.rawQuery('SELECT * FROM ChatHistory');
      print("数据点位: 数据库中的聊天记录:  $list");
      /*Map<String, dynamic> map0 = list[0];
      print("数据点位: map0:  $map0");
      var keys = map0.keys;
      print("数据点位: keys:  $keys");
      var values = map0.values;
      print("数据点位: values:  $values");
      var first = map0.values.first;
      print("数据点位: first:  $first");
      var second = map0.values.elementAt(1);
      print("数据点位: second:  $second");
      var last = map0.values.last;
      print("数据点位: last:  $last");*/
      if (list.isNotEmpty) {
        if (mounted) {
          setState(() {
            ///将数据库中的数据循环插入到消息列表
            list.forEach((element) {
              messageList.add(Message(
                  int.parse(element.values.elementAt(1).toString()),
                  element.values.last.toString()));
            });
          });
        }
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent + 99999,
          duration: Duration(milliseconds: 300),
          curve: Curves.decelerate,
        );
      }
    }
  }

  void getChatBackgroundImage() async {
    chatBgImagePath =
        await SharedPreferencesUtil.getInstance().fetchChatBackgroundImage();
    print('数据点位: chatBgImagePath: $chatBgImagePath');
  }

  void jumpToPage() {
    //Navigator.pushNamed(context, '/chatSettingsRoute');
    Navigator.push(context, _createSettingsRoute()).then((value) {
      if (value == 'updateBgImage') {
        if (mounted) {
          setState(() {
            getChatBackgroundImage();
          });
        }
      }
    });
  }

  void enterReadOnlyMode() {
    Fluttertoast.showToast(msg: '按下返回键即可退出只读模式');
    if (mounted) {
      setState(() {
        isOnlyReady = true;
      });
    }
  }
}

Route _createSettingsRoute() {
  return PageRouteBuilder<void>(
    pageBuilder: (context, animation, secondaryAnimation) =>
        ChatSettingsRoute(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        SharedAxisTransition(
      fillColor: Colors.transparent,
      transitionType: SharedAxisTransitionType.scaled,
      animation: animation,
      secondaryAnimation: secondaryAnimation,
      child: child,
    ),
    transitionDuration: Duration(milliseconds: 300),
    reverseTransitionDuration: Duration(milliseconds: 300),
  );
}

//返回此字符串中[pattern]的第一个匹配项的位置，从[start]开始。
// 如果未找到匹配项，则返回-1。
// [start]必须为非负且不大于[length]。
//chatMessage.content.indexOf('{br}');

///使位置从当前值到给定值的动画。
///任何活动的动画都将被取消。如果用户当前正在滚动，则该操作将被取消。
///返回的[Future]将在动画结束时完成，无论它是否成功完成或是否被过早中断。
///每当用户尝试手动滚动，启动其他活动，或者动画到达视口边缘并尝试过度滚动时，动画都会中断。
///（如果[ScrollPosition]不会过度滚动，而是允许滚动超出范围，那么超出范围不会中断动画。）
///动画对视口或内容尺寸的更改无动于衷。
///动画完成后，如果滚动值不稳定，滚动位置将尝试开始弹道活动（例如，如果滚动超出范围，则在这种情况下滚动位置通常会弹回）
///持续时间不能为零。要在没有动画的情况下跳至特定值，请使用[jumpTo]。
///
/// scrollController.animateTo

///将滚动位置从当前值跳到给定值，
///没有动画，也没有检查新值是否在范围内。
///任何活动动画都将被取消。如果用户当前正在滚动，则取消该操作。
///如果此方法更改滚动位置，将发送一系列开始/更新/结束滚动通知。此方法不能生成过滚动通知。
///跳跃后，立即开始弹道活动，以防数值超出范围。
///
/// scrollController.jumpTo

///系统的UI（通常是设备的键盘）完全遮住了显示部分。
///当可见移动设备的键盘时，“ viewInsets.bottom”对应于键盘的顶部。
///此值独立于[padding]和[viewPadding]。 viewPadding是从[MediaQuery]小部件边界的边缘测量的。
///填充是根据viewPadding和viewInsets计算的。
///[WidgetsApp]创建的顶级MediaQuery的边界与包含该应用程序的窗口（通常是移动设备屏幕）的边界相同。
/// 也可以看看：
/// * [ui.window]，它提供了有关此属性及其与[padding]和[viewPadding]的关系的其他详细信息。
///
/// MediaQuery.of(context).viewInsets.bottom;

///  FocusScope.of(context).requestFocus(FocusNode()); //收起软键盘
