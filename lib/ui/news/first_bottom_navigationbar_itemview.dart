import 'package:flutter/material.dart';


/*新闻模块*/
class FirstBottomNavigationBarItemView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[200],
        title: Container(
          //width: ,
          height: 35.0,
          decoration: ShapeDecoration(
            //此处颜色若不设置，会被同化成AppBar背景色
            color: Colors.white,
            shape: StadiumBorder(
              //默认情况下，边框为1.0逻辑像素宽和纯黑。
              side: BorderSide(
                //框边颜色
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
                  '点击此处搜索你想了解的新闻',
                  style: TextStyle(color: Colors.grey[600], fontSize:14.0),
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.assessment), onPressed: null)
        ],
      ),
    );
  }
}