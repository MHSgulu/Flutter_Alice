import 'package:alice/model/m_t_movie_detail_entity.dart';
import 'package:alice/widgets/custom/my_loading_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MovieActorInfoWidget extends StatelessWidget {
  final AsyncSnapshot<MTMovieDetailEntity> snapshot;
  final Color valueColor;

  const MovieActorInfoWidget({
    Key key,
    @required this.snapshot,
    @required this.valueColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
          child: Row(
            children: <Widget>[
              Container(
                child: Text('演职员',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    )),
              )
            ],
          ),
        ),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data.actorList.length + 1 > 6
                ? 6
                : snapshot.data.actorList.length + 1,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: index == 0
                          ? snapshot.data.director.directorImg
                          : snapshot.data.actorList[index - 1].actorImg,
                      imageBuilder: (context, imageProvider) => Container(
                        width: 80,
                        height: 120,
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
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                  Container(
                    child: Text(
                      index == 0
                          ? snapshot.data.director.directorName
                          : snapshot.data.actorList[index - 1].actor,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
