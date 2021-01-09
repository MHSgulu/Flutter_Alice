import 'package:alice/common/network/http_util.dart';
import 'package:alice/model/m_t_movie_detail_entity.dart';
import 'package:alice/model/movie_crew_entity.dart';
import 'package:alice/widgets/custom/my_loading_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MovieActorInfoWidget extends StatefulWidget {
  final String movieId;
  final AsyncSnapshot<MTMovieDetailEntity> snapshot;
  final Color valueColor;

  const MovieActorInfoWidget({
    Key key,
    @required this.movieId,
    @required this.snapshot,
    @required this.valueColor,
  }) : super(key: key);

  @override
  _MovieActorInfoWidgetState createState() => _MovieActorInfoWidgetState();
}

class _MovieActorInfoWidgetState extends State<MovieActorInfoWidget> {
  MovieCrewEntity entity;

  @override
  void initState() {
    print('数据点位: movieId： ${widget.movieId}');
    fetchData();
    super.initState();
  }

  void fetchData() async {
    var result = await HttpUtil.fetchTimeMovieActorData(widget.movieId);
    if (result is Exception) {
      Exception exception = result as Exception;
      Fluttertoast.showToast(msg: 'error: $exception');
    } else {
      if (mounted) {
        setState(() {
          entity = result;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return entity == null
        ? Container(
            width: 100,
            height: 180,
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: Text(
                  '演职员',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                height: 180,
                //color: Colors.pink,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: entity.types[1].persons.length > 5 ? 6 : entity.types[1].persons.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: <Widget>[
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: CachedNetworkImage(
                            imageUrl: index == 0
                                ? entity.types[0].persons[0].image
                                : entity.types[1].persons[index - 1].image,
                            imageBuilder: (context, imageProvider) => Container(
                              width: 80,
                              height: 120,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            placeholder: (context, url) => MyLoadingIndicator(
                              valueColor: widget.valueColor,
                              strokeWidth: 2,
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                        Text(
                          index == 0
                              ? entity.types[0].persons[0].name
                              : entity.types[1].persons[index - 1].name,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          index == 0
                              ? '${entity.types[0].persons[0].nameEn}'
                              : '${entity.types[1].persons[index - 1].nameEn}',
                          style: TextStyle(
                            color: Colors.white60,
                            fontSize: 12,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          index == 0
                              ? '导演'
                              : entity.types[1].persons[index - 1].personate
                                      .isEmpty
                                  ? ''
                                  : '饰 ${entity.types[1].persons[index - 1].personate}',
                          style: TextStyle(
                            color: Colors.white60,
                            fontSize: 11,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          );
  }
}
