import 'package:alice/ui/life/gif_picture_jokes_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ThirdBottomNavigationBarItemView extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() => ThirdBottomNavigationBarItemViewState();

}

class ThirdBottomNavigationBarItemViewState extends State<ThirdBottomNavigationBarItemView> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent[100],
        title: Text('只是当时已惘然'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('待定'),
      ),
    );
  }

}