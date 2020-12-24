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

class PhoneWallpaperList extends StatefulWidget {
  @override
  _PhoneWallpaperListState createState() => _PhoneWallpaperListState();
}

class _PhoneWallpaperListState extends State<PhoneWallpaperList> {
  WallpaperListScreenArguments args;
  WallpaperEntity entity;
  List<WallpaperResVertical> dataList = List();
  RefreshController _refreshController;
  int num = 0;
  ScrollController controller;

  @override
  void initState() {
    controller = ScrollController();
    _refreshController = RefreshController(initialRefresh: false);
    super.initState();
  }

  ///当此[State]对象的依赖项更改时调用。
  ///例如，如果先前对[build]的调用引用了后来更改的[InheritedWidget]，则框架将调用此方法以将该更改通知此对象。
  /// [initState]之后也立即调用此方法。
  /// 从此方法调用[BuildContext.dependOnInheritedWidgetOfExactType]是安全的。
  ///子类很少重写此方法，因为框架总是在依赖项更改后调用[build]。
  /// 一些子类确实重写了此方法，因为当它们的依赖项发生变化时，
  /// 它们需要做一些昂贵的工作（例如，网络获取），并且对于每个构建而言，所做的工作都太昂贵了。

  ///个人总结: 当国际化或者路由取参数等等，需要context参数及重写此方法 initState()不支持获取context参数时，使用此方法。
  @override
  void didChangeDependencies() {
    args = ModalRoute.of(context).settings.arguments;
    fetchData(num);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void fetchData(int num) async {
    var result = await HttpUtil.requestPhoneWallpaperList(args.id, num, 'hot');
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
        actions: [
          TextButton.icon(
              onPressed: () => backToTop(),
              icon: Icon(
                Icons.arrow_circle_up_rounded,
                size: 16,
              ),
              label: Text(
                '回顶部',
                style: TextStyle(fontSize: 13),
              )),
        ],
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
        controller: controller,
        crossAxisCount: 4,
        itemCount: dataList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PhotoViewSingle(
                    img: '${dataList[index].img}',
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

  void backToTop() {
    ///从当前位置到给定值的位置动画。
    ///
    ///任何活动的动画都将被取消。如果用户当前正在滚动，则该操作将被取消。
    ///
    ///无论动画是否成功完成或是否被过早中断，返回的[Future]都将在动画结束时完成。
    ///
    ///每当用户尝试手动滚动或启动其他活动，或者动画到达视口边缘并尝试过度滚动时，动画都会中断。
    ///（如果[ScrollPosition]不会过度滚动，而是允许滚动超出范围，那么超出范围不会中断动画。）
    ///
    ///动画对视口或内容尺寸的更改无动于衷。
    ///
    ///动画完成后，如果滚动值不稳定，滚动位置将尝试开始弹道活动
    ///（例如，如果滚动超出范围，则在这种情况下滚动位置通常会弹回。)
    ///
    ///持续时间不能为零。要在没有动画的情况下跳至特定值，请使用[jumpTo]。
    ///
    ///在小部件测试中调用[animateTo]时，`等待`返回[Future]可能导致测试挂起并超时。
    ///而是使用[WidgetTester.pumpAndSettle]。
    controller.animateTo(
      0.0,
      duration: Duration(milliseconds: 500),
      curve: Curves.decelerate, //变化率迅速开始然后减速的曲线
    );
  }
}
