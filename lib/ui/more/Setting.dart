import 'package:alice/ui/more/setting/switch_drak.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SettingPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SettingPageState();

}


class _SettingPageState extends State<SettingPage> {
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
          ],
        ),
      ),
    );
  }
}




