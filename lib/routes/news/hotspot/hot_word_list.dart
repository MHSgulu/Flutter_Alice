import 'package:alice/common/network/http_util.dart';
import 'package:alice/model/real_time_hotspot_entity.dart';
import 'package:alice/routes/news/search_news_screen.dart';
import 'package:alice/widgets/custom/my_loading_indicator.dart';
import 'package:alice/widgets/view/http_error_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HotWordList extends StatefulWidget {
  final String id;

  const HotWordList({Key key, this.id}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HotWordListState();
}

class HotWordListState extends State<HotWordList>
    with AutomaticKeepAliveClientMixin {
  Future<RealTimeHotspotEntity> _futureRealTimeHotspotEntity;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    print('当前页面初始化：热点词ID:${widget.id}');
    _futureRealTimeHotspotEntity = HttpUtil.fetchHotNewsData(widget.id);
    super.initState();
  }

  //重新加载
  void reload() {
    if (mounted) {
      setState(() {
        print('当前页面重新加载： 热点词汇ID:${widget.id}');
        _futureRealTimeHotspotEntity = HttpUtil.fetchHotNewsData(widget.id);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder<RealTimeHotspotEntity>(
      future: _futureRealTimeHotspotEntity,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.separated(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            itemCount: snapshot.data.result.showapiResBody.xList.length,
            separatorBuilder: (BuildContext context, int index) {
              return Divider();
            },
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchNewsScreen(
                                keyword: snapshot.data.result.showapiResBody
                                    .xList[index].name)));
                    Clipboard.setData(ClipboardData(
                        text: snapshot
                            .data.result.showapiResBody.xList[index].name));

                    ///存儲文本到剪切板
                  },
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Text(
                          snapshot.data.result.showapiResBody.xList[index].num,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Container(
                        width: 180,
                        padding: EdgeInsets.only(left: 16.0),
                        child: Text(
                          snapshot.data.result.showapiResBody.xList[index].name,
                          style: TextStyle(fontSize: 15),
                          overflow: TextOverflow.ellipsis,

                          ///文本跨距的可选最大行数，必要时换行。如果文本超过给定的行数，将根据[溢出]进行截断。
                          ///如果为1，文本将不换行。否则，文本将在框的边缘换行。
                          ///如果这是空的，但有一个环境[DefaultTextStyle]为其指定一个显式数字[DefaultTextStyle.maxLines]，则[DefaultTextStyle]值将优先。
                          ///您可以直接使用[RichText]小部件完全覆盖[DefaultTextStyle]。
                          maxLines: 1,
                        ),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      Container(
                        child: Image.asset(
                          'assets/icons/icon_flames.png',
                          width: 20,
                          height: 20,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 40),
                        child: Text(
                          snapshot
                              .data.result.showapiResBody.xList[index].level,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 4),
                        child: snapshot.data.result.showapiResBody.xList[index]
                                    .trend ==
                                'rise'
                            ? Icon(
                                Icons.arrow_upward,
                                color: Colors.redAccent,
                                size: 20,
                              )
                            : Icon(
                                Icons.arrow_downward,
                                color: Colors.teal,
                                size: 20,
                              ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HttpErrorView(errorText: '${snapshot.error}'),
              SizedBox(height: 20),
              RaisedButton(
                onPressed: () => reload(),
                child: Text('刷新'),
              ),
            ],
          );
        }
        return MyLoadingIndicator(valueColor: Colors.blueAccent[200]);
      },
    );
  }
}
