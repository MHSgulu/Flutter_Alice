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

class MovieDetailArguments {
  final String movieId;
  final String imgUrl;

  MovieDetailArguments(this.movieId, this.imgUrl);
}
