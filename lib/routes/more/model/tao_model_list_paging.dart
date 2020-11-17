import 'package:alice/common/const/api.dart';
import 'package:alice/common/const/strings.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


///第二版   请求列表分页数据   根据列表滑动监听判断

class TaoModelPagingList extends StatefulWidget{

  //TaoModelList({ Key key }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TaoModelListState();
  }

}


class _TaoModelListState extends State<TaoModelPagingList> {

  int _page = 1;
  bool isLoading = false;
  List<String> avatarUrl = List();

  int _currentPage;
  int _allPages;

  ScrollController _scrollController;

  Response response;
  Dio dio = Dio();

  Future<void> fetchModelListData() async {
    try{
      response = await dio.get(Api.wanWeiBaseUrl + Api.taoModelList,
        queryParameters: {
          "showapi_appid": Util.wShowApiId,
          "showapi_sign": Util.wShowApiSign,
          "type": '韩版',
          "page": '$_page',
        });
    //print(response.data);

      if(mounted){
        setState(() {
          _page += 1;
          //print('下次请求页数： $_page');

          _currentPage = response.data['showapi_res_body']['pagebean']['currentPage'];
          //print('当前页数：$_currentPage');
          _allPages = response.data['showapi_res_body']['pagebean']['allPages'];
          // print('总页数：$_allPages');

          var contentList = List();
          contentList = response.data['showapi_res_body']['pagebean']['contentlist'];
          //print(contentList);

          ///循环取所有数据
          contentList.forEach((e) {
            // print(e['avatarUrl']);
            avatarUrl.add(e['avatarUrl']);
            // print(avatarUrl);
          });
        });
      }
    }finally{
      setState(() {
        isLoading = false;
      });
    }





  }


  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener((){
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        print('滑动到了最底部');
        if(!isLoading){
          print('当前不是加载状态，进行加载数据');
          if( _currentPage < _allPages){
            print('当前页数小于总页数，可以继续请求数据');
            setState(() {
              isLoading = true;
            });
            ///请求数据
            fetchModelListData();
          }
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {

    var length = avatarUrl?.length ?? 0;

    return Scaffold(
      body: Container(
        child: GridView.builder(
            controller: _scrollController,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
              mainAxisSpacing: 0.0,
              crossAxisSpacing: 0.0,
            ),
            ///加1预留给列表
            itemCount: length + 1,
            itemBuilder: (BuildContext context, int index){

              if (avatarUrl.length == 0) {
                fetchModelListData();
                return new Center(
                  child: new Container(
                    margin: const EdgeInsets.only(top: 8.0),
                    width: 32.0,
                    height: 32.0,
                    child: const CircularProgressIndicator(),
                  ),
                );
              }
              if (avatarUrl.length == index) {
                if(isLoading){
                  return new Center(
                    child: new Container(
                      child: Text('加载数据中'),
                    ),
                  );
                }
                else{
                  return new Center(
                    child: new Container(
                      child: Text('到达底部'),
                    ),
                  );
                }
              }

              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(6.0),
                ),
                clipBehavior: Clip.antiAlias,
                elevation: 1.0,
                child: Container(
                  child: Image.network(
                    avatarUrl[index],
                    //width: 100,
                    //height: 150,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              );
            }
        ),
      ),
    );


  }





}





