import 'package:alice/common/const/arguments.dart';
import 'package:alice/common/network/http_util.dart';
import 'package:alice/model/bird_wallpaper_category_entity.dart';
import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:alice/widgets/custom/my_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ComputerWallpaperRoute extends StatefulWidget {
  @override
  _ComputerWallpaperRouteState createState() => _ComputerWallpaperRouteState();
}

class _ComputerWallpaperRouteState extends State<ComputerWallpaperRoute> {
  BirdWallpaperCategoryEntity entity;
  List<BirdWallpaperCategoryData> dataList = [];

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: '电脑壁纸类别',
        onPressedBack: () => Navigator.pop(context),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/wallpaperPopularSearches');
              },
              child: Text(
                '搜索',
                style: TextStyle(fontSize: 13),
              ))
        ],
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
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/computerWallpaperList',
                arguments: BirdWallpaperListScreenArguments(
                  dataList[index].name,
                  dataList[index].id,
                ),
              );
            },
            child: Container(
              height: 50,
              child: Center(
                child: Text('${dataList[index].name}'),
              ),
            ),
          ),
        );
      },
      staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
    );
  }

  void fetchData() async {
    var result = await HttpUtil.requestComputerWallpaperCategory();
    if (result is Exception) {
      Exception exception = result as Exception;
      Fluttertoast.showToast(msg: 'error: $exception');
    } else {
      entity = result;
      if (entity.errno == '0' && entity.errmsg == '正常') {
        if (mounted) {
          setState(() {
            dataList = entity.data;
          });
        }
      } else {
        Fluttertoast.showToast(
            msg: 'code: ${entity.errno}  msg: ${entity.errmsg}');
      }
    }
  }
}
