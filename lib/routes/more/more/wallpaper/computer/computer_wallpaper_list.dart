import 'package:alice/common/const/arguments.dart';
import 'package:alice/common/network/http_util.dart';
import 'package:alice/model/wallpaper_entity.dart';
import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:alice/widgets/custom/my_loading_indicator.dart';
import 'package:alice/widgets/photo_view_single.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ComputerWallpaperList extends StatefulWidget {
  @override
  _ComputerWallpaperListState createState() => _ComputerWallpaperListState();
}

class _ComputerWallpaperListState extends State<ComputerWallpaperList> {
  WallpaperListScreenArguments args;
  WallpaperEntity entity;
  List<WallpaperResVertical> dataList = List();
  RefreshController _refreshController;
  int num = 0;

  @override
  void initState() {
    _refreshController = RefreshController(initialRefresh: false);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    args = ModalRoute.of(context).settings.arguments;
    fetchData(num);
    super.didChangeDependencies();
  }

  void fetchData(int num) async {
    var result = await HttpUtil.requestComputerWallpaperList(args.id, num, 'hot');
    if (result is Exception) {
      Exception exception = result as Exception;
      Fluttertoast.showToast(msg: 'error: $exception');
    } else {
      entity = result;
      if (entity.code == 0 && entity.msg == 'success') {
        if (mounted) {
          setState(() {
            if (num == 0) {
              dataList = entity.res.vertical;
            } else {
              dataList.addAll(entity.res.vertical);
            }
          });
        }
      } else {
        Fluttertoast.showToast(msg: 'code: ${entity.code}  msg: ${entity.msg}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: '${args.name}壁纸(${args.count})',
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
      child: StaggeredGridView.countBuilder(
        //mainAxisSpacing: 4.0,
        //crossAxisSpacing: 4.0,
        crossAxisCount: 4,
        itemCount: dataList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PhotoViewSingle(
                    imageProvider: NetworkImage('${dataList[index].img}'),
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
                  imageUrl: '${dataList[index].thumb}',
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
      ),
    );
  }

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1500));
    if (num < args.count) {
      num = num + 10;
      print('数据点位: 当前略过数量: $num 即代表跳过最初的$num张 从${num + 1}张开始，请求10张壁纸');
      fetchData(num);
      _refreshController.loadComplete();
    } else {
      _refreshController.loadNoData();
    }
  }
}
