import 'package:alice/ui/function/bing_wallpaper.dart';
import 'package:alice/ui/function/query_mobile_phon_number_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:device_info/device_info.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'util/photo_view_single_screen.dart';


void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}


class MyApp extends StatelessWidget {
  static const String _title = 'Alcie';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: HomeScreenStatefulWidget(),
    );
  }
}


/*首页*/
class HomeScreenStatefulWidget extends StatefulWidget {
  HomeScreenStatefulWidget({Key key}) : super(key: key);

  @override
  _HomeScreenStatefulWidgetState createState() => _HomeScreenStatefulWidgetState();
}

class _HomeScreenStatefulWidgetState extends State<HomeScreenStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  List<Widget> _widgetOptions = <Widget>[
    FirstBottomNavigationBarItemView(),
    SecondBottomNavigationBarItemView(),
    ThirdBottomNavigationBarItemView(),
    FourthBottomNavigationBarItemView(),
  ];


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex),/*_widgetOptions[_selectedIndex],*/
      ),
      bottomNavigationBar: BottomNavigationBar(
        //type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.black54,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.description),
            title: Text('新闻'),
            backgroundColor: Colors.redAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            title: Text('电影'),
            backgroundColor: Colors.teal,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mood),
            title: Text('笑话'),
            backgroundColor: Colors.deepOrangeAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more),
            title: Text('更多'),
            backgroundColor: Colors.cyan,/*blueGrey*/
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}


/*新闻模块*/
class FirstBottomNavigationBarItemView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Container(
          //width: ,
          height: 35.0,
          decoration: ShapeDecoration(
            //此处颜色若不设置，会被同化成AppBar背景色
            color: Colors.white,
            shape: StadiumBorder(
              //默认情况下，边框为1.0逻辑像素宽和纯黑。
              side: BorderSide(
                //框边颜色
                color: Colors.white,
                width: 1.0,
              ),
            ),
          ),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Icon(Icons.search,color: Colors.grey[600]),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child:Text(
                  '点击此处搜索你想了解的新闻',
                  style: TextStyle(color: Colors.grey[600], fontSize:14.0),
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.assessment), onPressed: null)
        ],
      ),
    );
  }
}


/*电影模块*/
class SecondBottomNavigationBarItemView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Container(
          //width: ,
          height: 35.0,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: StadiumBorder(
              side: BorderSide(
                color: Colors.white,
                width: 1.0,
              ),
            ),
          ),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Icon(Icons.search,color: Colors.grey[600]),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child:Text(
                  '点击此处搜索你想了解的电影',
                  style: TextStyle(color: Colors.grey[600], fontSize:14.0),
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.movie_filter), onPressed: null)
        ],
      ),
    );
  }
}


/*笑话大全模块*/
class ThirdBottomNavigationBarItemView extends StatefulWidget {
  const ThirdBottomNavigationBarItemView({ Key key }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ThirdBottomNavigationBarItemViewState();
  }

}

class ThirdBottomNavigationBarItemViewState extends State<ThirdBottomNavigationBarItemView> with SingleTickerProviderStateMixin{

  final List<Tab> myTabs = <Tab>[
    Tab(text: '动态图'),
    Tab(text: '图片'),
    Tab(text: '文本'),
  ];

  TabController _tabController;

