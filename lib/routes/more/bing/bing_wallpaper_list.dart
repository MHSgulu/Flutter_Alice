import 'package:alice/common/const/strings.dart';
import 'package:alice/common/network/http_util.dart';
import 'package:alice/common/tool_util.dart';
import 'package:alice/model/bingwallpaper.dart';
import 'package:alice/widgets/bing_wallpaper_photo_view_gallry_screen.dart';
import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:alice/widgets/custom/my_loading_indicator.dart';
import 'package:flutter/material.dart';

import 'package:transparent_image/transparent_image.dart';

class BingWallpaperList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BingWallpaperListState();
}

class BingWallpaperListState extends State<BingWallpaperList> {
  Future<BingWallpaper> futureBingWallpaperList;

  @override
  void initState() {
    futureBingWallpaperList = HttpUtil.fetchBingWallpaper(8);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: '必应壁纸',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: FutureBuilder<BingWallpaper>(
        future: futureBingWallpaperList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              /**
                  [scrollDirection]中滚动视图的范围是否应由正在查看的内容确定。
                  如果滚动视图未收缩包装，则滚动视图将扩展为[scrollDirection]中允许的最大大小。 如果滚动视图在[scrollDirection]中具有无限制的约束，则[shrinkWrap]必须为true。
                  收缩包装滚动视图的内容要多得多
                  比内容扩展到最大允许大小要昂贵，因为内容可以在滚动过程中扩展和收缩，这意味着每当滚动位置更改时，都需要重新计算滚动视图的大小。
                  默认为false。
               */
              shrinkWrap: false,
              /**
               * 滚动视图应如何响应用户输入。
                  例如，确定用户停止拖动滚动视图后滚动视图如何继续进行动画处理。默认为匹配的平台约定。
                  此外，如果[primary]为false，则如果没有足够的内容要滚动，则用户无法滚动；而如果[primary]为true，则他们始终可以尝试滚动。
                  即使内容不足也强制滚动视图始终可滚动，就好像[primary]为true但不一定,
                  将其设置为true，提供[AlwaysScrollableScrollPhysics]物理
                  对象，如：物理：const AlwaysScrollableScrollPhysics（），
                  要强制滚动视图使用默认的平台约定，并且如果内容不足，则不管[primary]的值如何，都不可以滚动，请提供一个显式的[ScrollPhysics]对象，
                  如下所示：物理：const ScrollPhysics（），
                  物理可以动态更改（通过在后续构建中提供新的对象），但是只有在所提供对象的_class_更改时，新的物理才会生效。
                  仅构造具有不同配置的新实例不足以导致物理被重新应用。
                  （这是因为使用的最终对象是动态生成的，这可能会相对昂贵，并且在每个帧上通过推测方式创建此对象以查看是否应更新物理效果将是低效率的。）
               */
              //physics: BouncingScrollPhysics(),
              itemCount: 8,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  clipBehavior: Clip.antiAlias,
                  elevation: 2.0,
                  //Stack有堆叠的特性，刚才的错误在于——文本代码放在图像代码之前被挡住了。注意顺序
                  child: Stack(
                    //此参数决定如何去对齐没有定位（没有使用Positioned）或部分定位的子组件。
                    // 所谓部分定位，在这里特指没有在某一个轴上定位：left、right为横轴，top、bottom为纵轴，只要包含某个轴上的一个定位属性就算在该轴上有定位。
                    alignment: Alignment.bottomLeft,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PhotoViewGalleryScreen(
                                      imageList:
                                          snapshot.data.images, //传入图片list
                                      index: index, //传入当前点击的图片的index
                                      heroTag:
                                          'hero${index}', //传入当前点击的图片的hero tag （可选）
                                    )),
                          );
                        },
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: Util.bingUrl + snapshot.data.images[index].url,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          margin: EdgeInsets.all(2.0),
                          child: Text(
                            snapshot.data.images[index].startdate,
                            style: TextStyle(
                                color: Colors.white70, fontSize: 10.0),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          ToolUtil.launchWebUrl(
                              snapshot.data.images[index].copyrightlink);
                        },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(8, 0, 8, 16),
                          child: Text(snapshot.data.images[index].copyright,
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12.0,
                                  fontStyle: FontStyle.italic)),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return MyLoadingIndicator();
        },
      ),
    );
  }
}
