import 'package:alice/ui/cupertino/cupertino_home.dart';
import 'package:alice/ui/more/setting/switch_drak.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SettingPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SettingPageState();

}


class _SettingPageState extends State<SettingPage> {
  bool isMaterial = true;
  bool isCupertino = false;

  switchToMaterialTheme(bool value){
    if(value == true){
      Fluttertoast.showToast(msg: '当前主题已为Material');
    }else{
      Fluttertoast.showToast(msg: '默认主题就这样了，o(╯□╰)o');
    }
    if(mounted){
      setState(() {
        isMaterial = value;
      });
    }
  }

  switchToCupertinoTheme(bool value){
    if(value == true){
      Fluttertoast.showToast(msg: '进入库比蒂诺主题App');
      //Navigator.push(context, MaterialPageRoute(builder: (context) => QueryMobilePhoneNumberHomeView()));
      Navigator.push(context, CupertinoPageRoute(builder: (_) => MyCupertinoApp()));
    }
    if(mounted){
      setState(() {
        isCupertino = value;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded,color: Colors.black,),
            onPressed: (){
              Navigator.pop(context);
            },
        ),
        title: Text(
          '设置',
          style: TextStyle(color: Colors.black, fontSize: 18,),
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(height: 10,),
            SwitchDark(),
            switchMaterialTheme(),
            switchCupertinoTheme(),
            //CupertinoApp(),
          ],
        ),
      ),
    );
  }

  Widget switchMaterialTheme() {
    return Card(
      child: Row(
        children: [
          Container(
            width: 16,
            height: 50,
          ),
          Text('Material 主题'),
          Expanded(child: Container()),
          Switch(
            value: isMaterial,
            onChanged: switchToMaterialTheme,
          ),
          Container(
            width: 16,
          ),
        ],
      ),
    );
  }

  Widget switchCupertinoTheme() {
    return Card(
      child: Row(
        children: [
          Container(
            width: 16,
            height: 50,
          ),
          Text('Cupertino 主题'),
          Expanded(child: Container()),
          CupertinoSwitch(
            value: isCupertino,
            onChanged: switchToCupertinoTheme,
          ),
          Container(
            width: 16,
          ),
        ],
      ),
    );
  }

}






