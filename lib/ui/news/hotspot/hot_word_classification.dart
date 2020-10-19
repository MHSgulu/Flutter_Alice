import 'package:alice/http/http_util.dart';
import 'package:alice/model/hot_word_type_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'hot_tword_tab.dart';

class HotWordClassification extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HotWordClassificationState();
}

class HotWordClassificationState extends State<HotWordClassification> {
  List<String> movieCoverList = [
    'https://img1.doubanio.com/view/photo/l/public/p2564906178.webp',
    'https://img2.doubanio.com/view/photo/l/public/p2269343423.webp',
    'https://weiliicimg6.pstatp.com/weili/l/243130711343759365.webp',
    'https://img1.doubanio.com/view/photo/l/public/p604983657.webp',
    'https://img2.doubanio.com/view/photo/l/public/p2356947303.webp',
    'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=179292083,506023000&fm=26&gp=0.jpg',
    'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=207926224,2168957337&fm=26&gp=0.jpg',
    'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=653463355,1390891814&fm=26&gp=0.jpg',
    'https://icweiliimg9.pstatp.com/weili/l/903121499439628398.webp',
    'https://weiliicimg6.pstatp.com/weili/l/919016254283317365.webp',
    'https://icweiliimg9.pstatp.com/weili/l/400605386644914228.webp',
  ];

  /*HotWordTypeEntity _hotWordTypeEntity = HotWordTypeEntity();

  void fetchData() async {
    Response response = await DioUtil.getInstance().createJdWxkDio().get(
      Api.hotWordType,
      queryParameters: {
        "appkey": Util.jdWxApiKey,
      },
    );
    print('数据点位：' + response.toString());
    _hotWordTypeEntity = hotWordTypeEntityFromJson(
        HotWordTypeEntity(), jsonDecode(response.toString()));
    if (_hotWordTypeEntity.code == '10000' ||
        _hotWordTypeEntity.msg == '查询成功') {
      Fluttertoast.showToast(msg: '！！');
      print('数据点位： ${_hotWordTypeEntity.result.showapiResBody.xList[0].name}');
    } else {
      Fluttertoast.showToast(msg: '${_hotWordTypeEntity.msg}');
    }
  }*/

  Future<HotWordTypeEntity> _futureHotWordTypeEntity;

  @override
  void initState() {
    _futureHotWordTypeEntity = HttpUtil.fetchHotWordTypeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          '热点词分类',
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
        centerTitle: true,
        //elevation: 1,
      ),
      body: hotWordTypeList(),
    );
  }

  Widget hotWordTypeList() {
    return FutureBuilder<HotWordTypeEntity>(
      future: _futureHotWordTypeEntity,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return StaggeredGridView.countBuilder(
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            crossAxisCount: 4,
            itemCount: snapshot.data.result.showapiResBody.xList.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => HotWordTab(
                                title: snapshot.data.result.showapiResBody
                                    .xList[index].name,
                                childList: snapshot.data.result.showapiResBody
                                    .xList[index].childList,
                              )));
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(4.0),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: <Widget>[
                        CachedNetworkImage(
                          imageUrl: movieCoverList[index],
                          placeholder: (context, url) =>
                              CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.black38,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Center(
                            child: Text(
                              snapshot
                                  .data.result.showapiResBody.xList[index].name,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },

            ///StaggeredGridView需要知道如何显示每个图块，以及与图块关联的窗口小部件。
            ///一个图块需要具有固定数量的像元才能在横轴上占据。对于主轴上的范围，您有3个选项：
            ///您想要固定数量的单元格=> 使用 StaggeredTile.count。
            ///您需要固定范围=> 使用StaggeredTile.extent。
            ///您需要一个可变范围，该范围由图块本身的内容=> 使用StaggeredTile.fit。
            staggeredTileBuilder: (int index) {
              return StaggeredTile.fit(2);
            },

            ///保存[StaggeredGridView]的平铺尺寸。
            ///一个[staggeredTitle]总是与交叉中精确数量的细胞重叠
            ///[StaggeredGridView]的轴。主轴范围可以是像素数，也可以是要结束的单元格
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Center(
              child: Text("${snapshot.error}"),
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.cyanAccent[700]),
            strokeWidth: 3,
          ),
        );
      },
    );
  }
}
