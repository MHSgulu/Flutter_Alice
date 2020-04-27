import 'package:alice/generated/json/moive_details_entity_helper.dart';
import 'package:alice/generated/json/short_film_review_entity_helper.dart';
import 'package:alice/model/movie_entity.dart';
import 'package:alice/model/short_film_review_entity.dart';
import 'package:alice/ui/movie/all_film_stills_screen.dart';
import 'package:alice/ui/movie/movie_related_videos_screen.dart';
import 'package:alice/ui/movie/movie_stars_widget.dart';
import 'package:alice/util/film_stills_photo_view_gallry_screen.dart';
import 'package:alice/util/photo_view_single_screen.dart';
import 'package:alice/values/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:alice/model/moive_details_entity.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:palette_generator/palette_generator.dart';
import 'package:transparent_image/transparent_image.dart';


///List  转String  直接toString()会带上方括号[]
String listToString(List list) {
  StringBuffer sb = new StringBuffer();
  list.forEach((item) {
    sb.write(' $item ');
  });
  return sb.toString();
}

///判断电影简介的文本是否溢出
bool isFilmIntroductionOverflow(String text, double maxWidth) {

  var textPainter = TextPainter(
    maxLines: 4,
    textAlign: TextAlign.left,
    textDirection: TextDirection.ltr,
    text: TextSpan(
      text: text,
      style: TextStyle(color: Colors.white70),
    ),
  )..layout(maxWidth: maxWidth);

  return textPainter.didExceedMaxLines;

}


///判断用户评论的文本是否溢出
bool isCommentTextOverflow(String text, double maxWidth) {
  // 生成文本跨度
  var span = TextSpan(
    text: text,
    style: TextStyle(color: Colors.white70),
  );

// 文本绘制器 确定是否超过最大行数
  var tp = TextPainter(
    maxLines: 4,
    textAlign: TextAlign.left,
    textDirection: TextDirection.ltr,
    text: span,
  );

// 触发到布局
  tp.layout(maxWidth: maxWidth);

// 文本是否溢出
  var exceeded = tp.didExceedMaxLines;

  return exceeded;

}



/*网络请求异步操作 根据电影id请求电影详情*/
Future<MoiveDetailsEntity> fetchMovieDetailsData(String movieId) async {
  final response = await http.get(
      'http://api.douban.com/v2/movie/subject/${movieId}?apikey=0b2bdeda43b5688921839c8ecb20399b');

  if (response.statusCode == 200) {
    //如果服务器确实返回了200 OK响应,然后解析JSON
    return moiveDetailsEntityFromJson(MoiveDetailsEntity(), json.decode(response.body));
  } else {
    //如果服务器没有返回200 OK响应,然后抛出一个异常。
    throw Exception('服务器未响应成功');
  }
}


/*网络请求异步操作 根据电影id请求电影短评*/
Future<ShortFilmReviewEntity> fetchMovieShortReviewData(String movieId) async {
  final response = await http.get(
      'https://api.douban.com/v2/movie/subject/${movieId}/comments?apikey=0b2bdeda43b5688921839c8ecb20399b');

  if (response.statusCode == 200) {
    //如果服务器确实返回了200 OK响应,然后解析JSON
    return shortFilmReviewEntityFromJson(ShortFilmReviewEntity(), json.decode(response.body));
  } else {
    //如果服务器没有返回200 OK响应,然后抛出一个异常。
    throw Exception('服务器未响应成功');
  }
}







class MovieDetailsScreen extends StatefulWidget {
  final String movieId;
  final MovieSubject data;

  MovieDetailsScreen({Key key, @required this.movieId, @required this.data}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MovieDetailsScreenState();
  }
}

class MovieDetailsScreenState extends State<MovieDetailsScreen> {

  Future<MoiveDetailsEntity> futureMoiveDetailsEntity;
  //Future<ShortFilmReviewEntity> futureShortFilmReviewEntity;
  MovieSubject movieSubject;
  ///动态背景色
  Color dynamicBackgroundColor;
  ///是否展开电影简介的内容
  bool isExpand = false;
  ///是否展开item当前用户评论的内容
  bool isOpen = false;
  int openIndex;

  PaletteGenerator generator;


