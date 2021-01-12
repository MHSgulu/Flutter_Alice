import 'package:alice/model/m_t_movie_detail_entity.dart';
import 'package:alice/widgets/custom/my_rounded_rectang_card.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MovieTrailerInfoWidget extends StatelessWidget{
  final AsyncSnapshot<MTMovieDetailEntity> snapshot;
  final Color valueColor;

  const MovieTrailerInfoWidget({
    Key key,
    @required this.snapshot,
    @required this.valueColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(8, 16, 8, 8),
          child: Row(
            children: <Widget>[
              Text(
                '预告片 / 花絮',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              Expanded(child: Container()),
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: <Widget>[
                    Text(
                        '全部',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white60,
                        ),
                    ),
                    Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white60,
                        size: 12,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 160,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data.videos.length,
            itemBuilder: (BuildContext context, int index) {
              return MyRRectCard(
                child: CachedNetworkImage(
                  imageUrl: snapshot.data.videos[index].image,
                  imageBuilder: (context, imageProvider) =>
                      Container(
                        width: 200,
                        height: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Positioned(
                              top: 4,
                              left: 4,
                              child: Container(
                                padding: EdgeInsets.fromLTRB(3, 1, 3, 2),
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(2.0),
                                ),
                                child: Text(
                                  '预告片',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              child: Icon(
                                  Icons.play_circle_outline,
                                  color: Colors.white,
                                  size: 28,
                              ),
                            ),
                          ],
                        ),
                      ),
                  errorWidget: (context, url, error) => Image.asset(
                    'assets/images/image_failed_load.png',
                    width: 200,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

}