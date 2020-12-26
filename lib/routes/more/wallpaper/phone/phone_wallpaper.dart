import 'package:alice/common/const/arguments.dart';
import 'package:alice/common/network/http_util.dart';
import 'package:alice/model/wallpaper_category_entity.dart';
import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:alice/widgets/custom/my_loading_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PhoneWallpaperRoute extends StatefulWidget {
  @override
  _PhoneWallpaperRouteState createState() => _PhoneWallpaperRouteState();
}

class _PhoneWallpaperRouteState extends State<PhoneWallpaperRoute> {
  WallpaperCategoryEntity entity;
  List<WallpaperCategoryResCategory> dataList = List();

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: '手机壁纸类别',
        onPressedBack: () => Navigator.pop(context),
      ),
      body:
          dataList.isEmpty ? MyLoadingIndicator() : wallpaperCategoryListView(),
    );
  }

  Widget wallpaperCategoryListView() {
    return StaggeredGridView.countBuilder(
      //mainAxisSpacing: 4.0,
      //crossAxisSpacing: 4.0,
      crossAxisCount: 4,
      itemCount: dataList.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () => Navigator.pushNamed(
            context,
            '/phoneWallpaperList',
            arguments: WallpaperListScreenArguments(
              dataList[index].name,
              dataList[index].id,
              dataList[index].count,
            ),
          ),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            clipBehavior: Clip.antiAlias,
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                CachedNetworkImage(
                  imageUrl: '${dataList[index].cover}',
                  placeholder: (context, url) => MyLoadingIndicator(
                    //valueColor: Colors.blueAccent[200],
                    strokeWidth: 2,
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                Container(
                  height: 35,
                  color: Colors.black26,
                  child: Center(
                    child: Text(
                      '${dataList[index].name}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      staggeredTileBuilder: (int index) {
        return StaggeredTile.fit(2);
      },
    );
  }

  void fetchData() async {
    var result = await HttpUtil.requestPhoneWallpaperCategory();
    if (result is Exception) {
      Exception exception = result as Exception;
      Fluttertoast.showToast(msg: 'error: $exception');
    } else {
      entity = result;
      if (entity.code == 0 && entity.msg == 'success') {
        if (mounted) {
          setState(() {
            dataList = entity.res.category;
          });
        }
      } else {
        Fluttertoast.showToast(msg: 'code: ${entity.code}  msg: ${entity.msg}');
      }
    }
  }
}