  final List<String> entries = <String>['A', 'B', 'C','D','E', 'F', 'G','H','I', 'J', 'K'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        leading: Icon(Icons.mood),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: null,
          ),
        ],
        centerTitle: true,
        title: Text('开心一点'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.0),
          child: Material(
            //Tabbar中的tab的背景颜色取的实际是AppBar的主题色，所以我们把Tabbar放在Material中来重置了主题色，变成我们想要的背景色.
            color: Colors.white,
            child:  TabBar(
              //标题与Icon之间的距离是固定的： margin: const EdgeInsets.only(bottom: 10.0),
              // 当前 TabBar高度源码已经规定  未设置 Icon 时的高度 const double _kTabHeight = 46.0;  设置 Icon 之后的高度  const double _kTextAndIconTabHeight = 72.0;
              isScrollable: false, //是否可滚动 默认否
              indicatorColor: Colors.red[300], //指示器颜色
              indicatorWeight: 2.0, //默认指示器高度
              indicatorPadding: EdgeInsets.zero, //底部指示器的Padding 默认值  不知啥作用
              indicatorSize: TabBarIndicatorSize.label, //指示器大小计算方式，TabBarIndicatorSize.label跟文字等宽,TabBarIndicatorSize.tab跟每个tab等宽
              labelColor: Colors.black,//选中label颜色
              unselectedLabelColor: Colors.black54,  //未选中label颜色
              controller: _tabController,
              tabs: myTabs,
            ),
          ),
        ), //bottom:
      ),
      body: TabBarView(
        controller: _tabController,
        children: myTabs.map((Tab tab) {
          //final String label = tab.text.toLowerCase();
          if(tab.text=='动态图'){
            return GridView.builder(
              //一个横轴为固定数量子元素的layout
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //横轴子元素的数量。此属性值确定后子元素在横轴的长度就确定了，即ViewPort横轴长度除以crossAxisCount的商。
                  //在Flutter中，术语ViewPort（视口），如无特别说明，则是指一个Widget的实际显示区域。
                  // 例如，一个ListView的显示区域高度是800像素，虽然其列表项总高度可能远远超过800像素，但是其ViewPort仍然是800像素。
                  crossAxisCount: 2,
                  //子元素在横轴长度和主轴长度的比例。由于crossAxisCount指定后，子元素横轴长度就确定了，然后通过此参数值就可以确定子元素在主轴的长度。
                  childAspectRatio: 0.8,
                  //在可滚动组件的坐标描述中，通常把滚动方向称为主轴，非滚动方向称为纵轴。
                  // 由于可滚动组件的默认方向一般都是沿垂直方向，所以默认情况下主轴就是指垂直方向，水平方向同理。
                  //主轴方向的间距。
                  mainAxisSpacing: 0.0,
                  //横轴方向子元素的间距。
                  crossAxisSpacing: 0.0,
                ),
                itemCount: entries.length,
                itemBuilder: (BuildContext context, int index){
                  return Container(
                    //padding: EdgeInsets.all(8.0),
                    //color: Colors.white/*amber[colorCodes[index]]*/,
                    child: Card(
                      child: Container(
                        //padding: EdgeInsets.only(left: 16.0),
                        child:Column(
                          //列的主轴 起始位置开始  在此处相当于 靠屏幕上侧开始
                          mainAxisAlignment: MainAxisAlignment.start,
                          //列的交叉轴(横轴) 起始位置开始  在此处相当于 靠屏幕中间开始
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 5.0),
                              child: Text(
                                '主文本 ${entries[index]}',
                                //如果这是1，文本将不换行
                                maxLines: 1,
                                //如何处理视觉溢出。
                                overflow: TextOverflow.ellipsis, //使用省略号表示文本溢出。
                              ),
                            ),
                            Container(
                              child:Expanded(
                                child: Image.asset(
                                  'images/img_linger.jpg',
                                  //fill：会拉伸填充满显示空间，图片本身长宽比会发生变化，图片会变形。
                                  //cover：会按图片的长宽比放大后居中填满显示空间，图片不会变形，超出显示空间部分会被剪裁。
                                  //contain：这是图片的默认适应规则，图片会在保证图片本身长宽比不变的情况下缩放以适应当前显示空间，图片不会变形。
                                  //fitWidth：图片的宽度会缩放到显示空间的宽度，高度会按比例缩放，然后居中显示，图片不会变形，超出显示空间部分会被剪裁。
                                  //fitHeight：图片的高度会缩放到显示空间的高度，宽度会按比例缩放，然后居中显示，图片不会变形，超出显示空间部分会被剪裁。
                                  //none：图片没有适应策略，会在显示空间内显示图片，如果图片比显示空间大，则显示空间只会显示图片中间部分。
                                  fit: BoxFit.contain,
                                  //用于设置图片的宽、高，当不指定宽高时，图片会根据当前父容器的限制，尽可能的显示其原始大小，
                                  // 如果只设置width、height的其中一个，那么另一个属性默认会按比例缩放
                                  width: 100,
                                  //height: 100,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 5.0),
                              child: Text(
                                '小文本 ${entries[index]}',
                                style: TextStyle(color: Colors.black54,fontSize:12.0),
                              ),
                            ),
                          ],
                        ) ,
                      ),

                    ),
                  );
                }
            );
          }if(tab.text=='图片'){
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 0.0,
                  crossAxisSpacing: 0.0,
                ),
                itemCount: entries.length,
                itemBuilder: (BuildContext context, int index){
                  return Container(
                    child: Card(
                      child: Container(
                        child:Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 5.0),
                              child: Text(
                                '主文本 ${entries[index]}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Container(
                              child:Expanded(
                                child: Image.network(
                                  'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=509989325,2679977358&fm=15&gp=0.jpg',
                                  fit: BoxFit.contain,
                                  width: 100,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 5.0),
                              child: Text(
                                '小文本 ${entries[index]}',
                                style: TextStyle(color: Colors.black54,fontSize:12.0),
                              ),
                            ),
                          ],
                        ) ,
                      ),
                    ),
                  );
                }
            );
          } if(tab.text=='文本'){
            return ListView.builder(
                padding: const EdgeInsets.all(8),
                //该参数如果不为null，则会强制children的“长度”为itemExtent的值；这里的“长度”是指滚动方向上子组件的长度，
                // 也就是说如果滚动方向是垂直方向，则itemExtent代表子组件的高度；如果滚动方向为水平方向，则itemExtent就代表子组件的宽度。
                // 在ListView中，指定itemExtent比让子组件自己决定自身长度会更高效，
                // 这是因为指定itemExtent后，滚动系统可以提前知道列表的长度，而无需每次构建子组件时都去再计算一下，
                // 尤其是在滚动位置频繁变化时（滚动系统需要频繁去计算列表高度）。
                itemExtent: 60,
                //列表项的数量，如果为null，则为无限列表。
                itemCount: entries.length,
                //可滚动组件的构造函数如果需要一个列表项Builder，那么通过该构造函数构建的可滚动组件通常就是支持基于Sliver的懒加载模型的，反之则不支持，这是个一般规律。
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    //color: Colors.white/*amber[colorCodes[index]]*/,
                    child: Card(
                      child: Container(
                        padding: EdgeInsets.only(left: 16.0),
                        child:Column(
                          //列的主轴 起始位置开始  在此处相当于 靠屏幕上侧开始
                          mainAxisAlignment: MainAxisAlignment.center,
                          //列的交叉轴(横轴) 起始位置开始  在此处相当于 靠屏幕左侧开始
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Text('主文本 ${entries[index]}'),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 8.0),
                              child: Text('小文本 ${entries[index]}',style: TextStyle(color: Colors.black54,fontSize:12.0)),
                            ),
                          ],
                        ) ,
                      ),

                    ),
                  );
                }
            );
          }else{
            return Center(
              child: Text('当前tab错误'),
            );
          }
        }).toList(),
      ),
    );
  }

}


/*展示模块*/
class FourthBottomNavigationBarItemView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('展示'),
        backgroundColor: Colors.cyan,
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














