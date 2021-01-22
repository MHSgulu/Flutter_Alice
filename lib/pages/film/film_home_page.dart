import 'package:alice/pages/film/view/hot_movie_view.dart';
import 'package:alice/routes/movie/home/movie_carousel.dart';
import 'package:flutter/material.dart';

class FilmHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        MovieCarouselView(),
        HotMovieView(),
      ],
    );
  }

}