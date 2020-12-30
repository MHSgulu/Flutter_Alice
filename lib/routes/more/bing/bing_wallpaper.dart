import 'package:alice/common/const/strings.dart';
import 'package:alice/common/network/http_util.dart';
import 'package:alice/model/bingwallpaper.dart';
import 'package:alice/routes/more/bing/bing_wallpaper_card_list.dart';
import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:alice/widgets/custom/my_loading_indicator.dart';
import 'package:flutter/material.dart';

class BingWallpaperRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BingWallpaperRouteState();
}

class BingWallpaperRouteState extends State<BingWallpaperRoute> {
  Future<BingWallpaper> futureBingWallpaperList;
  List<String> imageList = List();

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
            snapshot.data.images.forEach((element) {
              imageList.add(Util.bingUrl + element.url);
            });
            return BingWallpaperCardList(
              snapshot: snapshot,
              imageList: imageList,
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          }
          return MyLoadingIndicator();
        },
      ),
    );
  }
}


