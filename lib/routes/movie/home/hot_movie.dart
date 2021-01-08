import 'package:alice/common/const/arguments.dart';
import 'package:alice/common/const/routes.dart';
import 'package:alice/common/network/http_util.dart';
import 'package:alice/model/mtime_hot_movie_entity.dart';
import 'package:alice/widgets/custom/my_loading_indicator.dart';
import 'file:///E:/Alice_flutter/alice/lib/routes/movie/movie_details.dart';
import 'package:cached_network_image/cached_network_image.dart';
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

  void jumpToMovieDetails(String movieId, String imgUrl) {
    Navigator.pushNamed(
      context,
      RouteName.movieDetailsPage,
      arguments: MovieDetailArguments(movieId, imgUrl),
    );
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
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.55,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                  ),
                  itemCount: snapshot.data.ms.length > 9
                      ? 9
                      : snapshot.data.ms.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () => jumpToMovieDetails(
                          snapshot.data.ms[index].id.toString(),
                          snapshot.data.ms[index].img,
                      ),
                      child: Column(
                        children: <Widget>[
                          Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusDirectional.circular(4),
                            ),
                            child: CachedNetworkImage(
                              imageUrl:  snapshot.data.ms[index].img,
                              imageBuilder: (context, imageProvider) => Container(
                                height: 150,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              placeholder: (context, url) => MyLoadingIndicator(
                                valueColor: Colors.teal[300],
                                strokeWidth: 2,
                              ),
                              errorWidget: (context, url, error) => Icon(Icons.error),
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
                                rating: snapshot.data.ms[index].r > 0
                                    ? snapshot.data.ms[index].r / 2.0
                                    : 0,
                                itemSize: 15,
                                itemBuilder: (context, index) {
                                  return Icon(
                                    Icons.star_rounded,
                                    color: Colors.amber[700],
                                  );
                                },
                              ),
                              Container(
                                width: 6,
                              ),
                              Text(
                                snapshot.data.ms[index].r > 0
                                    ? snapshot.data.ms[index].r.toString()
                                    : '',
                                style: TextStyle(fontSize: 12),
                              ),
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
            child: Text("${snapshot.error}"),
          );
        }
        return MyLoadingIndicator(
          valueColor: Colors.teal,
          strokeWidth: 3,
        );
      },
    );
  }

}
