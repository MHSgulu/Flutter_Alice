import 'package:alice/common/network/http_util.dart';
import 'package:alice/common/util/tool_util.dart';
import 'package:alice/model/m_time_movie_detail_entity.dart';
import 'package:alice/widgets/custom/custom_scroll_behavior.dart';
import 'package:alice/widgets/custom/my_loading_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:palette_generator/palette_generator.dart';
import 'package:transparent_image/transparent_image.dart';

class MovieDetailsPage extends StatefulWidget {
  final String movieId;
  final String imgUrl;

  MovieDetailsPage({Key key, @required this.movieId, @required this.imgUrl})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => MovieDetailsPageState();
}

class MovieDetailsPageState extends State<MovieDetailsPage> {
  Future<MTimeMovieDetailEntity> _future;
  Color dynamicBackgroundColor; //动态背景色
  bool isExpand = false; //是否展开电影简介的内容
  bool isOpen = false; //是否展开item当前用户评论的内容
  int openIndex;
  PaletteGenerator generator;

  Future<void> fetchMainColorPicture(String imageUrl) async {
    generator = await PaletteGenerator.fromImageProvider(
      NetworkImage(imageUrl),
    );
    if (generator == null || generator.colors.isEmpty) {
      dynamicBackgroundColor = Colors.grey[850];
    } else {
      setState(() {
        dynamicBackgroundColor = generator.dominantColor.color;
        print(dynamicBackgroundColor.toString());
      });
    }
  }

