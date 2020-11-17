import 'package:alice/common/const/api.dart';
import 'package:alice/common/const/strings.dart';
import 'file:///E:/Alice_flutter/alice/lib/routes/more/model/tao_model_paging.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TaoModel extends StatefulWidget {
  TaoModel({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TaoModelState();
  }
}

class _TaoModelState extends State<TaoModel>
    with SingleTickerProviderStateMixin {
  var result;

  TabController _tabController;

  List<Tab> styleTabs = <Tab>[
    Tab(text: '欧美'),
    Tab(text: '韩版'),
    Tab(text: '日系'),
    Tab(text: '英伦'),
    Tab(text: 'OL风'),
    Tab(text: '学院'),
    Tab(text: '淑女'),
    Tab(text: '性感'),
    Tab(text: '复古'),
    Tab(text: '街头'),
    Tab(text: '休闲'),
    Tab(text: '民族'),
    Tab(text: '甜美'),
    Tab(text: '运动'),
    Tab(text: '可爱'),
    Tab(text: '大码'),
    Tab(text: '中老年'),
    Tab(text: '其他'),
  ];

  Future<void> fetchModelStyleData() async {
    Response response;
    Dio dio = Dio();
    //response = await dio.get("https://route.showapi.com/126-1?showapi_appid=136754&showapi_sign=4b0c074ea24f4360a5f21905acab9b81");
    //print(response.data.toString());
    /// 请求参数也可以通过对象传递，上面的代码等同于：
    response = await dio.get(Api.wanWeiBaseUrl + Api.taoModelStyle,
        queryParameters: {
          "showapi_appid": Util.wShowApiId,
          "showapi_sign": Util.wShowApiSign
        });
    print(response.data);

    var allTypeList = List();
    allTypeList = response.data['showapi_res_body']['allTypeList'];
    print(allTypeList);

    ///循环取所有数据
    allTypeList.forEach((e) {
      print(e);
    });
  }

  @override
  void initState() {
    super.initState();
    //fetchModelStyleData();
    _tabController = TabController(vsync: this, length: styleTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Image.asset(
          'assets/images/img_tao_girl.png',
          height: 45,
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(45.0),
          child: TabBar(
            isScrollable: true,
            indicatorColor: Colors.redAccent[200],
            indicatorWeight: 2.0,
            indicatorPadding: EdgeInsets.zero,
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: Colors.redAccent[200],
            unselectedLabelColor: Colors.black54,
            controller: _tabController,
            tabs: styleTabs,
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        //physics: BouncingScrollPhysics(),
        children: styleTabs.map((Tab tab) {
          if (tab.text == '欧美') {
            return TaoModelPaging(style: '欧美');
          }
          if (tab.text == '韩版') {
            return TaoModelPaging(style: '韩版');
          }
          if (tab.text == '日系') {
            return TaoModelPaging(style: '日系');
          }
          if (tab.text == '英伦') {
            return TaoModelPaging(style: '英伦');
          }
          if (tab.text == 'OL风') {
            return TaoModelPaging(style: 'OL风');
          }
          if (tab.text == '学院') {
            return TaoModelPaging(style: '学院');
          }
          if (tab.text == '淑女') {
            return TaoModelPaging(style: '淑女');
          }
          if (tab.text == '性感') {
            return TaoModelPaging(style: '性感');
          }
          if (tab.text == '复古') {
            return TaoModelPaging(style: '复古');
          }
          if (tab.text == '街头') {
            return TaoModelPaging(style: '街头');
          }
          if (tab.text == '休闲') {
            return TaoModelPaging(style: '休闲');
          }
          if (tab.text == '民族') {
            return TaoModelPaging(style: '民族');
          }
          if (tab.text == '甜美') {
            return TaoModelPaging(style: '甜美');
          }
          if (tab.text == '运动') {
            return TaoModelPaging(style: '运动');
          }
          if (tab.text == '可爱') {
            return TaoModelPaging(style: '可爱');
          }
          if (tab.text == '大码') {
            return TaoModelPaging(style: '大码');
          }
          if (tab.text == '中老年') {
            return TaoModelPaging(style: '中老年');
          }
          if (tab.text == '其他') {
            return TaoModelPaging(style: '其他');
          } else {
            return Center(
              child: Text('当前tab错误'),
            );
          }
        }).toList(),
      ),
    );
  }
}
