import 'package:alice/generated/json/search_news_entity_helper.dart';
import 'package:alice/model/search_news_entity.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import 'news_detail_screen.dart';



/*异步网络操作*/
Future<SearchNewsEntity> queryNews(String keyword) async {
  final http.Response response = await http.post(
    'https://way.jd.com/jisuapi/newSearch?keyword=${keyword}&appkey=bd1ee420d53dcd93f21d338cd6bebba3',
  );
  if (response.statusCode == 200) {
    return searchNewsEntityFromJson(SearchNewsEntity(),json.decode(response.body));
  } else {
    throw Exception('服务器未响应未成功');
  }
}


class SearchNewsListScreen extends StatefulWidget{

  final String keyword;

  SearchNewsListScreen({Key key, @required this.keyword}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SearchNewsListScreenState();
  }

}

class SearchNewsListScreenState extends State<SearchNewsListScreen> {

  Future<SearchNewsEntity> _futureSearchNewsEntity;

  @override
  void initState() {
    super.initState();
    _futureSearchNewsEntity = queryNews(widget.keyword);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent[200],
          title: Text('搜索新闻结果'),
        ),
        body: Builder(
            builder: (context){
              return FutureBuilder<SearchNewsEntity>(
                future: _futureSearchNewsEntity,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return  ListView.builder(
                      padding: const EdgeInsets.all(4),
                      itemExtent: 200,
                      itemCount: snapshot.data.result.result.xList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NewsDetailScreen(
                                    title: snapshot.data.result.result.xList[index].title,
                                    src: snapshot.data.result.result.xList[index].src,
                                    time: snapshot.data.result.result.xList[index].time,
                                    content: snapshot.data.result.result.xList[index].content,
                                  ),
                                ),
                              );
                            },
                            child: Card(
                              child: Container(
                                child:Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.fromLTRB(8, 4, 2, 8),
                                      child: Text(snapshot.data.result.result.xList[index].title),
                                    ),
                                    Container(
                                      child: Expanded(
                                        child: Center(
                                          child: FadeInImage.memoryNetwork(
                                            placeholder: kTransparentImage,
                                            ///为了防止 有数据字段没有pic字段 进行判空
                                            image: snapshot.data.result.result.xList[index].pic == null
                                                ? 'http://hbimg.b0.upaiyun.com/348d78256f8f810af1291d357c8aa233a0b6a1f64b0b8-C6KJIS_fw658'
                                                : snapshot.data.result.result.xList[index].pic,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(8, 8, 8, 4),
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            child: Text(snapshot.data.result.result.xList[index].time, style: TextStyle(color: Colors.black54,fontSize:12.0)),
                                          ),
                                          ///行的中间由伸展部件补上
                                          Expanded(
                                            child: Container(),
                                          ),
                                          Text(snapshot.data.result.result.xList[index].src, style: TextStyle(color: Colors.black54,fontSize:12.0)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ) ,
                              ),
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
        )
    );
  }

}