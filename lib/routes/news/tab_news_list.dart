import 'package:alice/common/global/theme_mode.dart';
import 'package:alice/common/network/http_util.dart';
import 'package:alice/model/news_entity.dart';
import 'package:alice/widgets/custom/my_fade_in_image.dart';
import 'package:alice/widgets/custom/my_rounded_rectang_card.dart';
import 'package:alice/widgets/loading/news_loading_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'news_detail.dart';

class TabNewsList extends StatefulWidget {
  final String channelName;

  TabNewsList({Key key, @required this.channelName}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NewsListState();
}

class _NewsListState extends State<TabNewsList> {
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
            padding: EdgeInsets.all(4),
            itemCount: snapshot.data.result.result.xList.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewsDetailPage(
                        title: snapshot.data.result.result.xList[index].title,
                        src: snapshot.data.result.result.xList[index].src,
                        time: snapshot.data.result.result.xList[index].time,
                        content:
                            snapshot.data.result.result.xList[index].content,
                      ),
                    ),
                  );
                },
                child: MyRRectCard(
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
