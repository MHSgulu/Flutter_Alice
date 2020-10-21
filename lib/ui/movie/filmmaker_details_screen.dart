import 'package:alice/generated/json/film_maker_album_entity_helper.dart';
import 'package:alice/generated/json/film_maker_entity_helper.dart';
import 'package:alice/generated/json/film_maker_work_entity_helper.dart';
import 'package:alice/model/film_maker_album_entity.dart';
import 'package:alice/model/film_maker_entity.dart';
import 'package:alice/model/film_maker_work_entity.dart';
import 'package:alice/ui/movie/filmmaker_album_screen.dart';
import 'package:alice/util/film_maker_album_photo_view_gallry_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'filmmaker_works_screen.dart';

///     SliverChildDelegate     SliverChildBuilderDelegate
/// 为孩子们提供切片的委托。
//许多银条懒散地构造它们的盒子代以避免产生更多
//
//在[视口]中可见的子级。
//
//他们使用[SliverChildDelegate]接收子代，而不是显式的[List]。
//
//子类[SliverChildDelegate]是不常见的。相反，考虑使用一个现有的子类，这些子类为构建器回调或显式子列表提供适配器。
//
//在布局列表时，可视子元素、状态和呈现对象将基于现有的小部件（例如在[SliveChildListDelegate]）或延迟提供的小部件（例如在[SliveChildBuilderDelegate]的情况下）惰性地创建。



/*网络请求异步操作 根据影人id请求影人信息*/
Future<FilmMakerEntity> fetchFilmMakerDetailsData(String movieId) async {
  final response = await http.get(
      'http://api.douban.com/v2/movie/celebrity/$movieId?apikey=0b2bdeda43b5688921839c8ecb20399b');
  //print(response.statusCode);
  if (response.statusCode == 200) {
    //如果服务器确实返回了200 OK响应,然后解析JSON
    return filmMakerEntityFromJson(FilmMakerEntity(), json.decode(response.body));
  } else {
    //如果服务器没有返回200 OK响应,然后抛出一个异常。
    throw Exception('服务器未响应成功');
  }
}

/*网络请求异步操作 根据影人id请求影人全部照片*/
Future<FilmMakerAlbumEntity> fetchFilmMakerAlbumData(String id) async {
  final response = await http.get(
      'https://api.douban.com/v2/movie/celebrity/$id/photos?apikey=0b2bdeda43b5688921839c8ecb20399b&start=0&count=100'); ///豆瓣数据请求count最大数量为100

  if (response.statusCode == 200) {
    //如果服务器确实返回了200 OK响应,然后解析JSON
    return filmMakerAlbumEntityFromJson(FilmMakerAlbumEntity(), json.decode(response.body));
  } else {
    //如果服务器没有返回200 OK响应,然后抛出一个异常。
    throw Exception('服务器未响应成功');
  }

}

/*网络请求异步操作 根据电影id请求影人全部作品*/
Future<FilmMakerWorkEntity> fetchFilmMakerWorksData(String id) async {
  final response = await http.get(
      'https://api.douban.com/v2/movie/celebrity/$id/works?apikey=0b2bdeda43b5688921839c8ecb20399b&count=100');  ///豆瓣数据请求count最大数量为100

  if (response.statusCode == 200) {
    //如果服务器确实返回了200 OK响应,然后解析JSON
    return filmMakerWorkEntityFromJson(FilmMakerWorkEntity(), json.decode(response.body));
  } else {
    //如果服务器没有返回200 OK响应,然后抛出一个异常。
    throw Exception('服务器未响应成功');
  }

}



class FilmMakerDeatailsScreen extends StatefulWidget {
  final String id;
  FilmMakerDeatailsScreen({Key key, @required this.id}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FilmMakerDeatailsScreen();
  }
}

class _FilmMakerDeatailsScreen extends State<FilmMakerDeatailsScreen> {

  Future<FilmMakerEntity> futureFilmMakerEntity;
  Future<FilmMakerAlbumEntity> _futureFilmMakerAlbumEntity;
  Future<FilmMakerWorkEntity> _futureFilmMakerWorkEntity;

