import 'package:alice/common/const/api.dart';
import 'package:alice/common/const/strings.dart';
import 'package:alice/common/network/dio_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'tao_model_details_route.dart';

///第三版   请求列表分页数据  目前 实际项目可以运用  解决思路 和android原生类似 结合第三方上拉加载进行页数判断，列表持续的添加数据。

///错误场景描述  [ERROR:flutter/lib/ui/ui_dart_state.cc(157)] Unhandled Exception: setState() called after dispose(): _TaoModelListState#a53a7(lifecycle state: defunct, not mounted)
///如果对不再出现在窗口小部件树中的窗口小部件（例如，其父窗口小部件不再包括其内部版本中的窗口小部件）的状态对象调用setState（），则会发生此错误。当代码从计时器或动画回调调用setState（）时，可能会发生此错误。
///首选的解决方案是取消计时器或停止侦听dispose（）回调函数中的动画。另一个解决方案是在调用setState（）之前检查该对象的“mounted”属性，以确保该对象仍在树中。
///如果正在调用setState（），则此错误可能表示内存泄漏，因为另一个对象在从树中删除该状态对象后保留对该状态对象的引用。要避免内存泄漏，请考虑在dispose（）期间中断对此对象的引用。

///解決方案  调用setState之前先进行mounted判断
/// 此[状态]对象当前是否在树中。
/// 在创建了一个[State]对象之后，在调用[initState]之前，框架通过将它与一个[BuildContext]关联来“挂载”这个[State]对象。
/// 在框架调用[dispose]之前，[State]对象保持挂载状态，在此之后框架将不再要求[State对象[build]。
///除非[mounted]为true，否则调用[setState]是错误的。

///要在Flutter中定义（继承）一个Widget，则它的属性必须都是final的。final意味着属性必须在构造函数中就被初始化完成，不接受提前定义，也不接受更改。
///所以，在生命周期中动态的改变Widget对象的属性是不可能的，必须使用框架的build方法来为构造函数动态指定参数，从而达到改变组件属性的功能

class TaoModelPaging extends StatefulWidget {
  /// 如果style属性不是final的，编译器会报出警告
  final String style;

  /// 这个构造方法很长，但是主要你写了final属性，编译器就会帮我们自动生成
  const TaoModelPaging({Key key, this.style}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TaoModelListState();
  }
}

class _TaoModelListState extends State<TaoModelPaging> {
  RefreshController _refreshController;
  int _page = 1;
  int _currentPage;
  int _allPages;

  //接收网络数据的列表
  List<String> modelAvatarUrlList = List();
  List<String> modelNameList = List();
  List<String> modelLinkList = List();
  List<List<dynamic>> modelImgList = List();

  /*下拉刷新*/
  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1500));
    _refreshController.refreshCompleted();
  }

  /*上拉加载*/
  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1500));
    if (_currentPage < _allPages) {
      fetchModelListData(widget.style);
      _refreshController.loadComplete();
    } else {
      _refreshController.loadNoData();
    }
  }

  Future<void> fetchModelListData(String style) async {
    Response response;
    response = await DioUtil.getInstance().createWwDio().get(
      Api.taoModelList,
      queryParameters: {
        "showapi_appid": Util.wShowTestAppId,
        "showapi_sign": Util.wShowTestApiSign,
        "type": style,
        "page": '$_page',
      },
    );
    //print(response.data);
    _page += 1;
    //print('下次请求页数： $_page');
    _currentPage = response.data['showapi_res_body']['pagebean']['currentPage'];
    //print('当前页数：$_currentPage');
    _allPages = response.data['showapi_res_body']['pagebean']['allPages'];
    //print('总页数：$_allPages');
    var contentList = List();
    contentList = response.data['showapi_res_body']['pagebean']['contentlist'];
    //print(contentList);
    if (mounted) {
      setState(() {
        ///循环取所有数据
        contentList.forEach((e) {
          modelAvatarUrlList.add(e['avatarUrl']);
          modelNameList.add(e['realName']);
          modelLinkList.add(e['link']);
          modelImgList.add(e['imgList']);
          //print(modelAvatarUrl);
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController(initialRefresh: false);
    //初始化列表数据
    //print('初始化数据时当前页面风格：${widget.style}');
    fetchModelListData(widget.style);
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SmartRefresher(
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        enablePullDown: true,
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
          noDataText: '不要再滑了，我也是有底线的哦',
          idleIcon: const Icon(Icons.done, color: Colors.grey),
        ),
        child: modelAvatarUrlList.length == 0
            ? Center(
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.deepOrangeAccent[100]),
                ),
              )
            : _getGridView(),
      ),
    );
  }

  Widget _getGridView() {
    return GridView.builder(
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
        ),
        itemCount: modelAvatarUrlList?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TaoModelDetails(
                            modelName: modelNameList[index],
                            modelCover: modelAvatarUrlList[index],
                            modelLink: modelLinkList[index],
                            modelImg: modelImgList[index],
                          )));
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(6.0),
              ),
              clipBehavior: Clip.antiAlias,
              elevation: 1.0,
              child: Container(
                child: CachedNetworkImage(
                  imageUrl: modelAvatarUrlList[index],
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.redAccent[100]),
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
          );
        });
  }
}
