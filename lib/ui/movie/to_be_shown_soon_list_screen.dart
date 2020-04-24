import 'package:alice/model/movie_entity.dart';
import 'package:alice/ui/movie/movie_stars_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import 'movie_details_screen.dart';


/*打开手机自带浏览器启动url网址*/
void _launchWebUrl(String url) async {
  if(await canLaunch(url)) {
    await launch(url);
  }else{
    throw '无法启动该网页';
  }
}

class ToBeSoonListScreen extends StatefulWidget {

  final Future<MovieEntity> futureData;

  ToBeSoonListScreen({Key key, @required this.futureData}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ToBeSoonListScreenState();
  }

}


class ToBeSoonListScreenState extends State<ToBeSoonListScreen> {

  Future<MovieEntity> futureMovieEntity;

  @override
  void initState() {
    super.initState();
    ///State中有两个常用属性：
    ///widget，它表示与该State实例关联的widget实例，由Flutter framework动态设置。
    ///注意，这种关联并非永久的，因为在应用生命周期中，UI树上的某一个节点的widget实例在重新构建时可能会变化，但State实例只会在第一次插入到树中时被创建，
    ///当在重新构建时，如果widget被修改了，Flutter framework会动态设置State.widget为新的widget实例。
    //context。StatefulWidget对应的BuildContext，作用同StatelessWidget的BuildContext。
    futureMovieEntity = widget.futureData;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[400],
        title: Text('即将上映的电影'),
      ),
      body: FutureBuilder<MovieEntity> (
        future: futureMovieEntity,
        builder: (context,snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              itemCount: snapshot.data.subjects.length,
              separatorBuilder: (BuildContext context, int index){
                return Divider();
              },
              itemBuilder: (BuildContext context, int index){
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailsScreen(movieId: snapshot.data.subjects[index].id,data: snapshot.data.subjects[index])));
                  },
                  child: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Card(
                            elevation: 2.0,
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusDirectional.circular(2.0)
                            ),
                            child: GestureDetector(
                              onTap: (){
                                //Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailsScreen(futureData: futureMovieEntity)));
                              },
                              child: Image.network(
                                snapshot.data.subjects[index].images.large,
                                width: 100,
                                //fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
                                  child: Text(
                                    snapshot.data.subjects[index].title,
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                    ///文本是否应在软换行处断开。如果为false，则文本中的标志符号将被定位为水平空间不受限制。
                                    //softWrap: true,
                                    maxLines: 2,  //文字显示最大行数
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 4.0),
                                  child: Row(
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
                                        child: Text('${snapshot.data.subjects[index].rating.average}', style: TextStyle(fontSize: 12, color: Colors.black54)),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 4),
                                  child: Text(
                                    snapshot.data.subjects[index].mainlandPubdate == ''
                                        ? '该电影暂未上映'
                                        : snapshot.data.subjects[index].mainlandPubdate  + '(中国大陆)' ,
                                    style: TextStyle(fontSize: 13, color: Colors.black54),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 4),
                                  child: Text(
                                    snapshot.data.subjects[index].genres.toString(),
                                    style: TextStyle(fontSize: 13, color: Colors.black54),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 4),
                                  child: Text(
                                    snapshot.data.subjects[index].directors[0].name,
                                    style: TextStyle(fontSize: 13, color: Colors.black54),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 90,
                          padding: EdgeInsets.only(top: 8),
                          child: Column(
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(top: 48),
                                child: GestureDetector(
                                  onTap: (){
                                    _launchWebUrl(snapshot.data.subjects[index].alt);
                                  },
                                  child: Icon(Icons.stars, color: Colors.orangeAccent),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 45),
                                child: Text(
                                  snapshot.data.subjects[index].collectCount.toString()+'人看过',
                                  style: TextStyle(fontSize: 13, color: Colors.black54),
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
          }
          else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.teal[400]),
              strokeWidth: 3,
            ),
          );
        },
      ),
    );


  }


}




