import 'package:alice/common/util/tool_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class TaoModelDetails extends StatefulWidget {
  final String modelName;
  final String modelCover;
  final String modelLink;
  final List modelImg;

  const TaoModelDetails(
      {Key key, this.modelName, this.modelCover, this.modelLink, this.modelImg})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _TaoModelDetailsState();
}

class _TaoModelDetailsState extends State<TaoModelDetails> {
  @override
  void initState() {
    //print(widget.modelName);
    //print(widget.modelCover);
    //print(widget.modelLink);
    //print(widget.modelImg);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        //physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            //title: Text('淘女郎'),
            pinned: true,
            backgroundColor: Colors.black54,
            //brightness: Brightness.dark,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.modelName),
              background: GestureDetector(
                onTap: () {
                  ToolUtil.launchWebUrl(widget.modelLink);
                },
                child: CachedNetworkImage(
                  imageUrl: widget.modelCover,
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
          ),
          /*SliverPadding(
            padding: EdgeInsets.only(top: 16),
            sliver: SliverToBoxAdapter(
              child: Center(
                child: widget.modelImg == null ? Container() : Text('瀑布流相册',style: TextStyle(fontSize: 18,color: Colors.pinkAccent[100]),),
              ),
            ),
          ),*/
          SliverPadding(
            padding: EdgeInsets.all(0.0),
            sliver: SliverToBoxAdapter(
              child: Container(
                child: StaggeredGridView.countBuilder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 0.0,

                  ///主轴方向的间距。
                  crossAxisSpacing: 0.0,

                  ///横轴方向子元素的间距。
                  crossAxisCount: 4,

                  ///横轴子元素的数量
                  itemCount: widget.modelImg.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.circular(4.0),
                      ),
                      clipBehavior: Clip.antiAlias,
                      elevation: 1,
                      child: Container(
                        child: CachedNetworkImage(
                          imageUrl: widget.modelImg[index],
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.redAccent[100]),
                            ),
                          ),
                          errorWidget: (context, url, error) => Image.asset(
                            'assets/icons/icon_placeholder.png',
                            width: 50,
                            height: 50,
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
                  staggeredTileBuilder: (int index) =>

                      ///使用给定的[crossAxisCellCount]创建一个[StaggeredTitle]，使其主轴范围适合其内容。
                      ///crossAxisCellCount 横轴上占据的单元数。
                      StaggeredTile.fit(2),

                  ///保存[StaggeredGridView]的平铺尺寸。
                  ///一个[staggeredTitle]总是与交叉中精确数量的细胞重叠
                  ///[StaggeredGridView]的轴。主轴范围可以是像素数，也可以是要结束的单元格
                ),
              ),
            ),
          ),
          /*SliverStaggeredGrid.countBuilder(
              crossAxisCount: null,
              staggeredTileBuilder: null,
              itemBuilder: null,
              itemCount: null
          ),*/
        ],
      ),
    );
  }
}
