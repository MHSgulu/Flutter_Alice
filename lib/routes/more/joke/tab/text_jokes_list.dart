import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';



class TextJokeList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => TextJokeListState();

}

class TextJokeListState extends State<TextJokeList>{
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.fromLTRB(8, 6, 8, 20),
      itemCount: 10,
        itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
              Fluttertoast.showToast(msg: '查看笑话详情');
            },
            child: Card(
              child: Container(
                padding: EdgeInsets.fromLTRB(16, 12, 8, 8),
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text('放松放松'),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text('fvvv',style: TextStyle(color: Colors.black54,fontSize:12.0)),
                    ),
                  ],
                ) ,
              ),
            ),
          );
        }
    );
  }

}