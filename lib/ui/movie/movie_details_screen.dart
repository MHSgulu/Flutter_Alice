import 'package:alice/generated/json/moive_details_entity_helper.dart';
import 'package:alice/ui/movie/movie_stars_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:alice/model/moive_details_entity.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


//List  转String  直接toString()会带上方括号[]
String listToString(List list) {
  StringBuffer sb = new StringBuffer();
  list.forEach((item) {
    sb.write(' $item ');
  });
  return sb.toString();
}



/*网络请求异步操作 根据电影id请求电影详情*/
Future<MoiveDetailsEntity> fetchMovieDetailsData(String movieId) async {
  final response = await http.get(
      'http://api.douban.com/v2/movie/subject/${movieId}?apikey=0b2bdeda43b5688921839c8ecb20399b');

  if (response.statusCode == 200) {
    //如果服务器确实返回了200 OK响应,然后解析JSON
    return moiveDetailsEntityFromJson(
        MoiveDetailsEntity(), json.decode(response.body));
  } else {
    //如果服务器没有返回200 OK响应,然后抛出一个异常。
    throw Exception('服务器未响应未成功');
  }
}

class MovieDetailsScreen extends StatefulWidget {
  final String movieId;

  MovieDetailsScreen({Key key, @required this.movieId}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MovieDetailsScreenState();
  }
}

class MovieDetailsScreenState extends State<MovieDetailsScreen> {

  Future<MoiveDetailsEntity> futureMoiveDetailsEntity;

