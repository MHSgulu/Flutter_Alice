import 'package:alice/common/const/arguments.dart';
import 'package:alice/common/const/constant.dart';
import 'package:alice/common/const/cupertino_routes.dart';
import 'package:alice/common/const/entity.dart';
import 'package:alice/common/const/routes.dart';
import 'package:alice/widgets/custom/my_fade_in_image.dart';
import 'package:alice/widgets/custom/my_rounded_rectang_card.dart';
import 'package:alice/widgets/loading/movie_loading_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HotMovieView extends StatefulWidget {
  final String style;

  const HotMovieView({Key key, @required this.style}) : super(key: key);

  @override
  _HotMovieViewState createState() => _HotMovieViewState();
}

class _HotMovieViewState extends State<HotMovieView> {
  List<Movie> movieDataList = List();

  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 2),
      () => fetchData(),
    );
    super.initState();
  }

  void fetchData() {
    if (mounted) {
      setState(() {
        movieDataList = Constant.movieDataList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return movieDataList.isEmpty ? MovieLoadingView() : movieListView();
  }

  Widget movieListView() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(16, 10, 10, 0),
          child: Row(
            children: <Widget>[
              Text(
                '正在热映',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(child: Container()),
              GestureDetector(
                onTap: () => Fluttertoast.showToast(msg: '全部电影'),
                child: Row(
                  children: <Widget>[
                    Text(
                      '全部  ${movieDataList.length}',
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
          itemCount: movieDataList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  widget.style == Constant.material
                      ? RouteName.movieDetailsPage
                      : PageName.filmDetailsPage,
                  arguments: MovieDetailArguments(
                    movieDataList[index].moviePoster,
                  ),
                );
              },
              child: Column(
                children: <Widget>[
                  MyRRectCard(
                    child: MyFadeInImage(
                      imageUrl: movieDataList[index].moviePoster,
                      width: 265, //1280
                      height: 150, //720
                    ),
                  ),
                  Text(
                    movieDataList[index].movieName,
                    style: TextStyle(fontSize: 14),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RatingBarIndicator(
                        rating: movieDataList[index].movieStar / 2.0,
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
                        '${movieDataList[index].movieStar}',
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
    );
  }
}
