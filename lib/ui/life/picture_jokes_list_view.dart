import 'package:alice/generated/json/picture_joke_entity_helper.dart';
import 'package:alice/model/picture_joke_entity.dart';
import 'package:alice/util/photo_view_single_screen.dart';
import 'package:alice/values/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:transparent_image/transparent_image.dart';


/*异步网络请求图片笑话*/
Future<PictureJokeEntity> fetchPictureJokeData(int page) async {
  final response = await http.get('https://way.jd.com/showapi/tpxh?time=2015-07-10&page=${page}&maxResult=20&showapi_sign=${Util.showApiSign}&appkey=${Util.jdWxApiKey}');

  if (response.statusCode == 200) {
    //如果服务器确实返回了200 OK响应,然后解析JSON
    return pictureJokeEntityFromJson(PictureJokeEntity(),json.decode(response.body));
  } else {
    //如果服务器没有返回200 OK响应,然后抛出一个异常。
    throw Exception('服务器未响应成功');
  }
}


class PictureJokesListView extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return PictureJokesListViewState();
  }

}


class PictureJokesListViewState extends State<PictureJokesListView> {
  var _scrollController = ScrollController();
  int page = 1;
  RefreshController _refreshController = RefreshController(initialRefresh: false);
  Future<PictureJokeEntity> _futurePictureJokeEntity;

  /*下拉刷新*/
  void _onRefresh() async{
    await Future.delayed(Duration(milliseconds: 1500));
    setState(() {
      _futurePictureJokeEntity = fetchPictureJokeData(1);
    });
    _refreshController.refreshCompleted();
  }


  /*上拉加载*/
  void _onLoading() async{
    page = page + 1 ;
    await Future.delayed(Duration(milliseconds: 1500));
    setState(() {
      _futurePictureJokeEntity = fetchPictureJokeData(page);

      _scrollController.animateTo(
          0.0,  //顶部
          duration: Duration(milliseconds: 500),
          curve: Curves.decelerate);
    });
    _refreshController.loadComplete();
  }



  @override
  void initState() {
    super.initState();
    _futurePictureJokeEntity = fetchPictureJokeData(page);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder<PictureJokeEntity> (
          future: _futurePictureJokeEntity,
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
                  idleIcon: const Icon(Icons.done, color: Colors.grey),
                ),
                child: GridView.builder(
                    controller: _scrollController,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      mainAxisSpacing: 0.0,
                      crossAxisSpacing: 0.0,
                    ),
                    itemCount: snapshot.data.result.showapiResBody.contentlist.length,
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
                                    snapshot.data.result.showapiResBody.contentlist[index].title,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Container(
                                  child:Expanded(
                                    child: GestureDetector(
                                      onTap: (){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => PhotoViewSimpleScreen(
                                            imageProvider:NetworkImage(snapshot.data.result.showapiResBody.contentlist[index].img),
                                            minScale: 0.2,
                                            maxScale: 0.5,
                                            heroTag: 'simple',
                                          )),
                                        );
                                      },
                                      child: FadeInImage.memoryNetwork(
                                        placeholder: kTransparentImage,
                                        image: snapshot.data.result.showapiResBody.contentlist[index].img,
                                        width: 100,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 5.0),
                                  child: Text(
                                    snapshot.data.result.showapiResBody.contentlist[index].ct,
                                    style: TextStyle(color: Colors.black54,fontSize:12.0),
                                  ),
                                ),
                              ],
                            ) ,
                          ),
                        ),
                      );
                    }
                ),
              );
            }
            else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return Center(
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.deepOrangeAccent[100]),
              ),
            );
          },
        ),
      ),
    );
  }

}