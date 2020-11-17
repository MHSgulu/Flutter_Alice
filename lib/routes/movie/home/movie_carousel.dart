import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';


class MovieCarouselView extends StatefulWidget{
  @override
  _MovieCarouselViewState createState() => _MovieCarouselViewState();
}

class _MovieCarouselViewState extends State<MovieCarouselView> {
  List<String> bannerImgUrl = [
    'https://img3.doubanio.com/view/photo/l/public/p2552055511.webp',
    'https://img1.doubanio.com/view/photo/m/public/p2561712948.webp',
    'https://img9.doubanio.com/view/photo/l/public/p2576400566.webp',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 4.0),
      child: SizedBox(
        height: 150,
        child: Swiper(
          autoplay: true,  //自动播放开关.
          //autoplayDelay: 3000,  //自动播放延迟毫秒数. 默认3秒
          itemCount: bannerImgUrl.length,
          viewportFraction: 0.85,  //当前轮播图的视口大小
          scale: 0.95,  //两边轮播图的视口距离中间视口的距离 值越大越近
          pagination: SwiperPagination(
            builder: DotSwiperPaginationBuilder(
              size: 5,
              activeSize: 8,
              color: Colors.white70,
              activeColor: Colors.teal,
            ),
          ),
          itemBuilder: (BuildContext context,int index){
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(4.0),
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.network(bannerImgUrl[index],fit: BoxFit.cover),
            );
          },
        ),
      ),
    );
  }
}