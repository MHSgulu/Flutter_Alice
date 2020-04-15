import 'dart:convert';
import 'package:alice/generated/json/news_entity_helper.dart';
import 'package:alice/model/news_entity.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:transparent_image/transparent_image.dart';

import 'news_detail_screen.dart';



/*异步网络请求新闻数据*/
Future<NewsEntity> fetchNewsData() async {
  final response = await http.get('https://way.jd.com/jisuapi/get?channel=%E5%9B%BD%E5%86%85&num=40&start=0&appkey=bd1ee420d53dcd93f21d338cd6bebba3');

  if (response.statusCode == 200) {
    return newsEntityFromJson(NewsEntity(),json.decode(response.body));
  } else {
    throw Exception('服务器未响应未成功');
  }
}


/*国内频道*/
class TabNewsListScreen3 extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return NewsListScreenState();
  }

}


class NewsListScreenState extends State<TabNewsListScreen3> {

  RefreshController _refreshController = RefreshController(initialRefresh: false);
  Future<NewsEntity> _futureNewsEntity;

  @override
  void initState() {
    super.initState();
    _futureNewsEntity = fetchNewsData();
  }

  /*下拉刷新*/
  void _onRefresh() async{
    await Future.delayed(Duration(milliseconds: 1500));
    setState(() {
      _futureNewsEntity = fetchNewsData();
    });
    _refreshController.refreshCompleted();
  }



  /*上拉加载*/
  void _onLoading() async{
    await Future.delayed(Duration(milliseconds: 1500));
    _refreshController.loadNoData();
  }



  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsEntity> (
      future: _futureNewsEntity,
      builder: (context,snapshot) {
        if (snapshot.hasData) {
          return SmartRefresher(
            controller: _refreshController,
            onRefresh: _onRefresh,
            onLoading: _onLoading,
            enablePullDown: true,
            enablePullUp: true,
            header: ClassicHeader(
              idleText: '下拉刷新',
              releaseText: '释放立即刷新',
              refreshingText: '正在刷新',
              completeText: '刷新完成',
              failedText: '刷新失败',
            ),
            footer: ClassicFooter(
              loadStyle: LoadStyle.ShowWhenLoading,
              canLoadingText: '释放加载更多',
              loadingText: '正在加载',
              idleText: '加载完成',
              noDataText: '没有更多数据了',
              idleIcon: const Icon(Icons.done, color: Colors.grey),
            ),
            child: ListView.builder(
              padding: const EdgeInsets.all(4),
              itemExtent: 200,
              itemCount: snapshot.data.result.result.xList.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NewsDetailScreen(
                                    title: snapshot.data.result.result.xList[index].title,
                                    src: snapshot.data.result.result.xList[index].src,
                                    time: snapshot.data.result.result.xList[index].time,
                                    content: snapshot.data.result.result.xList[index].content,
                                  ),
                                ),
                              );
                    },
                    child: Card(
                      child: Container(
                        child:Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.fromLTRB(8, 4, 2, 8),
                              child: Text(snapshot.data.result.result.xList[index].title),
                            ),
                            Container(
                              child: Expanded(
                                child: Center(
                                  child: FadeInImage.memoryNetwork(
                                    placeholder: kTransparentImage,
                                    image: snapshot.data.result.result.xList[index].pic,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(8, 8, 8, 4),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    child: Text(snapshot.data.result.result.xList[index].time, style: TextStyle(color: Colors.black54,fontSize:12.0)),
                                  ),
                                  ///行的中间由伸展部件补上
                                  Expanded(
                                    child: Container(),
                                  ),
                                  Text(snapshot.data.result.result.xList[index].src, style: TextStyle(color: Colors.black54,fontSize:12.0)),
                                ],
                              ),
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
            strokeWidth: 3,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent[200]),
          ),
        );
      },
    );
  }



}