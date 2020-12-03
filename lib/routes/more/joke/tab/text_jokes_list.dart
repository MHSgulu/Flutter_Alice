import 'package:alice/common/network/http_util.dart';
import 'package:alice/model/written_jokes_entity.dart';
import 'package:alice/routes/more/joke/text_jokes_details.dart';
import 'package:alice/widgets/custom/my_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TextJokeList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TextJokeListState();
}

class TextJokeListState extends State<TextJokeList>
    with AutomaticKeepAliveClientMixin {
  WrittenJokesEntity entity;
  List<WrittenJokesResultShowapiResBodyContentlist> dataList = List();
  RefreshController _refreshController;

  @override
  void initState() {
    fetchData(1);
    _refreshController = RefreshController(initialRefresh: false);
    super.initState();
  }

  void fetchData(int page) async {
    var result = await HttpUtil.requestTextJokeList(page);
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
            Fluttertoast.showToast(
                msg: 'retCode: ${entity.result.showapiResBody.retCode}');
          }
        } else {
          Fluttertoast.showToast(
              msg:
                  'showapiResCode: ${entity.result.showapiResCode} showapiResError: ${entity.result.showapiResError}');
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
    return dataList.isEmpty ? MyLoadingIndicator() : textJokeListView();
  }

  Widget textJokeListView() {
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
      child: ListView.builder(
        padding: EdgeInsets.fromLTRB(8, 4, 8, 8),
        itemCount: dataList.length,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            title: Text(
              '${dataList[index].title}',
              style: TextStyle(fontSize: 15),
            ),
            subtitle: Text(
              '${dataList[index].ct.substring(0, 10)}',
              style: TextStyle(fontSize: 12),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => TextJokesDetails(),
                    settings: RouteSettings(
                      arguments: dataList[index].text,
                    ),
                  ));
            },
          ),
        ),
      ),
    );
  }

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1500));
    if (entity.result.showapiResBody.currentPage <
        entity.result.showapiResBody.allPages) {
      fetchData(entity.result.showapiResBody.currentPage + 1);
      _refreshController.loadComplete();
    } else {
      _refreshController.loadNoData();
    }
  }
}
