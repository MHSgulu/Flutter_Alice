import 'package:alice/common/network/http_util.dart';
import 'package:alice/model/picture_joke_entity.dart';
import 'package:alice/widgets/custom/my_loading_indicator.dart';
import 'package:alice/widgets/view/photo_view_single.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class StaticPictureList extends StatefulWidget {
  @override
  _StaticPictureListState createState() => _StaticPictureListState();
}

class _StaticPictureListState extends State<StaticPictureList> with AutomaticKeepAliveClientMixin{
  PictureJokeEntity entity;
  List<PictureJokeResultShowapiResBodyContentlist> dataList = List();
  RefreshController _refreshController;

  @override
  void initState() {
    fetchData(1);
    _refreshController = RefreshController(initialRefresh: false);
    super.initState();
  }

  void fetchData(int page) async {
    var result = await HttpUtil.requestStaticPictureList(page);
    if (result is Exception) {
      Exception exception = result as Exception;
      Fluttertoast.showToast(msg: 'error: $exception');
    } else {
      entity = result;
      if (entity.code == '10000') {
        if (entity.result.showapiResCode == 0) {
          if (entity.result.showapiResBody.retCode == 0) {
            if (mounted) {
              setState(() {
                if (entity.result.showapiResBody.currentPage == 1) {
                  dataList = entity.result.showapiResBody.contentlist;
                } else {
                  dataList.addAll(entity.result.showapiResBody.contentlist);
                }
              });
            }
          } else {
            Fluttertoast.showToast(msg: 'retCode: ${entity.result.showapiResBody.retCode}');
          }
        } else {
          Fluttertoast.showToast(msg: 'showapiResCode: ${entity.result.showapiResCode} showapiResError: ${entity.result.showapiResError}');
        }
      } else {
        Fluttertoast.showToast(msg: 'code: ${entity.code} msg: ${entity.msg}');
      }
    }
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return dataList.isEmpty ? MyLoadingIndicator() : staticPictureListView();
  }

  Widget staticPictureListView() {
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
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PhotoSingleView(
                      imgUrl: '${dataList[index].img}',
                      heroTag: 'staticPicture_$index',
                    )),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              clipBehavior: Clip.antiAlias,
              child: Hero(
                tag: 'staticPicture_$index',
                child: CachedNetworkImage(
                  imageUrl: '${dataList[index].img}',
                  placeholder: (context, url) => MyLoadingIndicator(
                    valueColor: Colors.blueAccent[200],
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

  void _onLoading() async{
    await Future.delayed(Duration(milliseconds: 1500));
    if(entity.result.showapiResBody.currentPage < entity.result.showapiResBody.allPages){
      fetchData(entity.result.showapiResBody.currentPage + 1);
      _refreshController.loadComplete();
    }else{
      _refreshController.loadNoData();
    }
  }

}
