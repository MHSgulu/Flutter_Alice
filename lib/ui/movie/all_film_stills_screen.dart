import 'dart:convert';
import 'package:alice/generated/json/movie_stills_entity_helper.dart';
import 'package:alice/model/movie_stills_entity.dart';
import 'package:alice/util/all_film_stills_photo_view_gallry_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:transparent_image/transparent_image.dart';



/*网络请求异步操作 根据电影id请求电影剧照*/
Future<MovieStillsEntity> fetchMovieStillsData(String movieId) async {
  final response = await http.get(
      'https://api.douban.com/v2/movie/subject/${movieId}/photos?apikey=0b2bdeda43b5688921839c8ecb20399b&start=0&count=100');

  if (response.statusCode == 200) {
    //如果服务器确实返回了200 OK响应,然后解析JSON
    return movieStillsEntityFromJson(MovieStillsEntity(), json.decode(response.body));
  } else {
    //如果服务器没有返回200 OK响应,然后抛出一个异常。
    throw Exception('服务器未响应成功');
  }

}


class AllFilmStillsScreen extends StatefulWidget{
  final String movieId;
  final Color valueColor;
  AllFilmStillsScreen({Key key, @required this.movieId,@required this.valueColor}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AllFilmStillsScreen();
  }

}


class _AllFilmStillsScreen extends State<AllFilmStillsScreen>{
  Future<MovieStillsEntity> _futureMovieStillsEntity;
  Color dynamicBackgroundColor;

  @override
  void initState() {
    super.initState();
    dynamicBackgroundColor = widget.valueColor;
    _futureMovieStillsEntity = fetchMovieStillsData(widget.movieId);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<MovieStillsEntity> (
        future: _futureMovieStillsEntity,
        builder: (context,snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                ///修改系统状态栏字体颜色
                brightness: Brightness.light,
                leading: GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_rounded, color: Colors.black),
                ),
                title: Text('全部剧照(${snapshot.data.total}张)',style: TextStyle(color: Colors.black)),
              ),
              body: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.0,
                    mainAxisSpacing: 2.0,
                    crossAxisSpacing: 2.0,
                  ),
                  itemCount: snapshot.data.photos.length,
                  itemBuilder: (BuildContext context, int index){
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PhotoViewGalleryScreen(
                            imageList: snapshot.data.photos,//传入图片list
                            index: index,//传入当前点击的图片的index
                            heroTag: 'hero${index}',//传入当前点击的图片的hero tag （可选）
                          )),
                        );
                      },
                      child: Container(
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: snapshot.data.photos[index].cover,
                        ),
                      ),
                    );
                  }
              ),
            );
          }
          else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Center(
            child: CircularProgressIndicator(
              strokeWidth: 3,
              valueColor: AlwaysStoppedAnimation<Color>(dynamicBackgroundColor),
            ),
          );
        },
      ),
    );


  }



}