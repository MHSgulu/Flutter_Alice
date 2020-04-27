import 'package:alice/generated/json/movie_entity_helper.dart';
import 'package:alice/model/movie_entity.dart';
import 'package:alice/ui/movie/movie_stars_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';


/*
* 暂时不用 该内容
*/


/*网络请求异步操作*/
Future<MovieEntity> fetchMovieListData() async {
  final response = await http.get('https://api.douban.com/v2/movie/in_theaters?apikey=0b2bdeda43b5688921839c8ecb20399b');

  if (response.statusCode == 200) {
    //如果服务器确实返回了200 OK响应,然后解析JSON
    return movieEntityFromJson(MovieEntity(),json.decode(response.body));
  } else {
    //如果服务器没有返回200 OK响应,然后抛出一个异常。
    throw Exception('服务器未响应成功');
  }
}


class IsShowingUpViewPort extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return IsShowingUpViewPortState();
  }

}


class IsShowingUpViewPortState extends State<IsShowingUpViewPort> {

  Future<MovieEntity> futureMovieEntity;

  @override
  void initState() {
    super.initState();
    futureMovieEntity = fetchMovieListData();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MovieEntity> (
      future: futureMovieEntity,
      builder: (context,snapshot) {
        if (snapshot.hasData) {
          return GridView.builder(
            padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
              shrinkWrap: true,  ///是否根据子组件的总长度来设置列表的长度，默认值为false
              physics: NeverScrollableScrollPhysics(),  ///解决可互动组件的嵌套滑动冲突 禁止滚动 交给最外层滑动
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.55,
                mainAxisSpacing: 0.0,
                crossAxisSpacing: 4.0,
              ),
              ///如果数据列表长度大于等于6，显示6格，否则有多少显示多少数据
              itemCount: snapshot.data.subjects.length >= 6 ?  6 : snapshot.data.subjects.length,
              itemBuilder: (BuildContext context, int index){
                return Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Card(
                          elevation: 2.0,
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusDirectional.circular(2.0)
                          ),
                          child: Container(
                            child: Image.network(
                              snapshot.data.subjects[index].images.large,
                              ///以下两行代码 暂时解决 图片高度不一致的问题 可能会出现不适配的为 比如在手机长度比较小 不是主流机型长宽比的那种
                              fit: BoxFit.fitHeight,
                              height: 150,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          snapshot.data.subjects[index].title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            snapshot.data.subjects[index].rating.average >= 9.5 && snapshot.data.subjects[index].rating.average <= 10 ? FiveStarsScore()
                                : snapshot.data.subjects[index].rating.average >= 8.5 && snapshot.data.subjects[index].rating.average <= 9.4 ? FourStarsHalfScore()
                                 : snapshot.data.subjects[index].rating.average >= 7.5 && snapshot.data.subjects[index].rating.average <= 8.4 ? FourStarsScore()
                                  : snapshot.data.subjects[index].rating.average >= 6.5 && snapshot.data.subjects[index].rating.average <= 7.4 ? ThreeStarsHalfScore()
                                   : snapshot.data.subjects[index].rating.average >= 5.5 && snapshot.data.subjects[index].rating.average <= 6.4 ? ThreeStarsScore()
                                    : snapshot.data.subjects[index].rating.average >= 4.5 && snapshot.data.subjects[index].rating.average <= 5.4 ? TwoStarsHalfScore()
                                     : snapshot.data.subjects[index].rating.average >= 3.5 && snapshot.data.subjects[index].rating.average <= 4.4 ? TwoStarsScore()
                                      : snapshot.data.subjects[index].rating.average >= 2.5 && snapshot.data.subjects[index].rating.average <= 3.4 ? OneStarsHalfScore()
                                       : snapshot.data.subjects[index].rating.average >= 1.5 && snapshot.data.subjects[index].rating.average <= 2.4 ? OneStarsScore()
                                        : snapshot.data.subjects[index].rating.average >= 0.5 && snapshot.data.subjects[index].rating.average <= 1.4 ? HalfStarsScore() : NoStarsScore()
                            ,
                            Container(
                              padding: EdgeInsets.only(left: 4.0),
                              child: Text('${snapshot.data.subjects[index].rating.average}', style: TextStyle(fontSize: 12, color: Colors.black45)),
                            ),
                          ],
                        ),
                      ),
                    ],
            ),
          );
              }
          );
        }
        else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.teal[400]),
            strokeWidth: 3,  //用来画圆的线的宽度 默认4.0
          ),
        );
      },
    );

  }


}