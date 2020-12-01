import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:alice/widgets/custom/my_loading_indicator.dart';
import 'package:flutter/material.dart';


class RecipesRoute extends StatefulWidget{
  @override
  _RecipesRouteState createState() => _RecipesRouteState();
}

class _RecipesRouteState extends State<RecipesRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: '菜谱大全',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: MyLoadingIndicator(),
    );
  }
}