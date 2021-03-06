import 'package:alice/common/const/routes.dart';
import 'package:alice/routes/more/setting/switch_cupertino.dart';
import 'package:alice/routes/more/setting/switch_drak.dart';
import 'package:alice/routes/more/setting/switch_material.dart';
import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: MyAppBar(
          label: '设置',
          onPressedBack: ()=> Navigator.pop(context, 'refresh'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(height: 10),
              SwitchDark(),
              SwitchMaterialTheme(),
              SwitchCupertinoTheme(),
              GestureDetector(
                onTap: ()=> Navigator.pushNamed(context, RouteName.multiLanguage),
                child: Card(
                  child: Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: Row(
                      children: [
                        Text('国际化支持'),
                        Expanded(child: Container()),
                        Icon(Icons.arrow_forward_ios_rounded,size: 16,),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                child: Card(
                  child: Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: Row(
                      children: [
                        Text('应用更新'),
                        Expanded(child: Container()),
                        Icon(Icons.arrow_forward_ios_rounded,size: 16,),
                      ],
                    ),
                  ),
                ),
                onTap: ()=> Navigator.pushNamed(context, RouteName.appUpdateRoute),
              ),
            ],
          ),
        ),
      ),
      onWillPop: () async {
        Fluttertoast.showToast(msg: '请点击左上角箭头返回(确保设置生效)');
        return false;
      },
    );
  }
}