  @override
  void initState() {
    super.initState();
    futureFilmMakerEntity = fetchFilmMakerDetailsData(widget.id);
    _futureFilmMakerAlbumEntity = fetchFilmMakerAlbumData(widget.id);
    _futureFilmMakerWorkEntity = fetchFilmMakerWorksData(widget.id);

    print('数据点位： 影人ID：' + widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<FilmMakerEntity> (
        future: futureFilmMakerEntity,
        builder: (context,snapshot) {
          if (snapshot.hasData) {
            /**
             * [SliverList]，这是一个显示线性子列表的小条。

                [SliveFixedExtentList]，这是一个更有效的小条，它显示沿滚动轴具有相同范围的子项的线性列表。

                [SliveGrid]，这是一个显示二维子数组的小条。

                [SilverPadding]，这是一种在另一条周围添加空白的条子。

                [SliverAppBar]，这是一个显示标题的小条，可以在滚动视图滚动时展开和浮动。

                [ScrollNotification]和[NotificationListener]，可用于监视滚动位置，而无需使用[ScrollController]。

                [IndexedSemantics]，它允许用滚动公告的索引来注释子列表
             */
            return CustomScrollView(
              //physics: BouncingScrollPhysics(),
              slivers: <Widget>[
                ///创建可放置在[CustomScrollView]中的材料设计应用程序栏。
                ///参数 [forceElevated], [primary], [floating], [pinned], [snap], [automaticallyImplyLeading] 不能为空
                SliverAppBar(
                  backgroundColor: Colors.black54,
                  floating: false,   ///默认false
                  pinned: true,  ///应用程序栏是否应该在用户滚动时变为可见 默认false 当用户滚动时，应用程序栏仍然可以扩展和收缩，但它将保持可见，而不是被滚动到视图之外。
                  snap: false,   ///应用程序栏是否应在滚动视图开始时保持可见。 默认false
                  brightness: Brightness.dark,
                  expandedHeight: 250.0,  ///可滚动视图的高度
                  ///应用程序栏完全展开时的大小。
                  ///创建灵活的空格键。
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(snapshot.data.name, style: TextStyle(color: Colors.white)),
                    ///展开时柔性空格键的主要内容。通常是一个[文本]小部件。
                    ///展开时显示在[标题]后面。通常是[Image.fit]设置为[BoxFit.cover]的[Image]小部件。
                    background: Image.network(
                      snapshot.data.avatars.large,  //取头像图片
                      fit: BoxFit.cover,
                    ),
                    centerTitle: true,
                    //collapseMode: CollapseMode.pin,  ///滚动时的折叠效果。默认为[CollapseMode.parallax]。
                  ),
                  leading: IconButton(
                      icon: Icon(Icons.arrow_back_rounded, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  actions: <Widget>[
                    IconButton(
                        icon: Icon(Icons.more_horiz, color: Colors.white),
                        onPressed: () {}),
                  ],
                ),
                ///个人
                SliverPadding(
                  padding: EdgeInsets.all(16.0),
                  ///[SliverToBoxAdapter]是基本的条状结构，它创建了一个返回到通常的基于框的小部件之一的桥
                  sliver: SliverToBoxAdapter(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('个人',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                          Container(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text('出生日期: '+snapshot.data.birthday),
                          ),
                          Container(
                            child: Text('星座: '+snapshot.data.constellation),
                          ),
                          Container(
                            child: Text('出生地: '+snapshot.data.bornPlace),
                          ),
                          Container(
                            child: Text('更多中文名: '+snapshot.data.aka.toString()),
                          ),
                          Container(
                            child: Text('更多外文名: '+snapshot.data.akaEn.toString()),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ///简介
                SliverPadding(
                  padding: EdgeInsets.all(16.0),
                  sliver: SliverToBoxAdapter(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('简介',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                          snapshot.data.summary.isNotEmpty ? Container(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text(snapshot.data.summary),
                          ) : Container(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text('暂无简介'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ///影视
                SliverPadding(
                  padding: EdgeInsets.all(0.0),
                  sliver: SliverToBoxAdapter(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(16, 16, 8, 16),
                            child: Row(
                              children: <Widget>[
                                Text('影视',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                                Expanded(
                                  child: Container(),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => FilmMakerWorksScreen(data: _futureFilmMakerWorkEntity)));
                                  },
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        child: Text('全部影视',style: TextStyle(color: Colors.black54, fontSize: 13.0)),
                                      ),
                                      Container(
                                        padding: EdgeInsets.fromLTRB(3, 1, 0, 0),
                                        child: FutureBuilder<FilmMakerWorkEntity> (
                                          future: _futureFilmMakerWorkEntity,
                                          builder: (context,snapshot) {
                                            if (snapshot.hasData) {
                                              return Text(snapshot.data.total.toString(),style: TextStyle(color: Colors.black54, fontSize: 13.0));
                                            }
                                            else if (snapshot.hasError) {
                                              return Text("${snapshot.error}");
                                            }
                                            return Container();
                                          },
                                        ),
                                      ),
                                      Container(
                                        child: Icon(Icons.navigate_next,color: Colors.black38),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            //width: 390,
                            height: 150,
                            //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemCount: snapshot.data.works.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        child: Card(
                                          clipBehavior: Clip.antiAlias,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadiusDirectional.circular(4.0)),
                                          child: GestureDetector(
                                            onTap: () {
                                              /*Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailsScreen(
                                                  movieId: snapshot.data.works[index].subject.id, imgUrl: snapshot.data.works[index].subject.images.small,
                                              )));*/
                                            },
                                            child: Image.network(
                                              snapshot.data.works[index].subject.images.small,
                                              width: 80,
                                              height: 120,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          snapshot.data.works[index].subject.title,
                                          style: TextStyle(color: Colors.black, fontSize: 13,fontWeight:FontWeight.w500),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ///相册
                SliverPadding(
                  padding: EdgeInsets.all(0.0),
                  sliver: SliverToBoxAdapter(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(16, 16, 8, 16),
                            child: Row(
                              children: <Widget>[
                                Text('相册',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                                Expanded(
                                  child: Container(),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => FilmMakerAlbumScreen(data: _futureFilmMakerAlbumEntity)));
                                  },
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        child: Text('全部照片',style: TextStyle(color: Colors.black54, fontSize: 13.0)),
                                      ),
                                      Container(
                                        padding: EdgeInsets.fromLTRB(2, 1, 0, 0),
                                        child: FutureBuilder<FilmMakerAlbumEntity> (
                                          future: _futureFilmMakerAlbumEntity,
                                          builder: (context,snapshot) {
                                            if (snapshot.hasData) {
                                              return Text(snapshot.data.total.toString(),style: TextStyle(color: Colors.black54, fontSize: 13.0));
                                            }
                                            else if (snapshot.hasError) {
                                              return Text("${snapshot.error}");
                                            }
                                            return Container();
                                          },
                                        ),
                                      ),
                                      Container(
                                        child: Icon(Icons.navigate_next,color: Colors.black38),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          snapshot.data.photos.isNotEmpty
                              ? Container(
                            height: 200,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemCount: snapshot.data.photos.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        child: Card(
                                          clipBehavior: Clip.antiAlias,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadiusDirectional.circular(4.0)),
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => PhotoViewGalleryScreen(
                                                  imageList: snapshot.data.photos,//传入图片list
                                                  index: index,//传入当前点击的图片的index
                                                  heroTag: 'hero${index}',//传入当前点击的图片的hero tag （可选）
                                                )),
                                              );
                                            },
                                            child: Image.network(
                                              snapshot.data.photos[index].image,
                                              height: 180,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          )
                              : Container(padding: EdgeInsets.fromLTRB(16.0, 0, 0, 30),child: Text('暂无相册'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          }
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.black87),
              strokeWidth: 3,  //用来画圆的线的宽度 默认4.0
            ),
          );
        },
      ),
    );
  }

}
