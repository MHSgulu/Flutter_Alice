import 'package:alice/common/network/http_util.dart';
import 'package:alice/model/m_t_movie_detail_entity.dart';
import 'package:alice/model/movie_crew_entity.dart';
import 'package:alice/routes/movie/details/all/movie_all_actor_draggable.dart';
import 'package:alice/widgets/custom/my_fade_in_image.dart';
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '演职员',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => showAllMovieActorBottomSheet(),
                      child: Row(
                        children: [
                          Text(
                            '全部',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white70,
                            ),
                          ),
                          SizedBox(width: 4),
                          Text(
                            '${entity.types[0].persons.length + entity.types[1].persons.length}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white70,
                            ),
                          ),
                          SizedBox(width: 2),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white70,
                            size: 14,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 180,
                //color: Colors.pink,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: entity.types[1].persons.length > 5
                      ? 6
                      : entity.types[1].persons.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 90,
                      child: Column(
                        children: <Widget>[
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: MyFadeInImage(
                              imageUrl: index == 0
                                  ? entity.types[0].persons[0].image
                                  : entity.types[1].persons[index - 1].image,
                              width: 80,
                              height: 120,
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
                      ),
                    );
                  },
                ),
              ),
            ],
          );
  }

  void showAllMovieActorBottomSheet() {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) => MovieAllActorDraggableWidget(
        valueColor: widget.valueColor,
        entity: entity,
      ),
      isScrollControlled: true, //设置true，解决了模态底页无法全屏
    );
  }

}