  @override
  void initState() {
    super.initState();
    futureMoiveDetailsEntity = fetchMovieDetailsData(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0, //阴影度
        backgroundColor: Colors.teal[400],
        centerTitle: true,
        title: Text('电影', style: TextStyle(fontSize: 16.0)),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.more_horiz),
          ),
        ],
      ),
      body: FutureBuilder<MoiveDetailsEntity>(
        future: futureMoiveDetailsEntity,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Container(
                color: Colors.teal[400],
                child: Column(
                  children: <Widget>[
                    ///电影信息栏
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(8, 0, 0, 8),
                            child: Card(
                              elevation: 2.0,
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusDirectional.circular(2.0)),
                              child: GestureDetector(
                                onTap: () {},
                                child: Image.network(
                                  snapshot.data.images.small,
                                  width: 110,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.fromLTRB(8, 4, 16, 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: Text(
                                      snapshot.data.title,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                      maxLines: 2, //文字显示最大行数
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                                    child: Text(
                                      snapshot.data.title ==
                                              snapshot.data.originalTitle
                                          ? ' (${snapshot.data.year})'
                                          : snapshot.data.originalTitle +
                                              ' (${snapshot.data.year})',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                      maxLines: 2, //文字显示最大行数
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                                    child: Text(
                                      '${listToString(snapshot.data.countries)} / ${listToString(snapshot.data.genres)} / 上映时间:  ${snapshot.data.mainlandPubdate} (中国大陆) / 片长:  ${snapshot.data.durations[0]}',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.white70),
                                      maxLines: 2, //文字显示最大行数
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ///评分栏
                    Container(
                      //color: Colors.black12,
                      ///不能同时提供颜色和装饰  color参数只是“decoration:new BoxDecoration（color:color）”的简写。
                      margin: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: snapshot.data.rating.average == 0
                          ? Container(
                              child: Row(
                                children: <Widget>[
                                  ///豆瓣品牌文字栏
                                  Container(
                                    padding: EdgeInsets.fromLTRB(16, 10, 2, 8),
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          child: Row(
                                            children: <Widget>[
                                              ///豆瓣评分
                                              Container(
                                                child: Text('豆瓣评分',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12.0)),
                                              ),

                                              ///TM
                                              Container(
                                                padding: EdgeInsets.fromLTRB(
                                                    2, 0, 0, 6),
                                                child: Text('TM',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 6.0)),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding:
                                              EdgeInsets.fromLTRB(8, 16, 0, 16),
                                          child: Text('尚未上映',
                                              style: TextStyle(
                                                  fontSize: 13.0,
                                                  color: Colors.white60)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  ///垂直分割线 为效果
                                  Container(
                                    margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
                                    color: Colors.white30,
                                    width: 1,
                                    height: 50,
                                  ),
                                  Container(
                                    //padding: EdgeInsets.only(right: 80.0),
                                    child: Text(
                                      '${snapshot.data.wishCount} 人想看',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container(
                              child: Column(
                                children: <Widget>[
                                  ///豆瓣品牌文字栏
                                  Container(
                                    padding: EdgeInsets.fromLTRB(16, 10, 2, 8),
                                    child: Row(
                                      children: <Widget>[
                                        ///豆瓣评分
                                        Container(
                                          child: Text('豆瓣评分',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12.0)),
                                        ),

                                        ///TM
                                        Container(
                                          padding:
                                              EdgeInsets.fromLTRB(2, 0, 0, 6),
                                          child: Text('TM',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 6.0)),
                                        ),
                                        Expanded(
                                          child: Container(),
                                        ),

                                        ///Icon
                                        Container(
                                          padding: EdgeInsets.only(right: 4.0),
                                          child: Icon(Icons.navigate_next,
                                              color: Colors.white70, size: 20),
                                        ),
                                      ],
                                    ),
                                  ),

                                  ///评分细节栏
                                  Container(
                                    padding: EdgeInsets.fromLTRB(16, 0, 4, 0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center, //此处代码使评分数字 与占比  行级 水平方向右边靠点
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start, //此处代码使评分数字 与占比  行级 垂直方向顶部对齐
                                      children: <Widget>[
                                        ///评分数字栏
                                        Container(
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                child: Text(
                                                    snapshot.data.rating.average
                                                        .toString(),
                                                    style: TextStyle(
                                                      fontSize: 35.0,
                                                      color: Colors.white,
                                                    )),
                                              ),
                                              Container(
                                                //padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                child: snapshot.data.rating.average >= 9.5 &&
                                                        snapshot.data.rating.average <=
                                                            10
                                                    ? FiveStarsScore()
                                                    : snapshot.data.rating.average >= 8.5 &&
                                                            snapshot.data.rating.average <=
                                                                9.4
                                                        ? FourStarsHalfScore()
                                                        : snapshot.data.rating.average >= 7.5 &&
                                                                snapshot.data
                                                                        .rating
                                                                        .average <=
                                                                    8.4
                                                            ? FourStarsScore()
                                                            : snapshot.data.rating.average >= 6.5 && snapshot.data.rating.average <= 7.4
                                                                ? ThreeStarsHalfScore()
                                                                : snapshot.data.rating.average >= 5.5 && snapshot.data.rating.average <= 6.4
                                                                    ? ThreeStarsScore()
                                                                    : snapshot.data.rating.average >= 4.5 && snapshot.data.rating.average <= 5.4
                                                                        ? TwoStarsHalfScore()
                                                                        : snapshot.data.rating.average >= 3.5 && snapshot.data.rating.average <= 4.4
                                                                            ? TwoStarsScore()
                                                                            : snapshot.data.rating.average >= 2.5 && snapshot.data.rating.average <= 3.4 ? OneStarsHalfScore() : snapshot.data.rating.average >= 1.5 && snapshot.data.rating.average <= 2.4 ? OneStarsScore() : snapshot.data.rating.average >= 0.5 && snapshot.data.rating.average <= 1.4 ? HalfStarsScore() : NoStarsScore(),
                                              ),
                                            ],
                                          ),
                                        ),

                                        ///评分占比栏
                                        Container(
                                          padding:
                                              EdgeInsets.fromLTRB(16, 0, 0, 0),
                                          child: Column(
                                            //以下代码尾处对其 评分占比栏
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: <Widget>[
                                              ///评分人数占比
                                              Container(
                                                child: Row(
                                                  children: <Widget>[
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          right: 4.0),
                                                      child: Row(
                                                        children: <Widget>[
                                                          Icon(Icons.star,
                                                              color: Colors
                                                                  .white70,
                                                              size: 10),
                                                          Icon(Icons.star,
                                                              color: Colors
                                                                  .white70,
                                                              size: 10),
                                                          Icon(Icons.star,
                                                              color: Colors
                                                                  .white70,
                                                              size: 10),
                                                          Icon(Icons.star,
                                                              color: Colors
                                                                  .white70,
                                                              size: 10),
                                                          Icon(Icons.star,
                                                              color: Colors
                                                                  .white70,
                                                              size: 10),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 120,
                                                      height: 5,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white38,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2.0),
                                                      ),
                                                      child: Row(
                                                        children: <Widget>[
                                                          Container(
                                                            width: (snapshot.data
                                                                        .rating
                                                                        .details
                                                                        .x5 /
                                                                    (snapshot.data.rating.details.x1+snapshot.data.rating.details.x2+snapshot.data.rating.details.x3+snapshot.data.rating.details.x4+snapshot.data.rating.details.x5)) *
                                                                120,
                                                            height: 8,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.amber,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          2.0),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                child: Row(
                                                  children: <Widget>[
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          right: 4.0),
                                                      child: Row(
                                                        children: <Widget>[
                                                          Icon(Icons.star,
                                                              color: Colors
                                                                  .white70,
                                                              size: 10),
                                                          Icon(Icons.star,
                                                              color: Colors
                                                                  .white70,
                                                              size: 10),
                                                          Icon(Icons.star,
                                                              color: Colors
                                                                  .white70,
                                                              size: 10),
                                                          Icon(Icons.star,
                                                              color: Colors
                                                                  .white70,
                                                              size: 10),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 120,
                                                      height: 5,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white38,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2.0),
                                                      ),
                                                      child: Row(
                                                        children: <Widget>[
                                                          Container(
                                                            width: (snapshot.data
                                                                        .rating
                                                                        .details
                                                                        .x4 /
                                                                    (snapshot.data.rating.details.x1+snapshot.data.rating.details.x2+snapshot.data.rating.details.x3+snapshot.data.rating.details.x4+snapshot.data.rating.details.x5)) *
                                                                120,
                                                            height: 8,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.amber,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          2.0),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                child: Row(
                                                  children: <Widget>[
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          right: 4.0),
                                                      child: Row(
                                                        children: <Widget>[
                                                          Icon(Icons.star,
                                                              color: Colors
                                                                  .white70,
                                                              size: 10),
                                                          Icon(Icons.star,
                                                              color: Colors
                                                                  .white70,
                                                              size: 10),
                                                          Icon(Icons.star,
                                                              color: Colors
                                                                  .white70,
                                                              size: 10),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 120,
                                                      height: 5,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white38,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2.0),
                                                      ),
                                                      child: Row(
                                                        children: <Widget>[
                                                          Container(
                                                            width: (snapshot.data
                                                                        .rating
                                                                        .details
                                                                        .x3 /
                                                                    (snapshot.data.rating.details.x1+snapshot.data.rating.details.x2+snapshot.data.rating.details.x3+snapshot.data.rating.details.x4+snapshot.data.rating.details.x5)) *
                                                                120,
                                                            height: 8,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.amber,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          2.0),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                child: Row(
                                                  children: <Widget>[
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          right: 4.0),
                                                      child: Row(
                                                        children: <Widget>[
                                                          Icon(Icons.star,
                                                              color: Colors
                                                                  .white70,
                                                              size: 10),
                                                          Icon(Icons.star,
                                                              color: Colors
                                                                  .white70,
                                                              size: 10),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 120,
                                                      height: 5,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white38,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2.0),
                                                      ),
                                                      child: Row(
                                                        children: <Widget>[
                                                          Container(
                                                            width: (snapshot.data
                                                                        .rating
                                                                        .details
                                                                        .x2 /
                                                                    (snapshot.data.rating.details.x1+snapshot.data.rating.details.x2+snapshot.data.rating.details.x3+snapshot.data.rating.details.x4+snapshot.data.rating.details.x5)) *
                                                                120,
                                                            height: 8,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.amber,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          2.0),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                child: Row(
                                                  children: <Widget>[
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          right: 4.0),
                                                      child: Row(
                                                        children: <Widget>[
                                                          Icon(Icons.star,
                                                              color: Colors
                                                                  .white70,
                                                              size: 10),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 120,
                                                      height: 5,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white38,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2.0),
                                                      ),
                                                      child: Row(
                                                        children: <Widget>[
                                                          Container(
                                                            width: (snapshot.data.rating.details.x1 /
                                                                (snapshot.data.rating.details.x1+snapshot.data.rating.details.x2+snapshot.data.rating.details.x3+snapshot.data.rating.details.x4+snapshot.data.rating.details.x5)) * 120,
                                                            height: 8,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.amber,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          2.0),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),

                                              ///总评分人数栏
                                              Container(
                                                child: Text(
                                                   '${snapshot.data.ratingsCount}人评分',
                                                    style: TextStyle(fontSize: 10.0, color: Colors.white38)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  ///分割线栏
                                  Container(
                                    padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                                    child: Divider(
                                      color: Colors.white24,
                                    ),
                                  ),

                                  ///看过 想看 人数栏
                                  Container(
                                    padding: EdgeInsets.fromLTRB(16, 0, 2, 6),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          child: Text(
                                              (snapshot.data.collectCount / 10000.0).toString().substring(0,3) + '万人看过',
                                              style: TextStyle(
                                                  color: Colors.white54,
                                                  fontSize: 11.0)),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 8.0),
                                          child: Text(
                                              (snapshot.data.wishCount / 10000.0).toString().substring(0,3) + '万人想看',
                                              style: TextStyle(
                                                  color: Colors.white54,
                                                  fontSize: 11.0)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Center(
            child: Container(),
          );
        },
      ),
    );
  }
}
