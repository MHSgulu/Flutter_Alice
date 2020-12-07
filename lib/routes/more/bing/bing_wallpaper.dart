import 'package:alice/common/const/strings.dart';
import 'package:alice/common/network/http_util.dart';
import 'package:alice/common/tool_util.dart';
import 'package:alice/model/bingwallpaper.dart';
import 'package:alice/widgets/custom/my_loading_indicator.dart';
import 'package:alice/widgets/photo_view_single.dart';
import 'package:flutter/material.dart';

import 'package:transparent_image/transparent_image.dart';

import 'bing_wallpaper_list.dart';

class BingWallpaperRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BingWallpaperRouteState();
}

class BingWallpaperRouteState extends State<BingWallpaperRoute> {
  Future<BingWallpaper> futureBingWallpaper;

  @override
  void initState() {
    super.initState();
    futureBingWallpaper = HttpUtil.fetchBingWallpaper(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[400],
        title: Text('今日必应壁纸'),
        actions: <Widget>[
          GestureDetector(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => BingWallpaperList())),
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Icon(Icons.art_track, size: 30.0),
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
      body: FutureBuilder<BingWallpaper>(
        future: futureBingWallpaper,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
              clipBehavior: Clip.antiAlias,
              elevation: 2.0,
              child: Container(
                //margin: EdgeInsets.all(5.0),
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: <Widget>[
                    GestureDetector(
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: Util.bingUrl + snapshot.data.images[0].url,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PhotoViewSingle(
                                    img: Util.bingUrl + snapshot.data.images[0].url,
                                    minScale: 0.2, //必须设为double类型
                                    maxScale: 0.5, //定义允许图像采用的最小大小，它与原始图像大小成比例
                                    heroTag: 'simple', //定义允许图像采用的最大大小，它与原始图像大小成比例。
                                  )),
                        );
                      },
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        margin: EdgeInsets.all(2.0),
                        child: Text(snapshot.data.images[0].startdate,
                            style: TextStyle(
                                color: Colors.white70, fontSize: 10.0)),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        ToolUtil.launchWebUrl(
                            snapshot.data.images[0].copyrightlink);
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(8, 0, 8, 16),
                        child: Text(
                          snapshot.data.images[0].copyright,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12.0,
                            fontStyle:
                                FontStyle.italic, //文字样式（italic斜体，normal正常体）
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
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return MyLoadingIndicator(
            valueColor: Colors.lightBlue[400],
            strokeWidth: 3,
          );
        },
      ),
    );
  }
}
