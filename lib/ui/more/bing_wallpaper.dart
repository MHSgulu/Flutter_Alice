import 'package:alice/model/bingwallpaper.dart';
import 'package:alice/util/bing_wallpaper_photo_view_gallry_screen.dart';
import 'package:alice/util/photo_view_single_screen.dart';
import 'package:alice/values/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:transparent_image/transparent_image.dart';







/*网络请求必应壁纸*/
Future<BingWallpaper> fetchBingWallpaper() async {
  final response = await http.get('https://cn.bing.com/HPImageArchive.aspx?format=js&n=1');

  if (response.statusCode == 200) {
    //如果服务器确实返回了200 OK响应,然后解析JSON
    return BingWallpaper.fromJson(json.decode(response.body));
  } else {
    //如果服务器没有返回200 OK响应,然后抛出一个异常。
    throw Exception('服务器未响应未成功');
  }
}

/*打开手机自带浏览器启动url网址*/
void _launchWebUrl(String url) async {
  if(await canLaunch(url)) {
    await launch(url);
  }else{
    throw '无法启动该网页';
  }
}

/*必应每日壁纸*/
class BingWallpaperView extends StatefulWidget{
  BingWallpaperView({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return BingWallpaperViewState();
  }

}

/*必应每日壁纸*/
class BingWallpaperViewState extends State<BingWallpaperView> {

  Future<BingWallpaper> futureBingWallpaper;

  @override
  void initState() {
    super.initState();
    futureBingWallpaper = fetchBingWallpaper();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue[400],
          title: Text('今日必应壁纸'),
          actions: <Widget>[
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BingWallpaperListView()),
                );
              },
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Icon(Icons.art_track,size: 30.0),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 8.0),
                    child: Text('一周壁纸'),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: FutureBuilder<BingWallpaper> (
          future: futureBingWallpaper,
          builder: (context,snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: <Widget>[
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.circular(4.0),
                    ),
                    clipBehavior: Clip.antiAlias,
                    elevation: 2.0,
                    child: Container(
                      //margin: EdgeInsets.all(5.0),
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: <Widget>[
                          GestureDetector(
                            child:FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage,
                              image: Util.bingUrl+snapshot.data.images[0].url,
                            ),
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => PhotoViewSimpleScreen(
                                  imageProvider:NetworkImage(Util.bingUrl+snapshot.data.images[0].url),
                                  ///必须设为double类型
                                  minScale: 0.2,  ///定义允许图像采用的最小大小，它与原始图像大小成比例
                                  maxScale: 0.5,  ///定义允许图像采用的最大大小，它与原始图像大小成比例。
                                  heroTag: 'simple',
                                )),
                              );
                            },
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child:Container(
                              margin: EdgeInsets.all(2.0),
                              child: Text(snapshot.data.images[0].startdate,style: TextStyle(color: Colors.white70, fontSize: 10.0)),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              _launchWebUrl(snapshot.data.images[0].copyrightlink);
                            },
                            child: Container(
                              margin: EdgeInsets.fromLTRB(8, 0, 8, 16),
                              child: Text(
                                  snapshot.data.images[0].copyright,
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12.0,
                                    fontStyle: FontStyle.italic,  //文字样式（italic斜体，normal正常体）
                                    //decoration: TextDecoration.underline,  //文字装饰线（none没有线，lineThrough删除线，overline上划线，underline下划线）
                                    //decorationColor: Colors.lightBlue[400],  //文字装饰线颜色
                                    //decorationStyle: TextDecorationStyle.solid,  //文字装饰线风格（[dashed,dotted]虚线，double两根线，solid一根实线，wavy波浪线）
                                  ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return Center(
              child: CircularProgressIndicator(
                //value: 0.8,    //如果 value 为 null 或空，则显示一个动画，否则显示一个定值。Progress 的值只能设置 0 ~ 1.0，如果大于 1，则表示已经结束。
                //backgroundColor: Colors.black,  ///补齐画圆的线的颜色 形成完整的圆
                valueColor: AlwaysStoppedAnimation<Color>(Colors.lightBlue[400]),
                strokeWidth: 3,  //用来画圆的线的宽度 默认4.0
              ),
            );
          },
        ),
    );
  }


}



/*网络请求必应壁纸列表*/
Future<BingWallpaper> fetchBingWallpaperList() async {
  final response = await http.get('https://cn.bing.com/HPImageArchive.aspx?format=js&n=8');

  if (response.statusCode == 200) {
    //如果服务器确实返回了200 OK响应,然后解析JSON
    return BingWallpaper.fromJson(json.decode(response.body));
  } else {
    //如果服务器没有返回200 OK响应,然后抛出一个异常。
    throw Exception('服务器响应未成功');
  }
}


/*必应近日壁纸*/
class BingWallpaperListView extends StatefulWidget {
  BingWallpaperListView({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return BingWallpaperListViewState();
  }

}

/*必应近日壁纸*/
class BingWallpaperListViewState extends State<BingWallpaperListView> {

  Future<BingWallpaper> futureBingWallpaperList;

  @override
  void initState() {
    super.initState();
    futureBingWallpaperList = fetchBingWallpaperList();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[400],
        title: Text('必应一周精选壁纸'),
      ),
      body: FutureBuilder<BingWallpaper> (
        future: futureBingWallpaperList,
        builder: (context,snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              //padding: const EdgeInsets.all(8),
              //itemExtent: 60,
              itemCount: 8,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.circular(4.0),
                    ),
                    clipBehavior: Clip.antiAlias,
                    elevation: 2.0,
                    //Stack有堆叠的特性，刚才的错误在于——文本代码放在图像代码之前被挡住了。注意顺序
                    child:Stack(
                      //此参数决定如何去对齐没有定位（没有使用Positioned）或部分定位的子组件。
                      // 所谓部分定位，在这里特指没有在某一个轴上定位：left、right为横轴，top、bottom为纵轴，只要包含某个轴上的一个定位属性就算在该轴上有定位。
                      alignment: Alignment.bottomLeft,
                      children: <Widget>[
                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PhotoViewGalleryScreen(
                                imageList: snapshot.data.images,//传入图片list
                                index: index,//传入当前点击的图片的index
                                heroTag: 'hero${index}',//传入当前点击的图片的hero tag （可选）
                              )),
                            );
                          },
                          child: FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage,
                              image: Util.bingUrl+snapshot.data.images[index].url,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child:Container(
                            margin: EdgeInsets.all(2.0),
                            child: Text(snapshot.data.images[index].startdate,style: TextStyle(color: Colors.white70, fontSize: 10.0)),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            _launchWebUrl(snapshot.data.images[index].copyrightlink);
                          },
                          child: Container(
                            margin: EdgeInsets.fromLTRB(8, 0, 8, 16),
                            child: Text(snapshot.data.images[index].copyright,style: TextStyle(color: Colors.white70, fontSize: 12.0,fontStyle: FontStyle.italic)),
                          ),
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
              valueColor: AlwaysStoppedAnimation<Color>(Colors.lightBlue[400]),
            ),
          );
        },
      ) ,
    );
  }

}