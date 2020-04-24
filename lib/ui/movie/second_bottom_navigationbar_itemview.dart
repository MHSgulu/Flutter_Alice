import 'package:alice/generated/json/movie_entity_helper.dart';
import 'package:alice/model/movie_entity.dart';
import 'package:alice/ui/movie/is_showing_up_list_screen.dart';
import 'package:alice/ui/movie/movie_details_screen.dart';
import 'package:alice/ui/movie/movie_stars_widget.dart';
import 'package:alice/ui/movie/to_be_shown_soon_list_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

/*网络请求异步操作  正在热映*/
Future<MovieEntity> fetchInTheatersMovieListData() async {
  final response = await http.get('https://api.douban.com/v2/movie/in_theaters?apikey=0b2bdeda43b5688921839c8ecb20399b');

  if (response.statusCode == 200) {
    //如果服务器确实返回了200 OK响应,然后解析JSON
    return movieEntityFromJson(MovieEntity(),json.decode(response.body));
  } else {
    //如果服务器没有返回200 OK响应,然后抛出一个异常。
    throw Exception('服务器未响应未成功');
  }
}


/*网络请求异步操作  即将上映*/
Future<MovieEntity> fetchComingSoonMovieListData() async {
  final response = await http.get('https://api.douban.com/v2/movie/coming_soon?apikey=0b2bdeda43b5688921839c8ecb20399b');

  if (response.statusCode == 200) {
    //如果服务器确实返回了200 OK响应,然后解析JSON
    return movieEntityFromJson(MovieEntity(),json.decode(response.body));
  } else {
    //如果服务器没有返回200 OK响应,然后抛出一个异常。
    throw Exception('服务器未响应未成功');
  }
}


class SecondBottomNavigationBarItemView extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return SecondBottomNavigationBarItemViewState();
  }

}


/*电影模块*/
class SecondBottomNavigationBarItemViewState extends State<SecondBottomNavigationBarItemView> {

  Future<MovieEntity> futureMovieEntity;
  Future<MovieEntity> futureMovieEntity2;

