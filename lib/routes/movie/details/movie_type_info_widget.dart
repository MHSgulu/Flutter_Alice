import 'package:flutter/material.dart';

class MovieTypeInfoWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    List myMovieType = [
      '剧情',
      '科幻',
      '奇幻',
      '爱情',
      '动作',
      '冒险',
      '灾难',
      '温情',
      '意识流',
      '实验',
    ];

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
              itemCount: myMovieType.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(right: 12),
                  padding: EdgeInsets.fromLTRB(8, 2, 10, 2),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                      myMovieType[index],
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