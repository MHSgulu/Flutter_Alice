import 'package:alice/ui/news/search_news_screen.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:alice/generated/json/real_time_hotspot_entity_helper.dart';
import 'package:alice/model/real_time_hotspot_entity.dart';
import 'package:flutter/material.dart';


/*异步网络请求实时热点数据*/
Future<RealTimeHotspotEntity> fetchHotNewsData() async {
  final response = await http.get(
      'https://way.jd.com/showapi/rcInfo?typeId=1&appkey=bd1ee420d53dcd93f21d338cd6bebba3');

  if (response.statusCode == 200) {
    return realTimeHotspotEntityFromJson(
        RealTimeHotspotEntity(), json.decode(response.body));
  } else {
    throw Exception('服务器未响应未成功');
  }
}


/*实时热点排行*/
class RealTimeHotspotScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return RealTimeHotspotScreenState();
  }

}


class RealTimeHotspotScreenState extends State<RealTimeHotspotScreen> {

  Future<RealTimeHotspotEntity> _futureRealTimeHotspotEntity;

  @override
  void initState() {
    super.initState();
    _futureRealTimeHotspotEntity = fetchHotNewsData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[200],
        title: Text('实时热点'),
      ),
      body: FutureBuilder<RealTimeHotspotEntity> (
        future: _futureRealTimeHotspotEntity,
        builder: (context,snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              //padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
              //itemExtent: 50,
              itemCount: snapshot.data.result.showapiResBody.xList.length,
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SearchNewsScreen(keyword: snapshot.data.result.showapiResBody.xList[index].name)));
                      ///存儲文本到剪切板
                      Clipboard.setData(ClipboardData(text: snapshot.data.result.showapiResBody.xList[index].name));
                    },
                    child: Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left:16.0),
                          child: Text(
                            snapshot.data.result.showapiResBody.xList[index].num,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left:16.0),
                          child: Text(
                            snapshot.data.result.showapiResBody.xList[index].name,
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        Container(
                          child: Icon(Icons.whatshot,color: Colors.redAccent, size: 20),
                        ),
                        Container(
                          padding: EdgeInsets.only(right:40),
                          child: Text(snapshot.data.result.showapiResBody.xList[index].level),
                        ),
                        Container(
                          padding: EdgeInsets.only(right:8.0),
                          child: snapshot.data.result.showapiResBody.xList[index].trend == 'rise'
                              ? Icon(Icons.arrow_upward, color: Colors.redAccent, size: 22)
                              : Icon(Icons.arrow_downward, color: Colors.teal,size: 22),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          //默认情况下，显示加载微调器。
          return Center(
            child: CircularProgressIndicator(
              strokeWidth: 3,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent[200]),
            ),
          );
        },
      ),
    );
  }

}