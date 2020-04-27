import 'package:alice/generated/json/written_jokes_entity_helper.dart';
import 'package:alice/model/written_jokes_entity.dart';
import 'package:alice/ui/life/text_jokes_detail_screen.dart';
import 'package:alice/values/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



Future<WrittenJokesEntity> fetchTextJokeData(int page) async {
  final response = await http.get('https://way.jd.com/showapi/wbxh?time=2015-07-10&page=${page}&maxResult=20&showapi_sign=${Util.showApiSign}&appkey=${Util.jdWxApiKey}');

  if (response.statusCode == 200) {
    //如果服务器确实返回了200 OK响应,然后解析JSON
    return writtenJokesEntityFromJson(WrittenJokesEntity(),json.decode(response.body));
  } else {
    //如果服务器没有返回200 OK响应,然后抛出一个异常。
    throw Exception('服务器未响应成功');
  }
}



class TextJokesListView extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return TextJokesListViewState();
  }

}


class TextJokesListViewState extends State<TextJokesListView> {
  var _scrollController = ScrollController();
  RefreshController _refreshController = RefreshController(initialRefresh: false);
  Future<WrittenJokesEntity> _futureWrittenJokesEntity;
  List<Future<WrittenJokesEntity>> _futureWrittenJokesEntityList = List();

  //数据列表索引
  int index = 0;
  //请求页数
  int page = 1;

  @override
  void initState() {
    super.initState();
    _futureWrittenJokesEntity = fetchTextJokeData(page);
    _futureWrittenJokesEntityList.add(_futureWrittenJokesEntity);
    print(_futureWrittenJokesEntityList.toString());
  }

   /*下拉刷新*/   //重置列表数据
  void _onRefresh() async{
    await Future.delayed(Duration(milliseconds: 1500));
    setState(() {
      _futureWrittenJokesEntity = fetchTextJokeData(1);
      _futureWrittenJokesEntityList.clear();
    });
    _refreshController.refreshCompleted();
    print(_futureWrittenJokesEntityList.toString());
  }



  /*上拉加载*/
  void _onLoading() async{
    index = index + 1 ;
    page = page + 1 ;
    await Future.delayed(Duration(milliseconds: 1500));
    setState(() {
      _futureWrittenJokesEntity = fetchTextJokeData(page);
      _futureWrittenJokesEntityList.add(_futureWrittenJokesEntity);

      /// scrollController 通过 animateTo 方法滚动到某个具体高度
      _scrollController.animateTo(
          0.0,  //顶部
          duration: Duration(milliseconds: 500),
          curve: Curves.decelerate);

      print(_futureWrittenJokesEntityList.toString());
    });
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder<WrittenJokesEntity> (
          future: _futureWrittenJokesEntity, /*_futureWrittenJokesEntityList[index],*/
          builder: (context,snapshot) {
            if (snapshot.hasData) {
              return SmartRefresher(
                controller: _refreshController,
                onRefresh: _onRefresh,
                onLoading: _onLoading,
                enablePullDown: true,  ///此bool将影响是否具有下拉刷新功能。默认true
                enablePullUp: true,  ///此bool将影响是否具有下拉加载功能。默认false
                header: ClassicHeader(
                  //按照下拉刷新顺序设置文本内容
                  idleText: '下拉刷新',
                  releaseText: '释放立即刷新',
                  refreshingText: '正在刷新',
                  completeText: '刷新完成',
                  failedText: '刷新失败',
                ),
                footer: ClassicFooter(
                  //设置上拉加载风格  只在加载需要时展现
                  loadStyle: LoadStyle.ShowWhenLoading,
                  //按照上拉加载顺序设置文本内容
                  canLoadingText: '释放加载更多',
                  loadingText: '正在加载',
                  idleText: '加载完成',
                  idleIcon: const Icon(Icons.done, color: Colors.grey),
                ),
                ///对SmartRefresher里child详细说明
                //自1.4.3,child属性从ScrollView转变为Widget,但是这并不意味着对于所有Widget处理是一样的。SmartRefresher内部实现机制并非是类如NestedScrollView
                //这里的处理机制分了两个大类,第一类是继承于ScrollView的那一类组件,目前来说,就只有这三种,ListView,GridView,CustomScrollView。
                // 第二类,是非继承于ScrollView的那类组件,一般是存放空视图,非滚动视图(非滚动转化为滚动),PageView,无需你自己通过LayoutBuilder估计高度。
                //对于第一类的处理机制是从内部"非法"取出slivers。
                // 第二类,则是把child直接放进类如SliverToBoxAdapter。
                // 通过前后拼接header和footer组成slivers,然后SmartRefresher内部把slivers放进CustomScrollView,你可以把SmartRefresher理解成CustomScrollView,因为内部就是返回CustomScrollView。
                // 所以,这里child结点是不是ScrollView区别是很大的。
                child: ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.all(8),
                  //该参数如果不为null，则会强制children的“长度”为itemExtent的值；这里的“长度”是指滚动方向上子组件的长度，
                  // 也就是说如果滚动方向是垂直方向，则itemExtent代表子组件的高度；如果滚动方向为水平方向，则itemExtent就代表子组件的宽度。
                  // 在ListView中，指定itemExtent比让子组件自己决定自身长度会更高效，
                  // 这是因为指定itemExtent后，滚动系统可以提前知道列表的长度，而无需每次构建子组件时都去再计算一下，
                  // 尤其是在滚动位置频繁变化时（滚动系统需要频繁去计算列表高度）。
                  itemExtent: 65,
                  //列表项的数量，如果为null，则为无限列表。
                  itemCount: snapshot.data.result.showapiResBody.contentlist.length,
                  //可滚动组件的构造函数如果需要一个列表项Builder，那么通过该构造函数构建的可滚动组件通常就是支持基于Sliver的懒加载模型的，反之则不支持，这是个一般规律。
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TextJokeDetailScreen(text: snapshot.data.result.showapiResBody.contentlist[index].text),
                              ),
                          );
                        },
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
                                  child: Text(snapshot.data.result.showapiResBody.contentlist[index].title),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 8.0),
                                  child: Text(snapshot.data.result.showapiResBody.contentlist[index].ct,style: TextStyle(color: Colors.black54,fontSize:12.0)),
                                ),
                              ],
                            ) ,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }
            else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return Center(
              child: CircularProgressIndicator(
                strokeWidth: 3.0,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.deepOrangeAccent[100]),
              ),
            );
          },
        ),
      ),
    );
  }

}