import 'package:alice/common/const/arguments.dart';
import 'package:alice/common/network/http_util.dart';
import 'package:alice/model/bird_wallpaper_entity.dart';
import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:alice/widgets/custom/my_loading_indicator.dart';
import 'package:alice/widgets/photo_view_single.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ComputerWallpaperList extends StatefulWidget {
  @override
  _ComputerWallpaperListState createState() => _ComputerWallpaperListState();
}

class _ComputerWallpaperListState extends State<ComputerWallpaperList> {
  BirdWallpaperListScreenArguments args;
  BirdWallpaperEntity entity;
  List<BirdWallpaperData> dataList = List();
  RefreshController _refreshController;
  int start = 0;

  @override
  void initState() {
    _refreshController = RefreshController(initialRefresh: false);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    args = ModalRoute.of(context).settings.arguments;
    fetchData(start);
    super.didChangeDependencies();
  }

  void fetchData(int start) async {
    var result = await HttpUtil.requestComputerWallpaperList(
      args.id,
      start,
    );
    if (result is Exception) {
      Exception exception = result as Exception;
      Fluttertoast.showToast(msg: 'error: $exception');
    } else {
      entity = result;
      if (entity.errno == '0' && entity.errmsg == '正常') {
        if (mounted) {
          setState(() {
            if (start == 0) {
              dataList = entity.data;
            } else {
              dataList.addAll(entity.data);
            }
          });
        }
      } else {
        Fluttertoast.showToast(
            msg: 'code: ${entity.errno}  msg: ${entity.errmsg}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: '${args.name}壁纸${dataList.isEmpty ? '' : '(${entity.total})'}',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: dataList.isEmpty ? MyLoadingIndicator() : wallpaperListView(),
    );
  }

  Widget wallpaperListView() {
    return SmartRefresher(
      controller: _refreshController,
      onLoading: _onLoading,
      enablePullDown: false,
      enablePullUp: true,
      header: ClassicHeader(
        idleText: '下拉刷新',
        releaseText: '释放立即刷新',
        refreshingText: '正在刷新',
        completeText: '刷新完成',
        failedText: '刷新失败',
      ),
      footer: ClassicFooter(
        loadStyle: LoadStyle.ShowWhenLoading,
        canLoadingText: '释放加载更多',
        loadingText: '正在加载',
        idleText: '加载完成',
        idleIcon: const Icon(Icons.done, color: Colors.grey),
      ),
      child: pictureListView(),
    );
  }

  /*Widget staggeredListView() {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: dataList.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PhotoViewSingle(
                  img: '${dataList[index].url}',
                  heroTag: '$index',
                ),
              ),
            );
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            clipBehavior: Clip.antiAlias,
            child: Hero(
              tag: '$index',
              child: CachedNetworkImage(
                imageUrl: '${dataList[index].url}',
                placeholder: (context, url) => MyLoadingIndicator(
                  //valueColor: Colors.blueAccent[200],
                  strokeWidth: 2,
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
        );
      },
      staggeredTileBuilder: (int index) {
        return StaggeredTile.fit(2);
      },
    );
  }*/

  Widget pictureListView() {
    return ListView.builder(
      //itemExtent: 230,
      itemCount: dataList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PhotoSingleView(
                  img: '${dataList[index].url}',
                  heroTag: '$index',
                ),
              ),
            );
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            clipBehavior: Clip.antiAlias,
            child: Hero(
              tag: '$index',
              child: CachedNetworkImage(
                imageUrl: '${dataList[index].url}',
                placeholder: (context, url) => MyLoadingIndicator(
                  //valueColor: Colors.blueAccent[200],
                  strokeWidth: 2,
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
        );
      },
    );
  }

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1500));
    if (start < int.parse(entity.total)) {
      start = start + 10;
      print('数据点位: 当前分页: $start 即 从${start + 1}张开始，请求10张壁纸');
      fetchData(start);
      _refreshController.loadComplete();
    } else {
      _refreshController.loadNoData();
    }
  }
}