  @override
  void initState() {
    fetchMainColorPicture(widget.imgUrl);
    _future = HttpUtil.fetchTimeMovieDetailData(widget.movieId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return dynamicBackgroundColor == null
        ? themeColorsLoadingView()
        : themeColorsMovieView();
  }

  Widget themeColorsLoadingView() {
    return Scaffold(
      body: MyLoadingIndicator(
        valueColor: Colors.teal[400],
        strokeWidth: 3,
      ),
    );
  }

  Widget themeColorsMovieView() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dynamicBackgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('电影', style: TextStyle(fontSize: 16)),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: () => Fluttertoast.showToast(msg: '动作'),
          ),
        ],
        elevation: 1,
      ),
      body: movieFutureBuilder(),
    );
  }

  Widget movieFutureBuilder() {
    return FutureBuilder<MTimeMovieDetailEntity>(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ScrollConfiguration(
            behavior: CustomScrollBehavior(
              isShowLeading: true,
              isShowTrailing: true,
              color: dynamicBackgroundColor,
            ),
            child: SingleChildScrollView(
              child: Container(
                color: dynamicBackgroundColor,
                padding: EdgeInsets.fromLTRB(8, 8, 8, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //电影信息栏
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Card(
                          elevation: 2,
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: Container(
                            color: dynamicBackgroundColor,
                            child: FadeInImage.memoryNetwork(
                              width: 110,
                              fit: BoxFit.cover,
                              placeholder: kTransparentImage,
                              image: snapshot.data.data.basic.img,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(8, 4, 0, 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  snapshot.data.data.basic.name,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                  maxLines: 2, //文字显示最大行数
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  snapshot.data.data.basic.name ==
                                          snapshot.data.data.basic.nameEn
                                      ? ' (${snapshot.data.data.basic.year})'
                                      : snapshot.data.data.basic.nameEn +
                                          ' (${snapshot.data.data.basic.year})',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  maxLines: 2, //文字显示最大行数
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  '${ToolUtil.listToString(snapshot.data.data.basic.type)} / 上映时间:  ${snapshot.data.data.basic.releaseDate} (中国大陆) / 片长:  ${snapshot.data.data.basic.mins.isEmpty ? '未知' : snapshot.data.data.basic.mins}',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white70,
                                  ),
                                  maxLines: 2, //文字显示最大行数
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    //评分栏
                    Container(
                      margin: EdgeInsets.fromLTRB(8, 16, 8, 16),
                      padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                '电影评分',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                ),
                              ),
                              Container(width: 10),
                              RatingBarIndicator(
                                rating: snapshot.data.data.basic.overallRating >
                                        0
                                    ? snapshot.data.data.basic.overallRating /
                                        2.0
                                    : 0,
                                itemSize: 13,
                                itemBuilder: (context, index) {
                                  return Icon(
                                    Icons.star_rounded,
                                    color: Colors.amber[700],
                                  );
                                },
                              ),
                              Container(width: 10),
                              Text(
                                snapshot.data.data.basic.overallRating < 0
                                    ? '暂未上映'
                                    : '${snapshot.data.data.basic.overallRating}',
                                style: TextStyle(
                                  fontSize:
                                      snapshot.data.data.basic.overallRating < 0
                                          ? 12
                                          : 14,
                                  color:
                                      snapshot.data.data.basic.overallRating < 0
                                          ? Colors.white60
                                          : Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Divider(color: Colors.white24),
                          Row(
                            children: <Widget>[
                              Text(
                                '影迷标记',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                ),
                              ),
                              Container(width: 10),
                              Text(
                                '${snapshot.data.data.basic.ratingCountShow}人评分',
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 11,
                                ),
                              ),
                              Container(width: 8),
                              Text(
                                '${snapshot.data.data.basic.hasSeenCountShow}人看过',
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 11,
                                ),
                              ),
                              Container(width: 8),
                              Text(
                                '${snapshot.data.data.basic.wantToSeeCountShow}人想看',
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    //相关分类栏
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: Text(
                            '相关分类',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12.5,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 25,
                            margin: EdgeInsets.only(top: 4),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: snapshot.data.data.basic.type.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  margin: EdgeInsets.only(right: 12),
                                  padding: EdgeInsets.fromLTRB(8, 2, 10, 2),
                                  decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Text(
                                      snapshot.data.data.basic.type[index],
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 12,
                                      )),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    //简介栏
                    Container(
                      padding: EdgeInsets.fromLTRB(8, 16, 8, 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text('简介',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                )),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 8),
                            child: isExpand
                                ? Text(
                                    snapshot.data.data.basic.story,
                                    style: TextStyle(color: Colors.white60),
                                  )
                                : LayoutBuilder(builder: (context, size) {
                                    return Column(
                                      children: <Widget>[
                                        Text.rich(
                                          TextSpan(
                                            text:
                                                snapshot.data.data.basic.story,
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white70),
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 4,
                                        ),
                                        ToolUtil.isFilmIntroductionOverflow(
                                                snapshot.data.data.basic.story,
                                                size.maxWidth)
                                            ? GestureDetector(
                                                onTap: () {
                                                  //print('点击展开');
                                                  setState(() {
                                                    isExpand = true;
                                                  });
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                      '展开',
                                                      style: TextStyle(
                                                          color: Colors.white70,
                                                          fontSize: 13),
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          top: 2.0),
                                                      child: Icon(
                                                          Icons
                                                              .keyboard_arrow_down,
                                                          color:
                                                              Colors.white70),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            : Container(),
                                      ],
                                    );
                                  }),
                          ),
                        ],
                      ),
                    ),
                    //演职员栏
                    Container(
                      padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Text('演职员',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                )),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            snapshot.data.data.basic.actors.length + 1 > 6
                                ? 6
                                : snapshot.data.data.basic.actors.length + 1,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: <Widget>[
                              Card(
                                clipBehavior: Clip.antiAlias,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: index == 0
                                      ? snapshot.data.data.basic.director.img
                                      : snapshot.data.data.basic
                                          .actors[index - 1].img,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    width: 80,
                                    height: 120,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  placeholder: (context, url) => MyLoadingIndicator(
                                    valueColor: dynamicBackgroundColor,
                                    strokeWidth: 2,
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              ),
                              Container(
                                child: Text(
                                  index == 0
                                      ? snapshot.data.data.basic.director.name
                                      : snapshot.data.data.basic
                                          .actors[index - 1].name,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(8, 16, 8, 8),
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Text('预告片 / 剧照',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white)),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Row(
                              children: <Widget>[
                                Text('全部',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white60,
                                    )),
                                Icon(Icons.arrow_forward_ios_rounded,
                                    color: Colors.white60, size: 12),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    //预告片、剧照栏
                    Container(
                      height: 160,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            snapshot.data.data.basic.stageImg.xList.length + 1,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: index == 0
                                ? CachedNetworkImage(
                                    imageUrl:
                                        snapshot.data.data.basic.video.img,
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      width: 200,
                                      height: 150,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: <Widget>[
                                          Positioned(
                                            top: 4,
                                            left: 4,
                                            child: Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  3, 1, 3, 2),
                                              decoration: BoxDecoration(
                                                color: Colors.amber,
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                              ),
                                              child: Text('预告片',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 11)),
                                            ),
                                          ),
                                          Container(
                                            child: Icon(
                                                Icons.play_circle_outline,
                                                color: Colors.white,
                                                size: 28),
                                          ),
                                        ],
                                      ),
                                    ),
                                    placeholder: (context, url) => MyLoadingIndicator(
                                      valueColor: dynamicBackgroundColor,
                                      strokeWidth: 2,
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  )
                                : CachedNetworkImage(
                                    imageUrl: snapshot.data.data.basic.stageImg
                                        .xList[index - 1].imgUrl,
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      width: 200,
                                      height: 150,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    placeholder: (context, url) => MyLoadingIndicator(
                                      valueColor: dynamicBackgroundColor,
                                      strokeWidth: 2,
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text("${snapshot.error}"),
          );
        }
        return MyLoadingIndicator(
          valueColor: Colors.teal[400],
          strokeWidth: 3,
        );
      },
    );
  }
}
