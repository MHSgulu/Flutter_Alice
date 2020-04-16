import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



/*电影模块*/
class SecondBottomNavigationBarItemView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[400],
        title: Container(
          //width: ,
          height: 35.0,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: StadiumBorder(
              side: BorderSide(
                color: Colors.white,
                width: 1.0,
              ),
            ),
          ),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Icon(Icons.search,color: Colors.grey[600]),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child:Text(
                  '点击此处搜索你想了解的电影',
                  style: TextStyle(color: Colors.grey[600], fontSize:14.0),
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.movie_filter),
            onPressed: (){},
          )
        ],
      ),
    );
  }
}