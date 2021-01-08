import 'package:alice/model/m_t_movie_detail_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MovieRatingInfoWidget extends StatelessWidget{
  final AsyncSnapshot<MTMovieDetailEntity> snapshot;

  const MovieRatingInfoWidget({Key key, @required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(8, 16, 8, 16),
      padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                '电影评分',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                ),
              ),
              Container(width: 10),
              RatingBarIndicator(
                rating: double.parse(snapshot.data.rating) >
                    0
                    ? double.parse(snapshot.data.rating) /
                    2.0
                    : 0,
                itemSize: 13,
                itemBuilder: (context, index) {
                  return Icon(
                    Icons.star_rounded,
                    color: Colors.amber[700],
                  );
                },
              ),
              Container(width: 10),
              Text(
                double.parse(snapshot.data.rating) < 0
                    ? '暂未上映'
                    : '${double.parse(snapshot.data.rating)}',
                style: TextStyle(
                  fontSize:
                  double.parse(snapshot.data.rating) < 0
                      ? 12
                      : 14,
                  color: double.parse(snapshot.data.rating) < 0
                      ? Colors.white60
                      : Colors.white,
                ),
              ),
            ],
          ),
          Divider(color: Colors.white24),
          Row(
            children: <Widget>[
              Text(
                '影迷标记',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                ),
              ),
              Container(width: 10),
              Text(
                '${snapshot.data.scoreCount}人评分',
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 11,
                ),
              ),
              /*Container(width: 8),
              Text(
                '${snapshot.data.scoreCount}人看过',
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 11,
                ),
              ),
              Container(width: 8),
              Text(
                '${snapshot.data.scoreCount}人想看',
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 11,
                ),
              ),*/
            ],
          ),
        ],
      ),
    );
  }

}