import 'package:alice/ui/one/hotspot/hot_word_classification.dart';
import 'package:flutter/material.dart';
import 'search_news_screen.dart';
import 'tab_news_list.dart';


class FirstBottomNavigationBarItemView extends StatefulWidget{
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
    _tabController = TabController(vsync: this, length: newsTabs.length);
    super.initState();
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
                  MaterialPageRoute(builder: (context) => HotWordClassification()),
              );
            },
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.0),
          child: Material(
            color: Colors.white,
            child: TabBar(
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
        children: [
          for(final tab in newsTabs)
            TabNewsList(channelName: tab.text),
        ],
      ),
    );
  }
}


///返回一个新的lazy[Iterable]，其中的元素是通过按迭代顺序对该“Iterable”的每个元素调用“f”而创建的。
//此方法返回映射元素的视图。只要返回的[Iterable]没有被迭代，所提供的函数[f]就不会被调用。
//转换后的元素将不会被缓存。在返回的[Iterable]上多次迭代将在同一元素上多次调用提供的函数[f]。
//允许返回的iterable上的方法忽略对不需要结果的任何元素调用“f”。
// 例如，[elementAt]只能调用“f”一次。

//创建包含此[Iterable]元素的[List]。元素按迭代顺序排列。如果[growtable]为false，则列表为固定长度。
/*newsTabs.map((Tab tab) {
  if(tab.text=='头条'){
  return TabNewsList(channelName: '头条');
  }
  if(tab.text=='新闻'){
  return TabNewsList(channelName: '新闻');
  }
  if(tab.text=='国内'){
  return TabNewsList(channelName: '国内');
  }
  if(tab.text=='国际'){
  return TabNewsList(channelName: '国际');
  }
  if(tab.text=='政治'){
  return TabNewsList(channelName: '政治');
  }
  if(tab.text=='财经'){
  return TabNewsList(channelName: '财经');
  }
  if(tab.text=='体育'){
  return TabNewsList(channelName: '体育');
  }
  if(tab.text=='娱乐'){
  return TabNewsList(channelName: '娱乐');
  }
  if(tab.text=='军事'){
  return TabNewsList(channelName: '军事');
  }
  if(tab.text=='教育'){
  return TabNewsList(channelName: '教育');
  }
  if(tab.text=='科技'){
  return TabNewsList(channelName: '科技');
  }
  if(tab.text=='NBA'){
  return TabNewsList(channelName: 'NBA');
  }
  if(tab.text=='股票'){
  return TabNewsList(channelName: '股票');
  }
  if(tab.text=='星座'){
  return TabNewsList(channelName: '星座');
  }
  if(tab.text=='女性'){
  return TabNewsList(channelName: '女性');
  }
  if(tab.text=='健康'){
  return TabNewsList(channelName: '健康');
  }
  if(tab.text=='育儿'){
  return TabNewsList(channelName: '育儿');
  }
  }).toList(),*/
