import 'package:alice/routes/life/gif_picture_jokes_list_view.dart';
import 'package:alice/routes/more/joke/tab/text_jokes_list.dart';
import 'package:flutter/material.dart';



class LifeInterestChartRoute extends StatelessWidget{

  final List<Tab> myTabs = <Tab>[
    Tab(text: '动图'),
    Tab(text: '图片'),
    Tab(text: '文本'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepOrangeAccent[100],
            actions: <Widget>[
              IconButton(
                color: Colors.white,
                icon: Icon(Icons.more_horiz),
                onPressed: (){

                },
              ),
            ],
            centerTitle: true,
            title: Text('开心一点'),
            elevation: 1,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(48.0),
              child: Material(
                //Tabar中的tab的背景颜色取的实际是AppBar的主题色，所以我们把Tabbar放在Material中来重置了主题色，变成我们想要的背景色.
                color: Colors.white,
                child: TabBar(
                  tabs: myTabs,
                  //标题与Icon之间的距离是固定的： margin: const EdgeInsets.only(bottom: 10.0),
                  // 当前 TabBar高度源码已经规定  未设置 Icon 时的高度 const double _kTabHeight = 46.0;  设置 Icon 之后的高度  const double _kTextAndIconTabHeight = 72.0;
                  isScrollable: false, //是否可滚动 默认否
                  indicatorColor: Colors.deepOrangeAccent[100], //指示器颜色
                  indicatorWeight: 2.0, //默认指示器高度
                  indicatorPadding: EdgeInsets.zero, //底部指示器的Padding 默认值  不知啥作用
                  indicatorSize: TabBarIndicatorSize.label, //指示器大小计算方式，TabBarIndicatorSize.label跟文字等宽,TabBarIndicatorSize.tab跟每个tab等宽
                  labelColor: Colors.deepOrangeAccent[100],//选中label颜色
                  unselectedLabelColor: Colors.black54,  //未选中label颜色
                ),
              ),
            ), //bottom:
          ),
          body: TabBarView(
            children: [
              GifPictureJokesListView(),
              /*PictureJokesListView()*/Container(),
              TextJokeList(),
            ],
          ),
        ),
    );
  }

}