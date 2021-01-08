import 'package:alice/model/m_t_movie_detail_entity.dart';
import 'package:flutter/material.dart';

class MovieTypeInfoWidget extends StatelessWidget{
  final AsyncSnapshot<MTMovieDetailEntity> snapshot;

  const MovieTypeInfoWidget({Key key, @required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: Text(
            '相关分类',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 12.5,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 25,
            margin: EdgeInsets.only(top: 4),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: snapshot.data.type.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(right: 12),
                  padding: EdgeInsets.fromLTRB(8, 2, 10, 2),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                      snapshot.data.type[index],
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      )),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

}