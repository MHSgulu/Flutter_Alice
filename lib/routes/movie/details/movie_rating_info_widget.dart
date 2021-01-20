import 'package:alice/common/const/arguments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MovieRatingInfoWidget extends StatelessWidget{
  final MovieDetailArguments args;

  const MovieRatingInfoWidget({Key key, @required this.args}) : super(key: key);

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
                rating: args.movieEntity.r >
                    0
                    ? args.movieEntity.r /
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
                args.movieEntity.r < 0
                    ? '暂未上映'
                    : '${args.movieEntity.r}',
                style: TextStyle(
                  fontSize: args.movieEntity.r < 0
                      ? 12
                      : 14,
                  color: args.movieEntity.r < 0
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
                '${args.movieEntity.wantedCount}人想看',
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}