  @override
  void initState() {
    super.initState();
    futureMovieEntity = fetchInTheatersMovieListData();
    futureMovieEntity2 = fetchComingSoonMovieListData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[400],
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
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.movie_filter),
            onPressed: (){},
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Container(
              child: Column(
                children: <Widget>[
                  ///轮播图
                  Container(
                    padding: EdgeInsets.only(top: 4.0),
                    child: SizedBox(
                      height: 150,
                      child: Swiper(
                        autoplay: true,  //自动播放开关.
                        //autoplayDelay: 3000,  //自动播放延迟毫秒数. 默认3秒
                        itemBuilder: (BuildContext context,int index){
                          if(index==0){
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusDirectional.circular(4.0),
                              ),
                              clipBehavior: Clip.antiAlias,
                              elevation: 2.0,
                              child: Image.network("https://img3.doubanio.com/view/photo/l/public/p2552055511.webp",fit: BoxFit.cover),
                            );
                          }
                          if(index==1){
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusDirectional.circular(4.0),
                              ),
                              clipBehavior: Clip.antiAlias,
                              elevation: 2.0,
                              child: Image.network("https://img1.doubanio.com/view/photo/m/public/p2561712948.webp",fit: BoxFit.cover),
                            );
                          }
                          else{
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusDirectional.circular(4.0),
                              ),
                              clipBehavior: Clip.antiAlias,
                              elevation: 2.0,
                              child: Image.network("https://img9.doubanio.com/view/photo/l/public/p2576400566.webp",fit: BoxFit.cover),
                            );
                          }
                        },
                        itemCount: 3,
                        viewportFraction: 0.85,  //当前轮播图的视口大小
                        scale: 0.9,  //两边轮播图的视口距离中间视口的距离 值越大越近
                        pagination: SwiperPagination(),
                        //轮播图左右箭头
                        control: SwiperControl(
                          //color: Colors.teal,
                          size: 0.0,  //轮播图左右箭头图标大小 为0 相当于去掉图标
                        ),
                      ),
                    ),
                  ),
                  ///标题行——正在热映
                  FutureBuilder<MovieEntity> (
                    future: futureMovieEntity,
                    builder: (context,snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          padding: EdgeInsets.fromLTRB(0, 32, 0, 10),
                          child: Row(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(left: 16.0),
                                child: Text(
                                  '正在热映',
                                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                                ),
                              ),
                              Expanded(
                                child: Container(),
                              ),
                              Container(
                                child: GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => IsShowingUpListScreen(futureData: futureMovieEntity,)));
                                  },
                                  child:Row(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.only(right: 4.0),
                                        child: Text('全部'),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(right: 4.0),
                                        child: Text('${snapshot.data.subjects.length}'),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(right: 8.0),
                                        child: Icon(Icons.arrow_forward_ios,size: 15),
                                      ),
                                    ],
                                  ),
                                ),
                                padding: EdgeInsets.only(top: 4.0),
                              ),
                            ],
                          ),
                        );
                      }
                      else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      return Center(
                        child: Container(),
                      );
                    },
                  ),
                  ///正在热映
                  FutureBuilder<MovieEntity> (
                    future: futureMovieEntity,
                    builder: (context,snapshot) {
                      if (snapshot.hasData) {
                        return GridView.builder(
                                padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                                shrinkWrap: true,  ///是否根据子组件的总长度来设置列表的长度，默认值为false
                                physics: NeverScrollableScrollPhysics(),  ///解决可互动组件的嵌套滑动冲突 禁止滚动 交给最外层滑动
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio: 0.55,
                                  mainAxisSpacing: 0.0,
                                  crossAxisSpacing: 4.0,
                                ),
                                ///如果数据列表长度大于等于6，显示6格，否则有多少显示多少数据
                                itemCount: snapshot.data.subjects.length >= 6 ?  6 : snapshot.data.subjects.length,
                                itemBuilder: (BuildContext context, int index){
                                  return Container(
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          child: Card(
                                            elevation: 2.0,
                                            clipBehavior: Clip.antiAlias,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadiusDirectional.circular(2.0)
                                            ),
                                            child: GestureDetector(
                                              onTap: (){
                                                Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailsScreen(movieId: snapshot.data.subjects[index].id,data: snapshot.data.subjects[index])));
                                              },
                                              child: Image.network(
                                                snapshot.data.subjects[index].images.large,
                                                ///以下两行代码 暂时解决 图片高度不一致的问题 可能会出现不适配的为 比如在手机长度比较小 不是主流机型长宽比的那种
                                                fit: BoxFit.fitHeight,
                                                height: 150,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            snapshot.data.subjects[index].title,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              snapshot.data.subjects[index].rating.average >= 9.5 && snapshot.data.subjects[index].rating.average <= 10 ? FiveStarsScore()
                                                  : snapshot.data.subjects[index].rating.average >= 8.5 && snapshot.data.subjects[index].rating.average <= 9.4 ? FourStarsHalfScore()
                                                  : snapshot.data.subjects[index].rating.average >= 7.5 && snapshot.data.subjects[index].rating.average <= 8.4 ? FourStarsScore()
                                                  : snapshot.data.subjects[index].rating.average >= 6.5 && snapshot.data.subjects[index].rating.average <= 7.4 ? ThreeStarsHalfScore()
                                                  : snapshot.data.subjects[index].rating.average >= 5.5 && snapshot.data.subjects[index].rating.average <= 6.4 ? ThreeStarsScore()
                                                  : snapshot.data.subjects[index].rating.average >= 4.5 && snapshot.data.subjects[index].rating.average <= 5.4 ? TwoStarsHalfScore()
                                                  : snapshot.data.subjects[index].rating.average >= 3.5 && snapshot.data.subjects[index].rating.average <= 4.4 ? TwoStarsScore()
                                                  : snapshot.data.subjects[index].rating.average >= 2.5 && snapshot.data.subjects[index].rating.average <= 3.4 ? OneStarsHalfScore()
                                                  : snapshot.data.subjects[index].rating.average >= 1.5 && snapshot.data.subjects[index].rating.average <= 2.4 ? OneStarsScore()
                                                  : snapshot.data.subjects[index].rating.average >= 0.5 && snapshot.data.subjects[index].rating.average <= 1.4 ? HalfStarsScore() : NoStarsScore()
                                              ,
                                              Container(
                                                padding: EdgeInsets.only(left: 4.0),
                                                child: Text('${snapshot.data.subjects[index].rating.average}', style: TextStyle(fontSize: 12, color: Colors.black45)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                            );
                      }
                      else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      return Center(
                        child: Container(),
                      );
                    },
                  ),
                  ///标题行——即将上映
                  FutureBuilder<MovieEntity> (
                    future: futureMovieEntity2,
                    builder: (context,snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          padding: EdgeInsets.fromLTRB(0, 32, 0, 10),
                          child: Row(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(left: 16.0),
                                child: Text(
                                  '即将上映',
                                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                                ),
                              ),
                              Expanded(
                                child: Container(),
                              ),
                              Container(
                                child: GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => ToBeSoonListScreen(futureData: futureMovieEntity2,)));
                                  },
                                  child:Row(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.only(right: 4.0),
                                        child: Text('全部'),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(right: 4.0),
                                        child: Text('${snapshot.data.subjects.length}'),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(right: 8.0),
                                        child: Icon(Icons.arrow_forward_ios,size: 15),
                                      ),
                                    ],
                                  ),
                                ),
                                padding: EdgeInsets.only(top: 4.0),
                              ),
                            ],
                          ),
                        );
                      }
                      else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      return Center(
                        child: Container(),
                      );
                    },
                  ),
                  ///即将上映
                  FutureBuilder<MovieEntity> (
                    future: futureMovieEntity2,
                    builder: (context,snapshot) {
                      if (snapshot.hasData) {
                        return GridView.builder(
                            padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                            shrinkWrap: true,  ///是否根据子组件的总长度来设置列表的长度，默认值为false
                            physics: NeverScrollableScrollPhysics(),  ///解决可互动组件的嵌套滑动冲突 禁止滚动 交给最外层滑动
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 0.55,
                              mainAxisSpacing: 0.0,
                              crossAxisSpacing: 4.0,
                            ),
                            ///如果数据列表长度大于等于6，显示6格，否则有多少显示多少数据
                            itemCount: snapshot.data.subjects.length >= 6 ?  6 : snapshot.data.subjects.length,
                            itemBuilder: (BuildContext context, int index){
                              return Container(
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      child: Card(
                                        elevation: 2.0,
                                        clipBehavior: Clip.antiAlias,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadiusDirectional.circular(4.0)
                                        ),
                                        child: GestureDetector(
                                          onTap: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailsScreen(movieId: snapshot.data.subjects[index].id,data: snapshot.data.subjects[index])));
                                          },
                                          child: Image.network(
                                            snapshot.data.subjects[index].images.large,
                                            ///以下两行代码 暂时解决 图片高度不一致的问题 可能会出现不适配的为 比如在手机长度比较小 不是主流机型长宽比的那种
                                            fit: BoxFit.fitHeight,
                                            height: 150,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        snapshot.data.subjects[index].title,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 2, 0, 0),
                                      padding: EdgeInsets.fromLTRB(4, 2, 4, 1),
                                      decoration: BoxDecoration(
                                        //color: Colors.red,  //容器底色
                                        border: Border.all(width: 0.7,color: Colors.red), //// 边色与边宽度
                                        borderRadius: BorderRadius.circular(4.0),  //// 圆角度
                                      ),
                                      ///2020-01-01  切割字符串
                                      child: Text(snapshot.data.subjects[index].mainlandPubdate.substring(5), style: TextStyle(fontSize: 10, color: Colors.red)),
                                    ),
                                  ],
                                ),
                              );
                            }
                        );
                      }
                      else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      return Center(
                        child: Container(),
                      );
                    },
                  ),
                  ///标题行——豆瓣榜单
                  ///电影榜单
                ],
              ),
            )
        ),

    );
  }
}