import 'package:alice/model/film_maker_work_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class FilmMakerWorksScreen extends StatefulWidget{
  final Future<FilmMakerWorkEntity> data;
  FilmMakerWorksScreen({Key key, @required this.data}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FilmMakerWorksScreen();


}


class _FilmMakerWorksScreen extends State<FilmMakerWorksScreen>{
  Future<FilmMakerWorkEntity> _futureFilmMakerWorkEntity;

  @override
  void initState() {
    super.initState();
    _futureFilmMakerWorkEntity = widget.data;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<FilmMakerWorkEntity> (
        future: _futureFilmMakerWorkEntity,
        builder: (context,snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                elevation: 0.0,
                backgroundColor: Colors.white,
                ///修改系统状态栏字体颜色
                brightness: Brightness.light,
                leading: GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_rounded, color: Colors.black),
                ),
                title: Text('全部作品(${snapshot.data.total})',style: TextStyle(color: Colors.black)),
              ),
              body: ListView.separated(
                itemCount: snapshot.data.works.length,
                separatorBuilder: (BuildContext context, int index){
                  return Divider();
                },
                itemBuilder: (BuildContext context, int index){
                  return GestureDetector(
                    onTap: (){
                      //Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailsScreen(movieId: snapshot.data.works[index].subject.id, imgUrl: snapshot.data.works[index].subject.images.small)));
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Card(
                              elevation: 1.0,
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusDirectional.circular(4.0)
                              ),
                              child: Image.network(
                                  snapshot.data.works[index].subject.images.large,
                                  width: 80,
                                  fit: BoxFit.cover,
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
                                      snapshot.data.works[index].subject.title,
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                      ///文本是否应在软换行处断开。如果为false，则文本中的标志符号将被定位为水平空间不受限制。
                                      //softWrap: true,
                                      maxLines: 2,  //文字显示最大行数
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 4),
                                    child: Text(
                                      snapshot.data.works[index].subject.mainlandPubdate == ''
                                          ? '暂未定档'
                                          : snapshot.data.works[index].subject.mainlandPubdate  + '(中国大陆)' ,
                                      style: TextStyle(fontSize: 13, color: Colors.black54),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 4),
                                    child: Text(
                                      snapshot.data.works[index].subject.genres.toString(),
                                      style: TextStyle(fontSize: 13, color: Colors.black54),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 4),
                                    child: Text(
                                      snapshot.data.works[index].subject.directors.isEmpty ? '' : snapshot.data.works[index].subject.directors[0].name,
                                      style: TextStyle(fontSize: 13, color: Colors.black54),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
          else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Center(
            child: CircularProgressIndicator(
              strokeWidth: 3,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.black87),
            ),
          );
        },
      ),
    );


  }



}