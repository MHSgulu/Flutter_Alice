import 'package:alice/model/m_t_movie_detail_entity.dart';
import 'package:alice/widgets/custom/my_loading_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MovieStillInfoWidget extends StatelessWidget{
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
              Container(
                child: Text(
                  '预告片 / 剧照',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: <Widget>[
                    Text('全部',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white60,
                        )),
                    Icon(Icons.arrow_forward_ios_rounded,
                        color: Colors.white60, size: 12),
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
            itemCount: snapshot.data.images.length + 1,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: index == 0
                    ? CachedNetworkImage(
                  imageUrl: snapshot.data.videos[0].image,
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
                                padding: EdgeInsets.fromLTRB(
                                    3, 1, 3, 2),
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius:
                                  BorderRadius.circular(2.0),
                                ),
                                child: Text('预告片',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 11)),
                              ),
                            ),
                            Container(
                              child: Icon(
                                  Icons.play_circle_outline,
                                  color: Colors.white,
                                  size: 28),
                            ),
                          ],
                        ),
                      ),
                  placeholder: (context, url) => MyLoadingIndicator(
                    valueColor: valueColor,
                    strokeWidth: 2,
                  ),
                  errorWidget: (context, url, error) =>
                      Icon(Icons.error),
                )
                    : CachedNetworkImage(
                  imageUrl: snapshot.data.images[index - 1],
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
                      ),
                  placeholder: (context, url) => MyLoadingIndicator(
                    valueColor: valueColor,
                    strokeWidth: 2,
                  ),
                  errorWidget: (context, url, error) =>
                      Icon(Icons.error),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

}