import 'package:alice/ui/news/real_time_hotspot_ranking_screen.dart';
import 'package:alice/ui/news/search_news_screen.dart';
import 'package:alice/ui/news/tab_news_list_screen_1.dart';
import 'package:alice/ui/news/tab_news_list_screen_10.dart';
import 'package:alice/ui/news/tab_news_list_screen_11.dart';
import 'package:alice/ui/news/tab_news_list_screen_12.dart';
import 'package:alice/ui/news/tab_news_list_screen_13.dart';
import 'package:alice/ui/news/tab_news_list_screen_14.dart';
import 'package:alice/ui/news/tab_news_list_screen_15.dart';
import 'package:alice/ui/news/tab_news_list_screen_16.dart';
import 'package:alice/ui/news/tab_news_list_screen_17.dart';
import 'package:alice/ui/news/tab_news_list_screen_2.dart';
import 'package:alice/ui/news/tab_news_list_screen_3.dart';
import 'package:alice/ui/news/tab_news_list_screen_4.dart';
import 'package:alice/ui/news/tab_news_list_screen_5.dart';
import 'package:alice/ui/news/tab_news_list_screen_6.dart';
import 'package:alice/ui/news/tab_news_list_screen_7.dart';
import 'package:alice/ui/news/tab_news_list_screen_8.dart';
import 'package:alice/ui/news/tab_news_list_screen_9.dart';
import 'package:flutter/material.dart';



/*新闻模块*/
class FirstBottomNavigationBarItemView extends StatefulWidget{
  FirstBottomNavigationBarItemView({ Key key }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FirstBottomNavigationBarItemViewState();
  }

}


class FirstBottomNavigationBarItemViewState extends State<FirstBottomNavigationBarItemView> with SingleTickerProviderStateMixin{

  TabController _tabController;

   List<Tab> newsTabs = <Tab>[
     Tab(text: '头条'),
     Tab(text: '新闻'),
     Tab(text: '国内'),
     Tab(text: '国际'),
     Tab(text: '政治'),
     Tab(text: '财经'),
     Tab(text: '体育'),
     Tab(text: '娱乐'),
     Tab(text: '军事'),
     Tab(text: '教育'),
     Tab(text: '科技'),
     Tab(text: 'NBA'),
     Tab(text: '股票'),
     Tab(text: '星座'),
     Tab(text: '女性'),
     Tab(text: '健康'),
     Tab(text: '育儿'),
  ];


  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: newsTabs.length);
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
        backgroundColor: Colors.blueAccent[200],
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
                child:GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SearchNewsScreen()));
                  },
                  child: Text(
                    '点击此处搜索你想了解的新闻',
                    style: TextStyle(color: Colors.grey[600], fontSize:14.0),
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
            color: Colors.white, ///如果[onPressed]不为空，则启用该图标。 之前值为null 颜色没变化
            icon: Icon(Icons.assessment),
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RealTimeHotspotScreen()),
              );
            },
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.0),
          child: Material(
            color: Colors.white,
            child:  TabBar(
              isScrollable: true,
              indicatorColor: Colors.blueAccent[200],
              indicatorWeight: 2.0,
              indicatorPadding: EdgeInsets.zero,
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: Colors.blueAccent[200],
              unselectedLabelColor: Colors.black54,
              controller: _tabController,
              tabs: newsTabs,
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: newsTabs.map((Tab tab) {
          if(tab.text=='头条'){
            return TabNewsListScreen1();
          }
          if(tab.text=='新闻'){
            return TabNewsListScreen2();
          }
          if(tab.text=='国内'){
            return TabNewsListScreen3();
          }
          if(tab.text=='国际'){
            return TabNewsListScreen4();
          }
          if(tab.text=='政治'){
            return TabNewsListScreen5();
          }
          if(tab.text=='财经'){
            return TabNewsListScreen6();
          }
          if(tab.text=='体育'){
            return TabNewsListScreen7();
          }
          if(tab.text=='娱乐'){
            return TabNewsListScreen8();
          }
          if(tab.text=='军事'){
            return TabNewsListScreen9();
          }
          if(tab.text=='教育'){
            return TabNewsListScreen10();
          }
          if(tab.text=='科技'){
            return TabNewsListScreen11();
          }
          if(tab.text=='NBA'){
            return TabNewsListScreen12();
          }
          if(tab.text=='股票'){
            return TabNewsListScreen13();
          }
          if(tab.text=='星座'){
            return TabNewsListScreen14();
          }
          if(tab.text=='女性'){
            return TabNewsListScreen15();
          }
          if(tab.text=='健康'){
            return TabNewsListScreen16();
          }
          if(tab.text=='育儿'){
            return TabNewsListScreen17();
          }
          else{
            return Center(
              child: Text('当前tab错误'),
            );
          }
        }).toList(),
      ),
    );
  }
}


