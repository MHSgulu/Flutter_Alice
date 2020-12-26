import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';


class WallpaperPopularSearches extends StatefulWidget{
  @override
  _WallpaperPopularSearchesState createState() => _WallpaperPopularSearchesState();
}

class _WallpaperPopularSearchesState extends State<WallpaperPopularSearches> {

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: '搜索壁纸',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}