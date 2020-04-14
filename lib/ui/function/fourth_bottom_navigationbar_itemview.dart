import 'package:alice/ui/function/bing_wallpaper.dart';
import 'package:alice/ui/function/query_mobile_phon_number_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




/*展示模块*/
class FourthBottomNavigationBarItemView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('展示'),
        backgroundColor: Colors.cyan[300],
      ),
      //SingleChildScrollView类似于Android中的ScrollView，它只能接收一个子组件
      //通过默认构造函数构建的ListView没有应用基于Sliver的懒加载模型。实际上通过此方式创建的ListView和使用SingleChildScrollView+Column的方式没有本质的区别
      //Material设计规范中状态栏、导航栏、ListTile高度分别为24、56、56
      body:SingleChildScrollView(
        child:  Container(
          padding: EdgeInsets.all(8.0),
          child:Column(
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  //print('活动时间混分巨兽');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QueryMobilePhoneNumberHomeView()),
                  );
                },
                child: Card(
                  child: ListTile(
                    leading: Icon(Icons.phone_iphone),
                    title: Text('查询手机号码归属地'),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BingWallpaperView()),
                  );
                },
                child: Card(
                  child: ListTile(
                    leading:  Icon(Icons.wallpaper),
                    title: Text('必应壁纸'),
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  leading:  Icon(Icons.chat_bubble),
                  title: Text('智能聊天机器人菲菲'),
                ),
              ),
              Card(
                child: ListTile(
                  leading:  Icon(Icons.android),
                  title: Text('待后续增加的功能'),
                ),
              ),
              Card(
                child: ListTile(
                  leading:  Icon(Icons.android),
                  title: Text('待后续增加的功能'),
                ),
              ),
              Card(
                child: ListTile(
                  leading:  Icon(Icons.android),
                  title: Text('待后续增加的功能'),
                ),
              ),
              Card(
                child: ListTile(
                  leading:  Icon(Icons.android),
                  title: Text('待后续增加的功能'),
                ),
              ),
              Card(
                child: ListTile(
                  leading:  Icon(Icons.android),
                  title: Text('待后续增加的功能'),
                ),
              ),
              Card(
                child: ListTile(
                  leading:  Icon(Icons.android),
                  title: Text('待后续增加的功能'),
                ),
              ),
              Card(
                child: ListTile(
                  leading:  Icon(Icons.android),
                  title: Text('待后续增加的功能'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}