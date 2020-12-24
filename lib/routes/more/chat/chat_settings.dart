import 'package:alice/common/global/theme_mode.dart';
import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatSettingsRoute extends StatefulWidget {
  @override
  _ChatSettingsRouteState createState() => _ChatSettingsRouteState();
}

class _ChatSettingsRouteState extends State<ChatSettingsRoute> {
  bool _isSaveChatHistory;

  @override
  void initState() {
    _isSaveChatHistory = AppThemeMode.isSaveChat;
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
              trailing: Switch(
                value: _isSaveChatHistory,
                onChanged: (bool value) {
                  if(mounted){
                    setState(() {
                      _isSaveChatHistory = value;
                      Provider.of<AppThemeMode>(context, listen: false).switchSaveChatHistory(_isSaveChatHistory);
                    });
                  }
                },
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('设置聊天头像',style: TextStyle(fontSize: 16),),
              onTap: (){

              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('设置聊天背景',style: TextStyle(fontSize: 16),),
              onTap: (){
                Navigator.pushNamed(context, '/setChatBackgroundRoute');
              },
            ),
          ),
        ],
      ),
    );
  }
}
