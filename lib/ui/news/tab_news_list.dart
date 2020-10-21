import 'package:alice/http/http_util.dart';
import 'package:alice/model/news_entity.dart';
import 'package:alice/ui/news/news_detail.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



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
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CachedNetworkImage(
                        imageUrl: snapshot.data.result.result.xList[index].pic,
                        imageBuilder: (context, imageProvider) => Container(
                          height: 130,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                              //在绘制图像之前应用于图像的颜色过滤器。
                              //colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn),
                            ),
                          ),
                        ),
                        placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent[200]),
                          ),
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(8, 6, 4, 0),
                        child: Text(
                            snapshot.data.result.result.xList[index].title),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(8, 6, 8, 6),
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: Text(
                                  snapshot.data.result.result.xList[index].time,
                                  style: TextStyle(fontSize: 11)),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            Text(snapshot.data.result.result.xList[index].src,
                                style: TextStyle(fontSize: 11)),
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
