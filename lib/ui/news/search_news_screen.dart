import 'package:alice/generated/json/search_news_entity_helper.dart';
import 'package:alice/model/search_news_entity.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import 'news_detail_screen.dart';


/*异步网络操作*/
Future<SearchNewsEntity> query(String keyword) async {
  final http.Response response = await http.post(
    'https://way.jd.com/jisuapi/newSearch?keyword=${keyword}&appkey=bd1ee420d53dcd93f21d338cd6bebba3',
  );
  if (response.statusCode == 200) {
    return searchNewsEntityFromJson(SearchNewsEntity(),json.decode(response.body));
  } else {
    throw Exception('服务器未响应未成功');
  }
}



class SearchNewsScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return SearchNewsScreenState();
  }

}

class SearchNewsScreenState extends State<SearchNewsScreen> {

  final TextEditingController _controller = TextEditingController();
  Future<SearchNewsEntity> _futureSearchNewsEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[200],
        title: Text('搜你想看的新闻'),
      ),
      body: Builder(
          builder: (context){
            return (_futureSearchNewsEntity == null)
                ?  SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _controller,
                      //autofocus: true,
                      cursorColor: Colors.blueAccent[200],
                      cursorWidth: 2,
                      cursorRadius: Radius.circular(2),
                      style: TextStyle(color: Colors.blueAccent[200]),
                      maxLength: 8,
                      keyboardType:  TextInputType.text,
                      decoration: InputDecoration(
                        //此属性仅在[errorBorder]，[FocusedOrder]、[FocusedRorBorder]、[DisabledOrder]或[EnabledOrder]中的适当一个时使用
                        //未指定时，此边框的[InputBorder.borderSide]属性是由InputDecorator配置，具体取决于[InputDecoration.errorText]，[InputDecoration.enabled]，[InputDecorator.isFocused]和当前的[主题]。
                        //通常是[UnderlineInputBorder]或[OutlineInputBorder]之一。
                        //如果为空，则InputDecorator的默认值为“const UnderlineInputBorder（）”。
                        //[InputBorder.none]，它不绘制边框。[UnderlineInputBorder]，它在输入装饰器容器的底部。[OutlineInputBorder]，一个[InputDecorator]边框，用于绘制输入装饰器容器周围的圆形矩形。
                        border: OutlineInputBorder(
                          ///边框
                          //borderSide: BorderSide(),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),  //边框圆角的半径。 拐角半径必须是圆形的，即它们的[半径x]和[半径y]值必须相同。默认4.0
                          gapPadding: 5.0,  //边框两边的水平填充与[labelText]的宽度间隔。 默认4.0
                        ),
                        labelText: '关键词',
                        labelStyle: TextStyle(color: Colors.blueAccent[200]),
                        hintText: '请在此处输入关键词',
                        hintStyle: TextStyle(color: Colors.black38),
                        helperText: '关键词长度尽量控制在1—4个字符长度',
                        helperStyle: TextStyle(color: Colors.black45),
                        counterStyle: TextStyle(color: Colors.black45),
                        //filled: true,  ///如果为真，则装饰的容器中会填充[fillColor]的颜色。默认情况下，此属性为false。
                        //未获得焦点时的下划线
                        /*enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.blueAccent[200],
                          ),
                        ),*/
                        //获得焦点时的下划线
                        /*focusedBorder: UnderlineInputBorder(
                          ///创建一个边界半径，其中所有半径都是[Radius.circular(radius)].
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: BorderSide(
                            width: 2, //边框(此处为下划线)宽度 默认为1.0
                            color: Colors.blueAccent[200], //边框(此处为下划线)颜色，默认为黑色。
                          ),
                        ),*/
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0,16,8,0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: RaisedButton(
                        onPressed: (){
                          if(_controller.text.trim() == ''){
                            Scaffold.of(context).hideCurrentSnackBar();
                            Scaffold.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('关键词不能为空'),
                                  behavior: SnackBarBehavior.floating,
                                  duration: Duration(seconds: 2),
                                )
                            );
                          }else{
                            print(_controller.text);
                            setState(() {
                              _futureSearchNewsEntity = query(_controller.text);
                            });
                          }
                        },
                        child: Text('搜索',style: TextStyle(color: Colors.blueAccent[200])),
                      ),
                    ),
                  ),
                ],
              ),)
                :  FutureBuilder<SearchNewsEntity>(
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