import 'package:alice/common/const/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';




class TextJokesListPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return TextJokesListViewState();
  }

}


class TextJokesListViewState extends State<TextJokesListPage> {

  int page = 1;

  List<String> dataList;

  bool loading = false;

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    /*_scrollController.addListener((){

      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        print('到达底部');
      }

    });*/


  }


  @override
  Widget build(BuildContext context) {

    var length = dataList?.length ?? 0;

    return Scaffold(
      body: Container(
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          //itemCount: dataList?.length ?? dataList.length + 1,
          itemBuilder: (BuildContext context, int index) {

            if (index == length) {
              _load();
              return new Center(
                child: new Container(
                  margin: const EdgeInsets.only(top: 8.0),
                  width: 20.0,
                  height: 20.0,
                  child: const CircularProgressIndicator(),
                ),
              );
            } else if (index > length) {
              return Container();
            }

            var title = dataList[index];

            return Container(
              child: GestureDetector(
                onTap: (){},
                child: Card(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(16, 12, 8, 8),
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text(title),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 8.0),
                          child: Text('222',style: TextStyle(color: Colors.black54,fontSize:12.0)),
                        ),
                      ],
                    ) ,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }



  Future<void> _load() async {
    if (loading) {
      return null;
    }
    loading = true;
    try {
      var url = "https://way.jd.com/showapi/wbxh?time=2015-07-10&page=$page&maxResult=20&showapi_sign=${Util.showApiSign}&appkey=${Util.jdWxApiKey}";
      var resp = await http.get(url);
      if(resp.statusCode == 200){
        //print('成功resp：'+resp.toString());
        var data = json.decode(resp.body);
        //print('data：'+data.toString());
        var result = data['result'];
        //print('result：'+result.toString());
        var showapi_res_body = result['showapi_res_body'];
       // print('showapi_res_body：'+showapi_res_body.toString());
        var contentlist = showapi_res_body['contentlist'];
        //print('contentList：'+contentlist.toString());
        setState(() {
          page += 1;
          if (contentlist is List) {
            if (dataList == null) {
              dataList = <String>[];
            }
            contentlist.forEach((dynamic e) {
              if (e is Map) {
                dataList.add(e['title'] as String);
              }
            });
          }
        });
      }else{
        print('失败resp：'+resp.toString());
        throw Exception('服务器未响应成功');
      }

    } finally {
      loading = false;
    }
  }





}

