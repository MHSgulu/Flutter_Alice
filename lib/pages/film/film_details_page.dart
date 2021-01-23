import 'package:alice/common/const/arguments.dart';
import 'package:alice/common/const/constant.dart';
import 'package:alice/routes/movie/details/movie_actor_info_widget.dart';
import 'package:alice/routes/movie/details/movie_basic_info_widget.dart';
import 'package:alice/routes/movie/details/movie_content_info_widget.dart';
import 'package:alice/routes/movie/details/movie_rating_info_widget.dart';
import 'package:alice/routes/movie/details/movie_still_info_widget.dart';
import 'package:alice/routes/movie/details/movie_type_info_widget.dart';
import 'package:alice/widgets/custom/my_loading_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:palette_generator/palette_generator.dart';

class FilmDetailsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FilmDetailsPageState();
}

class _FilmDetailsPageState extends State<FilmDetailsPage> {
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
    if (dominantColor == null) {
      return CupertinoPageScaffold(
        child: MyLoadingIndicator(
          style: Constant.cupertino,
        ),
      );
    } else {
      return CupertinoPageScaffold(
        backgroundColor: dominantColor,
        navigationBar: CupertinoNavigationBar(
          backgroundColor: dominantColor,
          leading: CupertinoButton(
            child: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.white,
            ),
            padding: EdgeInsets.zero,
            minSize: 24,
            onPressed: () => Navigator.pop(context),
          ),
          middle: Text('电影', style: TextStyle(color: Colors.white)),
          trailing: CupertinoButton(
            child: Icon(
              Icons.more_horiz_rounded,
              color: Colors.white,
            ),
            padding: EdgeInsets.zero,
            onPressed: () => Navigator.pop(context),
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(8, 8, 8, 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MovieBasicInfoWidget(args: args), //电影基础信息栏
              MovieRatingInfoWidget(args: args), //电影评分信息栏
              MovieTypeInfoWidget(args: args), //电影类型信息栏
              MovieContentInfoWidget(), //电影内容简介栏
              MovieActorInfoWidget(valueColor: dominantColor, style: Constant.cupertino,), //电影演员栏
              MovieStillInfoWidget(valueColor: dominantColor, style: Constant.cupertino,), //电影剧照栏
            ],
          ),
        ),
      );
    }
  }

}
