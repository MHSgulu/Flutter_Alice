import 'package:alice/model/eye_opening_video_daily_entity.dart';
import 'package:alice/model/news_entity.dart';

class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}

class WallpaperListScreenArguments {
  final String name;
  final String id;
  final int count;

  WallpaperListScreenArguments(this.name, this.id, this.count);
}

class BirdWallpaperListScreenArguments {
  final String name;
  final String id;

  BirdWallpaperListScreenArguments(this.name, this.id);
}

class NewsDetailArguments {
  final NewsResultResultList data;

  NewsDetailArguments(this.data);
}

class MovieDetailArguments {
  final String moviePictureUrl;

  MovieDetailArguments(this.moviePictureUrl);
}

class VideoInfoArguments {
  final EyeOpeningVideoDailyItemListData data;

  VideoInfoArguments(this.data);

}