  Future<void> fetchMainColorPicture() async {
    generator = await PaletteGenerator.fromImageProvider(
      NetworkImage(movieSubject.images.small),
    );
    if (generator == null || generator.colors.isEmpty) {
      dynamicBackgroundColor = MyColors.movieDetailsBackgroundColor;
      }
    else {
      ///setState防止AppBar颜色不更改
      setState(() {
        dynamicBackgroundColor = generator.dominantColor.color;
        print(dynamicBackgroundColor.toString());
      });
      }
  }
  
  
  @override
  void initState() {
    super.initState();
    movieSubject = widget.data;
    fetchMainColorPicture();
    futureMoiveDetailsEntity = fetchMovieDetailsData(widget.movieId);
    //futureShortFilmReviewEntity = fetchMovieShortReviewData(widget.movieId);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0, //阴影度
        ///此处代码 防止AppBar颜色与页面不一致  页面的颜色加载慢  AppBar特别快
        backgroundColor: dynamicBackgroundColor == null ? MyColors.movieDetailsBackgroundColor : dynamicBackgroundColor,
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
                color: dynamicBackgroundColor == null ? MyColors.movieDetailsBackgroundColor : dynamicBackgroundColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,  //该代码为了使简介栏 横轴 左开始
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
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => PhotoViewSimpleScreen(
                                      imageProvider:NetworkImage(snapshot.data.images.large),
                                      ///必须设为double类型
                                      minScale: 0.5,  ///定义允许图像采用的最小大小，它与原始图像大小成比例
                                      maxScale: 0.8,  ///定义允许图像采用的最大大小，它与原始图像大小成比例。
                                      heroTag: 'simple',
                                    )),
                                  );
                                },
                                child: Container(
                                  color: dynamicBackgroundColor == null ? MyColors.movieDetailsBackgroundColor : dynamicBackgroundColor,
                                  child: FadeInImage.memoryNetwork(
                                    width: 110,
                                    fit: BoxFit.fitHeight,
                                    placeholder: kTransparentImage,
                                    image: snapshot.data.images.medium,
                                  ),
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
                                      ///检查durations List是否为空  和null判断无效果 要用到isEmpty
                                      '${listToString(snapshot.data.countries)} / ${listToString(snapshot.data.genres)} / 上映时间:  ${snapshot.data.mainlandPubdate} (中国大陆) / 片长:  ${snapshot.data.durations.isEmpty ? '未知' : snapshot.data.durations[0]}',
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
                            ///未上映
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
                            ///已上映
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
                    ///相关分类栏
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(16, 0, 8, 0),
                            child: Text('相关分类', style: TextStyle(color: Colors.white54, fontSize: 13.0)),
                          ),
                          ///当横向列表被嵌套在行里  对容器进行宽高约束
                          Container(
                            width: 260,
                            height: 25,
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: snapshot.data.tags.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Container(
                                      margin: EdgeInsets.only(right: 12.0),
                                      padding: EdgeInsets.fromLTRB(8, 2, 10, 2),
                                      decoration: BoxDecoration(
                                        color: Colors.black12,
                                        borderRadius: BorderRadius.circular(16.0),
                                        ),
                                      child: Text(snapshot.data.tags[index], style: TextStyle(color: Colors.white70, fontSize: 13.0)),
                                    );
                                  },
                              ),
                          ),
                        ],
                      ),
                    ),
                    ///简介栏
                    Container(
                      padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start, //该代码为了使简介栏 两列文字 左对齐
                        children: <Widget>[
                          Container(
                            child: Text('简介',style: TextStyle(fontSize: 16, color: Colors.white)),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 8.0),
                            child: isExpand
                                ? Text(
                              snapshot.data.summary,
                              style: TextStyle(color: Colors.white70),)
                                : LayoutBuilder(builder: (context,size){
                              return Column(
                                children: <Widget>[
                                  Text.rich(
                                    TextSpan(
                                      text: snapshot.data.summary,
                                      style: TextStyle(fontSize: 14,color: Colors.white70),
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 4,
                                  ),
                                  isFilmIntroductionOverflow(snapshot.data.summary, size.maxWidth)
                                      ? GestureDetector(
                                    onTap: (){
                                      //print('点击展开');
                                      setState(() {
                                        isExpand = true;
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          '展开',
                                          style: TextStyle(color: Colors.white70,fontSize: 13),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(top: 2.0),
                                          child: Icon(Icons.keyboard_arrow_down, color: Colors.white70),
                                        ),
                                      ],),
                                  )
                                      : Container(),
                                ],
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                    ///演职员栏 标题栏
                    Container(
                      padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Text('演职员', style: TextStyle(fontSize: 16, color: Colors.white)),
                          )
                        ],
                      ),
                    ),
                    ///演职员栏
                    Container(
                      //width: 390,
                      height: 150,
                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: snapshot.data.directors.length + snapshot.data.casts.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Card(
                                    elevation: 2.0,
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadiusDirectional.circular(4.0)),
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Image.network(
                                        ///先判断 是否把导演图片数据取完，在判断是否有演员图片，再取出演员图片数据
                                       snapshot.data.directors.length - index > 0
                                            ?  snapshot.data.directors[index].avatars.small
                                            :  snapshot.data.casts[index-snapshot.data.directors.length].avatars == null
                                             ? 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1587698979260&di=f640134e030eb7b7d8f208069f5896f6&imgtype=0&src=http%3A%2F%2Fpic2.cxtuku.com%2F00%2F05%2F13%2Fb845ec14e524.jpg'
                                             : snapshot.data.casts[index-snapshot.data.directors.length].avatars.small,
                                        width: 80,
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    snapshot.data.directors.length - index > 0
                                        ?  snapshot.data.directors[index].name
                                        :  snapshot.data.casts[index-snapshot.data.directors.length].name,
                                    style: TextStyle(color: Colors.white, fontSize: 13),
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
                    ///预告片、剧照标题栏
                    Container(
                      padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Text('预告片 / 剧照', style: TextStyle(fontSize: 16, color: Colors.white)),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => AllFilmStillsScreen(
                                  movieId: snapshot.data.id,valueColor: dynamicBackgroundColor)));
                            },
                            child: Row(
                              children: <Widget>[
                                Container(
                                  child: Text('全部', style: TextStyle(fontSize: 12, color: Colors.white60)),
                                ),
                                Container(
                                  child: Icon(Icons.navigate_next, color: Colors.white60, size: 22),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    ///预告片、剧照栏
                    Container(
                      //width: 390,
                      height: 180,
                      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        ///预告片内容为空，列表长度为剧照的长度，方便按照index取出剧照数据 不为空 剧照数据长度+1 只取出一个预告片数据
                        itemCount: snapshot.data.trailers.isEmpty ?  snapshot.data.photos.length : snapshot.data.photos.length + 1,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Card(
                                    elevation: 2.0,
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadiusDirectional.circular(4.0)),
                                    child: GestureDetector(
                                      onTap: () {
                                        if(snapshot.data.trailers.isNotEmpty){
                                          if(index == 0){
                                            //print('这是视频');
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => MovieRelatedVideosScreen(
                                              videoUrl: snapshot.data.trailers[index].resourceUrl,
                                              data: snapshot.data.trailers,
                                              data2: snapshot.data.bloopers,
                                              data3: snapshot.data.clips,
                                            )));
                                          }else{
                                            //print('剩下的都是剧照');
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => PhotoViewGalleryScreen(
                                                imageList: snapshot.data.photos,//传入图片list
                                                index: index-1,//传入当前点击的图片的index
                                                heroTag: 'hero${index-1}',//传入当前点击的图片的hero tag （可选）
                                              )),
                                            );
                                          }
                                        }else{
                                          //print('全是剧照');
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => PhotoViewGalleryScreen(
                                              imageList: snapshot.data.photos,//传入图片list
                                              index: index,//传入当前点击的图片的index
                                              heroTag: 'hero${index}',//传入当前点击的图片的hero tag （可选）
                                            )),
                                          );
                                        }
                                      },
                                      ///判断预告片内容不为空，加载预告片和剧照数据，为空 只加载剧照数据
                                      child: snapshot.data.trailers.isNotEmpty
                                          ? index == 0
                                            ? Container(
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: <Widget>[
                                            Image.network(
                                              snapshot.data.trailers[index].medium,
                                              width: 200,
                                              height: 150,
                                              fit: BoxFit.cover,
                                            ),
                                            Positioned(
                                              top: 4,
                                              left: 4,
                                              child: Container(
                                                padding: EdgeInsets.fromLTRB(3, 1, 3, 2),
                                                decoration: BoxDecoration(
                                                  color: Colors.amber,
                                                  borderRadius: BorderRadius.circular(2.0),
                                                ),
                                                child: Text('预告片', style: TextStyle(color: Colors.white, fontSize: 11)),
                                              ),
                                            ),
                                            Container(
                                              child: Icon(Icons.play_circle_outline, color: Colors.white, size: 28),
                                            ),
                                          ],
                                        ),
                                      )
                                            : FadeInImage.memoryNetwork(
                                        placeholder: kTransparentImage,
                                        image: snapshot.data.photos[index-1].image,
                                        width: 200,
                                        height: 150,
                                        fit: BoxFit.cover,
                                      )
                                          : FadeInImage.memoryNetwork(
                                        placeholder: kTransparentImage,
                                        image: snapshot.data.photos[index].image,
                                        width: 200,
                                        height: 150,
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
                    ),
                    ///短评栏
                    Container(
                      margin: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            ///短评标题栏
                            Container(
                              padding: EdgeInsets.fromLTRB(16, 10, 2, 8),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    child: Text('短评',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.0)),
                                  ),
                                  Expanded(
                                    child: Container(),
                                  ),
                                  Container(
                                    child: Text(
                                      '全部'+snapshot.data.commentsCount.toString(),
                                      style: TextStyle(color: Colors.white60, fontSize: 12),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(right: 4.0),
                                    child: Icon(Icons.navigate_next,
                                        color: Colors.white60, size: 20),
                                  ),
                                ],
                              ),
                            ),
                            ///短评列表栏
                            Container(
                              child:  snapshot.data.popularComments.isEmpty ? Container() : ListView.separated(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: snapshot.data.popularComments.length,
                                separatorBuilder: (BuildContext context, int index){
                                  return Container(
                                    padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                                    child: Divider(
                                      color: Colors.white10,
                                      //height: 20,
                                    ),
                                  );
                                },
                                itemBuilder: (BuildContext context, int index){
                                  return Container(
                                    padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        ///用户评论信息栏
                                        Container(
                                          child: Row(
                                            children: <Widget>[
                                              ///用户头像
                                              Container(
                                                child: ClipOval(
                                                  child: Image.network(
                                                    snapshot.data.popularComments[index].author.avatar,
                                                    width: 30,
                                                  ),
                                                ),
                                              ),
                                              ///用户名称、评分星级、评论时间
                                              Container(
                                                padding: EdgeInsets.only(left: 10.0),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Container(
                                                      child: Text(
                                                        snapshot.data.popularComments[index].author.name,
                                                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Row(
                                                        children: <Widget>[
                                                          ///用户评星
                                                          Container(
                                                            //padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                            child: snapshot.data.popularComments[index].rating.value == 5 ? FiveStarsScore()
                                                                : snapshot.data.popularComments[index].rating.value == 4 ? FourStarsScore()
                                                                : snapshot.data.popularComments[index].rating.value == 3 ? ThreeStarsScore()
                                                                : snapshot.data.popularComments[index].rating.value == 2 ? TwoStarsScore()
                                                                : snapshot.data.popularComments[index].rating.value == 1 ? OneStarsScore() : NoStarsScore(),
                                                          ),
                                                          ///用户评论时间
                                                          Container(
                                                            child: Text(
                                                              snapshot.data.popularComments[index].createdAt.substring(0,10),
                                                              style: TextStyle(color: Colors.white54, fontSize: 12),
                                                            ),
                                                            padding: EdgeInsets.only(left: 8.0),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(),
                                              ),
                                              Container(
                                                child: Icon(Icons.more_horiz, color: Colors.white60),
                                              ),
                                            ],
                                          ),
                                        ),
                                        ///评论内容栏
                                        Container(
                                          padding: EdgeInsets.fromLTRB(0, 16, 0, 4),
                                          child:  openIndex == index  ? Text(
                                              snapshot.data.popularComments[index].content,
                                              style: TextStyle(color: Colors.white70)) : LayoutBuilder(builder: (context,size){
                                            return Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text.rich(
                                                  TextSpan(
                                                    text: snapshot.data.popularComments[index].content,
                                                    style: TextStyle(fontSize: 14,color: Colors.white70),
                                                  ),
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 4,
                                                ),
                                                isCommentTextOverflow(snapshot.data.popularComments[index].content, size.maxWidth)
                                                    ? GestureDetector(
                                                  onTap: (){
                                                    //print('点击展开');
                                                    setState(() {
                                                      isOpen = true;
                                                      openIndex = index;
                                                    });
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      Text(
                                                        '展开',
                                                        style: TextStyle(color: Colors.white70),
                                                      ),
                                                      Container(
                                                        padding: EdgeInsets.only(top: 2.0),
                                                        child: Icon(Icons.keyboard_arrow_down, color: Colors.white70),
                                                      ),
                                                    ],),
                                                )
                                                    : Container(),
                                              ],
                                            );
                                          }),
                                        ),
                                        ///评论点赞数
                                        Container(
                                          padding: EdgeInsets.fromLTRB(0, 8, 0, 4),
                                          child: Row(
                                            children: <Widget>[
                                              Container(
                                                child: Icon(Icons.thumb_up, color: Colors.white54, size: 14),
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(left: 8.0),
                                                child: Text(
                                                  snapshot.data.popularComments[index].usefulCount.toString(),
                                                  style: TextStyle(color: Colors.white54, fontSize: 12),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            ///分割栏
                            Container(
                              padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                              child: Divider(
                                color: Colors.white10,
                                //height: 20,
                              ),
                            ),
                            ///短评尾栏
                            Container(
                              padding: EdgeInsets.fromLTRB(16, 8, 8, 16),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    child: Text('查看全部短评',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                  Expanded(
                                    child: Container(),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(right: 4.0),
                                    child: Icon(Icons.navigate_next,
                                        color: Colors.white60, size: 20),
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
          }
          else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.teal[400]),
              strokeWidth: 3,
            ),
          );
        },
      ),
    );
  }
}
