import 'package:alice/model/m_t_movie_detail_entity.dart';
import 'package:alice/widgets/custom/my_fade_in_image.dart';
import 'package:alice/widgets/custom/my_rounded_rectang_card.dart';
import 'package:alice/widgets/photo_view_gallry.dart';
import 'package:flutter/material.dart';

class MovieStillInfoWidget extends StatelessWidget {
  final AsyncSnapshot<MTMovieDetailEntity> snapshot;
  final Color valueColor;

  const MovieStillInfoWidget({
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
                '剧照',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              Expanded(
                child: Container(),
              ),
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
            itemCount: snapshot.data.images.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => PhotoGalleryView(
                                imageList: snapshot.data.images,
                                index: index,
                                heroTag: 'still:$index',
                              ))),
                child: Hero(
                  tag: 'still:$index',
                  child: MyRRectCard(
                    child: MyFadeInImage(
                      imageUrl: snapshot.data.images[index],
                      width: 200,
                      height: 150,
                    ),
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
