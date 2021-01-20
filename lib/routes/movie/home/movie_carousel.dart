import 'package:alice/widgets/custom/my_fade_in_image.dart';
import 'package:alice/widgets/custom/my_rounded_rectang_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class MovieCarouselView extends StatefulWidget {
  @override
  _MovieCarouselViewState createState() => _MovieCarouselViewState();
}

class _MovieCarouselViewState extends State<MovieCarouselView> {
  List<String> bannerImgUrl = [
    'https://img1.doubanio.com/view/photo/l/public/p2201327958.webp', //黄金时代
    'https://img9.doubanio.com/view/photo/l/public/p2535265164.webp', //影
    'https://img9.doubanio.com/view/photo/l/public/p2540924496.webp', //龙猫
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 4.0),
      child: SizedBox(
        height: 150,
        child: Swiper(
          autoplay: true, //自动播放开关.
          //autoplayDelay: 3000,  //自动播放延迟毫秒数. 默认3秒
          itemCount: bannerImgUrl.length,
          viewportFraction: 0.85, //当前轮播图的视口大小
          scale: 0.95, //两边轮播图的视口距离中间视口的距离 值越大越近
          pagination: SwiperPagination(
            builder: DotSwiperPaginationBuilder(
              size: 5,
              activeSize: 8,
              color: Colors.white70,
              activeColor: Colors.teal,
            ),
          ),
          itemBuilder: (BuildContext context, int index) {
            return MyRRectCard(
              child: MyFadeInImage(
                imageUrl: '${bannerImgUrl[index]}',
              ),
            );
          },
        ),
      ),
    );
  }
}
