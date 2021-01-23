import 'package:alice/common/const/arguments.dart';
import 'package:alice/common/const/constant.dart';
import 'package:alice/routes/movie/details/movie_content_info_widget.dart';
import 'package:alice/routes/movie/details/movie_rating_info_widget.dart';
import 'package:alice/widgets/custom/custom_scroll_behavior.dart';
import 'package:alice/widgets/custom/my_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:palette_generator/palette_generator.dart';

import 'details/movie_actor_info_widget.dart';
import 'details/movie_basic_info_widget.dart';
import 'details/movie_still_info_widget.dart';
import 'details/movie_type_info_widget.dart';

class MovieDetailsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MovieDetailsPageState();
}

class MovieDetailsPageState extends State<MovieDetailsPage> {
  MovieDetailArguments args;
  Color dominantColor; //从电影海报获取的主要颜色值
  PaletteGenerator generator;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    args = ModalRoute.of(context).settings.arguments;
    print('数据点位: movieId： ${args.movieEntity.movieId}');
    fetchDominantColorPicture(args.movieEntity.img);
    super.didChangeDependencies();
  }

  void fetchDominantColorPicture(String imageUrl) async {
    generator = await PaletteGenerator.fromImageProvider(
      NetworkImage(imageUrl),
    );
    if (generator == null || generator.colors.isEmpty) {
      dominantColor = Colors.grey[850];
    } else {
      if (mounted) {
        setState(() {
          dominantColor = generator.dominantColor.color;
          print('数据点位: dominantColor: ${dominantColor.toString()}');
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return dominantColor == null
        ? themeColorsLoadingView()
        : themeColorsMovieView();
  }

  Widget themeColorsLoadingView() {
    return Scaffold(
      body: MyLoadingIndicator(
        valueColor: Colors.teal[400],
        strokeWidth: 3,
      ),
    );
  }

  Widget themeColorsMovieView() {
    return Scaffold(
      backgroundColor: dominantColor,
      appBar: AppBar(
        backgroundColor: dominantColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('电影', style: TextStyle(fontSize: 16)),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: () => Fluttertoast.showToast(msg: '菜单'),
          ),
        ],
        elevation: 1,
      ),
      body: movieDetailsView(),
    );
  }

  Widget movieDetailsView() {
    return ScrollConfiguration(
      behavior: CustomScrollBehavior(
        isShowLeading: true,
        isShowTrailing: true,
        color: dominantColor,
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(8, 8, 8, 20),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MovieBasicInfoWidget(args: args), //电影基础信息栏
            MovieRatingInfoWidget(args: args), //电影评分信息栏
            MovieTypeInfoWidget(args: args), //电影类型信息栏
            MovieContentInfoWidget(), //电影内容简介栏
            MovieActorInfoWidget(valueColor: dominantColor, style: Constant.material,), //电影演员栏
            MovieStillInfoWidget(valueColor: dominantColor, style: Constant.material,), //电影剧照栏
          ],
        ),
      ),
    );
  }

}
