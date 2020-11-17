import 'package:alice/common/const/strings.dart';
import 'package:alice/common/network/http_util.dart';
import 'package:alice/common/tool_util.dart';
import 'package:alice/model/quotation_entity.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


class EnglishQuotations extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _EnglishQuotationsState();
  }

}

class _EnglishQuotationsState extends State<EnglishQuotations>{

  Future<QuotationEntity> _futureQuotationEntity;
  RefreshController _refreshController;


  void _onRefresh() async{
    await Future.delayed(Duration(milliseconds: 1000));
    if(mounted)
      setState(() {
        _futureQuotationEntity = HttpUtil.fetchQuotationList();
      });
    _refreshController.refreshCompleted();
  }


  @override
  void initState() {
    _refreshController = RefreshController(initialRefresh: false);
    _futureQuotationEntity = HttpUtil.fetchQuotationList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('英文励志语录无痕版'),
        backgroundColor: Colors.cyanAccent[700],
      ),
      body: FutureBuilder<QuotationEntity>(
        future: _futureQuotationEntity,
        builder: (context,snapshot){
          if(snapshot.hasData){
            return SmartRefresher(
              controller: _refreshController,
              onRefresh: _onRefresh,
              header: MaterialClassicHeader(
                color: Colors.cyanAccent[700],
                //backgroundColor: Colors.deepOrange,
              ),
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: snapshot.data.showapiResBody.data.length,
                  itemBuilder: (context,index){
                    return Card(
                      child: ListTile(
                        //leading: Text('1'),
                        title: Text(snapshot.data.showapiResBody.data[index].english),
                        subtitle: Text(snapshot.data.showapiResBody.data[index].chinese),
                        //trailing: Icon(Icons.date_range), ///标题后显示的小部件。通常是[Icon]小部件。
                        ///此列表平铺是否要显示三行文本。
                        ///如果为true，则[subtitle]必须为非空（因为它将给出第二行和第三行文本）。
                        ///如果为false，则如果子标题为空，则列表平铺被视为具有一行；如果子标题为非空，则列表平铺被视为具有两行。
                        isThreeLine: false,
                        dense: false, ///如果为true，则[ListTile]将具有垂直密集布局。默认false 密集列表平铺默认为较小的高度。
                        ///瓷砖的内部填充。
                        ///插入[ListTile]的内容：它的[前导]、[标题]、[副标题]和[尾随]小部件。
                        ///如果为空`EdgeInsets.symmetric(horizontal: 16.0)`
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                        ///此列表平铺是否是交互式的。
                        ///如果为false，则此列表平铺将使用当前[Theme]的禁用颜色设置样式，[onTap]和[onLongPress]回调不起作用。
                        enabled: true,
                        onTap: (){
                          Fluttertoast.showToast(msg: '已按复制英文短句到剪切板');
                          ToolUtil.setTextToClipboard(snapshot.data.showapiResBody.data[index].english);
                          ToolUtil.launchWebUrl(Util.googleTranslationUrl);
                        },
                        onLongPress: (){
                          Fluttertoast.showToast(msg: '已复制中文翻译到剪切板');
                          ToolUtil.setTextToClipboard(snapshot.data.showapiResBody.data[index].chinese);
                          ToolUtil.launchWebUrl(Util.googleTranslationUrl);
                        },
                        ///如果此平铺也被[启用]，则图标和文本将以相同的颜色呈现。
                        ///默认情况下，选定的颜色是主题的主颜色。所选颜色可以用[ListTileTime]覆盖。
                        selected: false, ///默认false
                      ),
                    );
                  }
              ),
            );
          }else if(snapshot.hasError){
            return Center(
              child: Text("${snapshot.error}"),
            );
          }
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.cyanAccent[700]),
              strokeWidth: 3,
            ),
          );
        },
      )
    );
  }



}