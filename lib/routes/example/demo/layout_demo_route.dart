import 'package:alice/routes/example/demo/game_room_view.dart';
import 'package:alice/widgets/custom/custom_scroll_behavior.dart';
import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:alice/widgets/custom/my_list_tile_card.dart';
import 'package:flutter/material.dart';

class LayoutDemoRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: '布局演示',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: ScrollConfiguration(
        behavior: CustomScrollBehavior(),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                MyCardTile(
                  text: '游戏房间',
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => GameRoomView())),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
