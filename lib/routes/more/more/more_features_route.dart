import 'package:alice/model/bingwallpaper.dart';
import 'package:alice/widgets/custom/custom_scroll_behavior.dart';
import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MoreFeaturesListRoute extends StatefulWidget {
  @override
  _MoreFeaturesListRouteState createState() => _MoreFeaturesListRouteState();
}

class _MoreFeaturesListRouteState extends State<MoreFeaturesListRoute> {
  List<String> functionTitleList = [
    '每日一文',
    '壁纸',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: '更多功能',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: ScrollConfiguration(
        behavior: CustomScrollBehavior(),
        child: ListView.builder(
          padding: EdgeInsets.fromLTRB(12, 16, 12, 16),
          itemCount: functionTitleList.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.fromLTRB(4, 6, 4, 6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () => jumpToPage(index),
                child: ListTile(
                  title: Text(functionTitleList[index]),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void jumpToPage(int index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/articleOfTheDayRoute');
        break;
      case 1:
        showDialogBox();
        break;
    }
  }

  void showDialogBox() {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text('选择数据源',style: TextStyle(fontSize: 16),),
          children: [
            InkWell(
              onTap: (){
                Fluttertoast.showToast(msg: 'gdgd');
              },
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 12, 0, 12),
                child: Row(
                  children: [
                    Image.asset('assets/icons/icon_phone.png',width: 30,),
                    SizedBox(width: 16),
                    Text('手机壁纸'),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Fluttertoast.showToast(msg: 'gdgd');
              },
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 12, 0, 12),
                child: Row(
                  children: [
                    Image.asset('assets/icons/icon_computer.png',width: 30,),
                    SizedBox(width: 16),
                    Text('电脑壁纸'),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Fluttertoast.showToast(msg: 'gdgd');
              },
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 12, 0, 12),
                child: Row(
                  children: [
                    Image.asset('assets/icons/icon_little_bird.png',width: 30,),
                    SizedBox(width: 16),
                    Text('小鸟壁纸'),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

