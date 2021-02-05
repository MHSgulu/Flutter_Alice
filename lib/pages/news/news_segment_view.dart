import 'package:alice/common/const/arguments.dart';
import 'package:alice/common/const/cupertino_routes.dart';
import 'package:alice/common/global/theme_mode.dart';
import 'package:alice/common/network/http_util.dart';
import 'package:alice/model/news_entity.dart';
import 'package:alice/widgets/custom/my_fade_in_image.dart';
import 'package:alice/widgets/custom/my_rounded_rectang_card.dart';
import 'package:alice/widgets/loading/news_loading_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsSegmentView extends StatefulWidget {
  final String channelName;

  NewsSegmentView({
    Key key,
    @required this.channelName,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NewsSegmentViewState();
}

class _NewsSegmentViewState extends State<NewsSegmentView> {
  Future<NewsEntity> _futureNewsEntity;

  @override
  void initState() {
    _futureNewsEntity = HttpUtil.fetchNewsListData(widget.channelName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsEntity>(
      future: _futureNewsEntity,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            padding: EdgeInsets.fromLTRB(4, 0, 4, 8),
            itemCount: snapshot.data.result.result.xList.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    PageName.newsDetailPage,
                    arguments: NewsDetailArguments(
                      snapshot.data.result.result.xList[index],
                    ),
                  );
                },
                child: MyRRectCard(
                  elevation: 0.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      MyFadeInImage(
                        imageUrl: snapshot.data.result.result.xList[index].pic,
                        width: double.infinity,
                        height: 130,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(8, 6, 4, 0),
                        child: Text(
                          snapshot.data.result.result.xList[index].title,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(8, 6, 8, 6),
                        child: Row(
                          children: <Widget>[
                            Text(
                              snapshot.data.result.result.xList[index].time,
                              style: TextStyle(
                                fontSize: 11,
                                color: AppThemeMode.lightTextColors,
                              ),
                            ),
                            Expanded(child: Container()),
                            Text(
                              snapshot.data.result.result.xList[index].src,
                              style: TextStyle(
                                fontSize: 11,
                                color: AppThemeMode.lightTextColors,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text("${snapshot.error}"),
          );
        }
        return NewsLoadingView();
      },
    );
  }
}
