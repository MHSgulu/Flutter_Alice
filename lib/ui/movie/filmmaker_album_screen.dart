import 'dart:convert';
import 'package:alice/generated/json/film_maker_album_entity_helper.dart';
import 'package:alice/model/film_maker_album_entity.dart';
import 'package:alice/util/all_film_maker_album_photo_view_gallry_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:transparent_image/transparent_image.dart';



/*网络请求异步操作 根据电影id请求电影剧照*/
Future<FilmMakerAlbumEntity> fetchFilmMakerAlbumData(String movieId) async {
  final response = await http.get(
      'https://api.douban.com/v2/movie/celebrity/$movieId/photos?apikey=0b2bdeda43b5688921839c8ecb20399b&start=0&count=100'); ///豆瓣数据请求count最大数量为100

  if (response.statusCode == 200) {
    //如果服务器确实返回了200 OK响应,然后解析JSON
    return filmMakerAlbumEntityFromJson(FilmMakerAlbumEntity(), json.decode(response.body));
  } else {
    //如果服务器没有返回200 OK响应,然后抛出一个异常。
    throw Exception('服务器未响应成功');
  }

}


class FilmMakerAlbumScreen extends StatefulWidget{
  final String id;
  FilmMakerAlbumScreen({Key key, @required this.id}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FilmMakerAlbumScreen();
  }

}


class _FilmMakerAlbumScreen extends State<FilmMakerAlbumScreen>{
  Future<FilmMakerAlbumEntity> _futureFilmMakerAlbumEntity;

  @override
  void initState() {
    super.initState();
    _futureFilmMakerAlbumEntity = fetchFilmMakerAlbumData(widget.id);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<FilmMakerAlbumEntity> (
        future: _futureFilmMakerAlbumEntity,
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
                  child: Icon(Icons.arrow_back, color: Colors.black),
                ),
                title: Text('${snapshot.data.celebrity.name}的照片(${snapshot.data.total})',style: TextStyle(color: Colors.black)),
              ),
              body: GridView.builder(
                padding: EdgeInsets.all(2.0),
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
                        child: CachedNetworkImage(
                          imageUrl: snapshot.data.photos[index].cover,
                          errorWidget: (context, url, error) => const Icon(Icons.error),
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
              valueColor: AlwaysStoppedAnimation<Color>(Colors.black87),
            ),
          );
        },
      ),
    );


  }



}