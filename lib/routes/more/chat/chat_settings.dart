import 'package:alice/common/global/theme_mode.dart';
import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatSettingsRoute extends StatefulWidget {
  @override
  _ChatSettingsRouteState createState() => _ChatSettingsRouteState();
}

class _ChatSettingsRouteState extends State<ChatSettingsRoute> {
  bool _isSaveChatHistory; //是否保存聊天历史记录
  bool _isTurnOnChatBackground; //是否开启自定义聊天背景

  @override
  void initState() {
    _isSaveChatHistory = AppThemeMode.isSaveChat;
    _isTurnOnChatBackground = AppThemeMode.isTurnOnChatBackground;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: '聊天设置',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: Text('保存聊天记录',style: TextStyle(fontSize: 16),),
              subtitle: Text('聊天页面里长按输入框右边的发送按钮即可进入只读模式',style: TextStyle(fontSize: 12),),
              trailing: Switch(
                value: _isSaveChatHistory,
                onChanged: switchChatHistory,
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('开启自定义聊天背景',style: TextStyle(fontSize: 16),),
              subtitle: Text('开启后将进入设置页面（初次设置点击保存即可更换聊天背景），关闭后为空白背景',style: TextStyle(fontSize: 12),),
              trailing: Switch(
                value: _isTurnOnChatBackground,
                onChanged: switchChatBg,
              ),
            ),
          ),
        ],
      ),
    );
  }


  void switchChatHistory(bool value) {
    if(mounted){
      setState(() {
        _isSaveChatHistory = value;
        Provider.of<AppThemeMode>(context, listen: false).switchSaveChatHistory(_isSaveChatHistory);
      });
    }
  }

  void switchChatBg(bool value) {
    if(mounted){
      setState(() {
        _isTurnOnChatBackground = value;
        Provider.of<AppThemeMode>(context, listen: false).switchChatBackground(_isTurnOnChatBackground);
      });
    }
    if(value){
      Navigator.pushNamed(context, '/setChatBackgroundRoute').then((value) {
        if(value == 'updateBgImage'){
          Navigator.pop(context,'updateBgImage');
        }
      });
    }
  }


}
