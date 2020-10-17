import 'package:alice/ui/more/setting/switch_cupertino.dart';
import 'package:alice/ui/more/setting/switch_drak.dart';
import 'package:alice/ui/more/setting/switch_material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context, 'refresh');
            },
          ),
          title: Text(
            '设置',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          centerTitle: true,
          elevation: 1,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(height: 10),
              SwitchDark(),
              SwitchMaterialTheme(),
              SwitchCupertinoTheme(),
              //SwitchIconStyle(),
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
