import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MovieRatingInfoWidget extends StatelessWidget{
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
                rating: 9.0 / 2.0,
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
                '9.5',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
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
                '888人想看',
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