import 'dart:convert';
import 'package:alice/common/const/api.dart';
import 'package:alice/common/network/dio_util.dart';
import 'package:alice/model/chat_message.dart';
import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:alice/widgets/library/bubble.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ChatRobotList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ChatRobotListState();
}

class ChatRobotListState extends State<ChatRobotList> {
  ScrollController _scrollController;
  TextEditingController _controller;

  List<String> chatContentList = List();

  ChatMessage chatMessage;

  bool isSendMsg = false;

  void sendMsg() {
    if (_controller.text.trim() != '') {
      fetchChatMessageData(_controller.text);
    } else {
      Fluttertoast.showToast(msg: '请输入聊天消息');
    }
  }

  void fetchChatMessageData(String msg) async {
    Response response = await DioUtil.getInstance().createQykDio().get(
      Api.chatRobot,
      queryParameters: {
        "key": 'free',
        "appid": 0,
        "msg": msg,
      },
    );
    print('数据点位：' + response.data);
    chatMessage = ChatMessage.fromJson(jsonDecode(response.data));
    if (chatMessage.result == 0) {
      //print('数据点位：' + chatMessage.content);
      if (mounted) {
        setState(() {
          chatContentList.add(_controller.text);
          chatContentList.add(chatMessage.content);
          _controller.clear();

          ///使位置从当前值到给定值的动画。
          ///任何活动的动画都将被取消。如果用户当前正在滚动，则该操作将被取消。
          ///返回的[Future]将在动画结束时完成，无论它是否成功完成或是否被过早中断。
          ///每当用户尝试手动滚动，启动其他活动，或者动画到达视口边缘并尝试过度滚动时，动画都会中断。
          ///（如果[ScrollPosition]不会过度滚动，而是允许滚动超出范围，那么超出范围不会中断动画。）
          ///动画对视口或内容尺寸的更改无动于衷。
          ///动画完成后，如果滚动值不稳定，滚动位置将尝试开始弹道活动（例如，如果滚动超出范围，则在这种情况下滚动位置通常会弹回）
          ///持续时间不能为零。要在没有动画的情况下跳至特定值，请使用[jumpTo]。
          /*_scrollController.animateTo(
              _scrollController.position.maxScrollExtent,  //底部
              duration: Duration(milliseconds: 500),
              curve: Curves.decelerate,
          );*/
          ///将滚动位置从当前值跳到给定值，
          ///没有动画，也没有检查新值是否在范围内。
          ///任何活动动画都将被取消。如果用户当前正在滚动，则取消该操作。
          ///如果此方法更改滚动位置，将发送一系列开始/更新/结束滚动通知。此方法不能生成过滚动通知。
          ///跳跃后，立即开始弹道活动，以防数值超出范围。
          _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
          //isSendMsg = false;
        });
      }
    } else {
      Fluttertoast.showToast(msg: '${chatMessage.content}');
    }
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(
        label: '菲菲',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: chatListView(),
      bottomSheet: bottomChatInputBox(),
    );
  }

  Widget chatListView() {
    return ListView.builder(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 80),
      controller: _scrollController,
      itemCount: chatContentList.length,
      itemBuilder: (context, index) {
        if (index % 2 == 0) {
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
                      child: Text(chatContentList[index]),
                    ),
                  ),
                ),
                Card(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.network(
                      'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=303910746,3565305595&fm=26&gp=0.jpg',
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
                      'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1721381929,3931115005&fm=26&gp=0.jpg',
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                ///这里使用 [Expanded] 效果不好 使用 [Flexible]
                ///强制孩子填充可用空间。 [Expanded]小部件将这种[FlexFit]分配给其子级。
                ///这个孩子最多可以和可用空间一样大（但可以更小）。[Flexible]小部件将这种[FlexFit]分配给其子级。
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(4, 15, 0, 0),
                    child: Bubble(
                      elevation: 0.5,
                      nip: BubbleNip.leftTop,
                      child: Text(chatContentList[index]),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }

  ///使用 bottomSheet 软件盘可以正常顶起输入框 bottomNavigationBar 无效
  Widget bottomChatInputBox() {
    return Container(
      //color: Colors.lightBlueAccent,
      height: 56,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 40,
              margin: EdgeInsets.fromLTRB(12, 4, 12, 4),
              padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
              decoration: ShapeDecoration(
                color: Colors.grey[50],
                shape: StadiumBorder(),
              ),
              child: TextField(
                controller: _controller,
                style: TextStyle(color: Colors.black, fontSize: 14),
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
              onPressed: isSendMsg ? null : () => sendMsg(),
              child: Text('发送'),
            ),
          ),
        ],
      ),
    );
  }

}
