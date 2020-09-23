import 'package:alice/common/custom_scroll_behavior.dart';
import 'package:alice/ui/more/bing_wallpaper.dart';
import 'package:alice/ui/more/chat_robot_screen.dart';
import 'package:alice/ui/more/english_quotations.dart';
import 'package:alice/ui/more/guide/guide_example_route.dart';
import 'package:alice/ui/more/guide/guide_route.dart';
import 'package:alice/ui/more/joke/life_interest_chart.dart';
import 'package:alice/ui/more/query_mobile_phon_number_home.dart';
import 'package:alice/ui/more/tao_model_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


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
      body: ScrollConfiguration(
        behavior: CustomScrollBehavior(true, true, Colors.cyan[300]),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(4),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => QueryMobilePhoneNumberHomeView()));
                    },
                    splashColor: Colors.cyan[50],
                    child: ListTile(
                      leading: Image.asset(
                        'assets/icons/icon_search.png',
                        width: 24,
                        height: 24,
                      ),
                      title: Text('查询手机号码归属地'),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(4),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => EnglishQuotations()));
                    },
                    splashColor: Colors.cyan[50],
                    child: ListTile(
                      leading: Image.asset('assets/icons/icon_record.png',
                          width: 24, height: 24),
                      title: Text('英文励志语录'),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(4),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => BingWallpaperView()));
                    },
                    splashColor: Colors.cyan[50],
                    child: ListTile(
                      leading: Image.asset(
                        'assets/icons/icon_camera.png',
                        width: 24,
                        height: 24,
                      ),
                      title: Text('必应壁纸'),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(4),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ChatRobotScreen()));
                    },
                    splashColor: Colors.cyan[50],
                    child: ListTile(
                      leading: Image.asset(
                        'assets/icons/icon_chat.png',
                        width: 24,
                        height: 24,
                      ),
                      title: Text('智能聊天机器人菲菲'),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(4),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => TaoModel()));
                    },
                    splashColor: Colors.cyan[50],
                    child: ListTile(
                      leading: Image.asset(
                        'assets/icons/icon_placeholder.png',
                        width: 24,
                        height: 24,
                      ),
                      title: Text('淘女郎模特'),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(4),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LifeInterestChartRoute()));
                    },
                    splashColor: Colors.cyan[50],
                    child: ListTile(
                      leading: Image.asset(
                        'assets/icons/icon_placeholder.png',
                        width: 24,
                        height: 24,
                      ),
                      title: Text('生活趣图'),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(4),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => GuideExampleRoute()));
                    },
                    splashColor: Colors.cyan[50],
                    child: ListTile(
                      leading: Image.asset(
                        'assets/icons/icon_edit.png',
                        width: 24,
                        height: 24,
                      ),
                      title: Text('示例代码'),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(4),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => GuideRoute()));
                    },
                    splashColor: Colors.cyan[50],
                    child: ListTile(
                      leading: Image.asset(
                        'assets/icons/icon_toolbox.png',
                        width: 24,
                        height: 24,
                      ),
                      title: Text('复杂业务的Flutter插件'),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(4),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      //Fluttertoast.showToast(msg: 'Alice已停止运行');
                      ///从导航器中弹出最紧密地包围给定上下文的最上面的路线。
                      //Navigator.pop(context);
                      ///在最紧紧围绕给定上下文的导航器上反复调用[pop]，直到predicate返回true。
                      /*Navigator.popUntil(
                      context,
                      ///如果该路由具有指定的名称并且弹出该路由将不会产生相同的路由，
                      ///即，如果该路由的[willHandlePopInternally]属性为false，则返回一个谓词为true。
                      ///此功能通常与[Navigator.popUntil（）]一起使用。
                      ModalRoute.withName('home')*/ /*(route) => route == null*/ /*);*/

                      ///以上两种方式 效果对于此处来说差不多 都显示黑屏页面
                    },
                    splashColor: Colors.cyan[50],
                    child: ListTile(
                      leading: Image.asset(
                        'assets/icons/icon_footmark.png',
                        width: 24,
                        height: 24,
                      ),
                      title: Text('退出'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
