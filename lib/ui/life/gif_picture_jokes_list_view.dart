import 'package:alice/generated/json/gif_picture_jokes_entity_helper.dart';
import 'package:alice/model/gif_picture_jokes_entity.dart';
import 'package:alice/util/photo_view_single_screen.dart';
import 'package:alice/values/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pull_to_refresh/pull_to_refresh.dart';



/*网络请求动态图*/
Future<GifPictureJokesEntity> fetchGifPictureJokeData(int page) async {
  final response = await http.get('https://way.jd.com/showapi/dtgxt?time=2015-07-10&page=${page}&maxResult=20&showapi_sign=${Util.showApiSign}&appkey=${Util.jdWxApiKey}');

  if (response.statusCode == 200) {
    //如果服务器确实返回了200 OK响应,然后解析JSON
    return gifPictureJokesEntityFromJson(GifPictureJokesEntity(),json.decode(response.body));
  } else {
    //如果服务器没有返回200 OK响应,然后抛出一个异常。
    throw Exception('服务器未响应未成功');
  }
}



class GifPictureJokesListView extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return GifPictureJokesListViewState();
  }

}


class GifPictureJokesListViewState extends State<GifPictureJokesListView> {
  var _scrollController = ScrollController();
  RefreshController _refreshController = RefreshController(initialRefresh: false);
  int page = 1;
  Future<GifPictureJokesEntity> _futureGifPictureJokesEntity;


  /*下拉刷新*/
  void _onRefresh() async{
    await Future.delayed(Duration(milliseconds: 1500));
    setState(() {
      _futureGifPictureJokesEntity = fetchGifPictureJokeData(1);
    });
    _refreshController.refreshCompleted();
  }


  /*上拉加载*/
  void _onLoading() async{
    page = page + 1 ;
    await Future.delayed(Duration(milliseconds: 1500));
    setState(() {
      _futureGifPictureJokesEntity = fetchGifPictureJokeData(page);

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
    _futureGifPictureJokesEntity = fetchGifPictureJokeData(page);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder<GifPictureJokesEntity> (
          future: _futureGifPictureJokesEntity,
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
                  //一个横轴为固定数量子元素的layout
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //横轴子元素的数量。此属性值确定后子元素在横轴的长度就确定了，即ViewPort横轴长度除以crossAxisCount的商。
                      //在Flutter中，术语ViewPort（视口），如无特别说明，则是指一个Widget的实际显示区域。
                      //例如，一个ListView的显示区域高度是800像素，虽然其列表项总高度可能远远超过800像素，但是其ViewPort仍然是800像素。
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
                    itemCount: snapshot.data.result.showapiResBody.contentlist.length,
                    itemBuilder: (BuildContext context, int index){
                      return Container(
                        //padding: EdgeInsets.all(8.0),
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
                                    snapshot.data.result.showapiResBody.contentlist[index].title,
                                    //如果这是1，文本将不换行
                                    maxLines: 1,
                                    //如何处理视觉溢出。
                                    overflow: TextOverflow.ellipsis, //使用省略号表示文本溢出。
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
                                            maxScale: 1.0,
                                            heroTag: 'simple',
                                          )),
                                        );
                                      },
                                      child: Image.network(
                                        snapshot.data.result.showapiResBody.contentlist[index].img,
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
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

}