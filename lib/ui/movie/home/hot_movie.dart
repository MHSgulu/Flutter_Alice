import 'package:alice/http/http_util.dart';
import 'package:alice/model/mtime_hot_movie_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HotMovieView extends StatefulWidget {
  @override
  _HotMovieViewState createState() => _HotMovieViewState();
}

class _HotMovieViewState extends State<HotMovieView> {
  Future<MtimeHotMovieEntity> _future;

  @override
  void initState() {
    _future = HttpUtil.fetchTimeHotMovieData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MtimeHotMovieEntity>(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(16, 10, 10, 0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        '正在热映',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Expanded(child: Container()),
                      GestureDetector(
                        onTap: () {
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => IsShowingUpListScreen(futureData: futureMovieEntity,)));
                        },
                        child: Row(
                          children: <Widget>[
                            Text(
                              '全部  ${snapshot.data.ms.length}',
                              style: TextStyle(fontSize: 12),
                            ),
                            Container(width: 4),
                            Icon(Icons.arrow_forward_ios_rounded, size: 15),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                GridView.builder(
                  padding: EdgeInsets.fromLTRB(8, 4, 8, 8),
                  shrinkWrap: true, //是否根据子组件的总长度来设置列表的长度，默认值为false
                  physics: NeverScrollableScrollPhysics(),  //解决可互动组件的嵌套滑动冲突 禁止滚动 交给最外层滑动
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.55,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                  ),
                  itemCount: snapshot.data.ms.length > 12 ? 12 : snapshot.data.ms.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Column(
                        children: <Widget>[
                          Card(
                            elevation: 2.0,
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadiusDirectional.circular(4)),
                            child: GestureDetector(
                              onTap: () {
                                //Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailsScreen(movieId: snapshot.data.subjects[index].id, imgUrl: snapshot.data.subjects[index].images.small)));
                              },
                              child: Image.network(
                                snapshot.data.ms[index].img,
                                //以下两行代码 暂时解决 图片高度不一致的问题 可能会出现不适配的为 比如在手机长度比较小 不是主流机型长宽比的那种
                                fit: BoxFit.fitHeight,
                                height: 150,
                              ),
                            ),
                          ),
                          Text(
                            snapshot.data.ms[index].tCn,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RatingBarIndicator(
                                rating: snapshot.data.ms[index].r > 0 ? snapshot.data.ms[index].r / 2.0 : 0,
                                itemSize: 15,
                                itemBuilder: (context, index) {
                                  return Icon(
                                    Icons.star_rounded,
                                    color: Colors.amber[700],
                                  );
                                },
                              ),
                              Container(width: 6,),
                              Text(snapshot.data.ms[index].r > 0 ? snapshot.data.ms[index].r.toString() : '',style: TextStyle(fontSize: 12),),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
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
            valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
            strokeWidth: 3,
          ),
        );
      },
    );
  }
}
