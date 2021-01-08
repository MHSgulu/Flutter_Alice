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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
          child: Text('演职员', style: TextStyle(fontSize: 15, color: Colors.white,)),
        ),
        Container(
          height: 180,
          //color: Colors.pink,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data.actorList.length + 1,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    clipBehavior: Clip.antiAlias,
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
                  Text(
                    index == 0
                        ? '${snapshot.data.director.directorName}'
                        : '${snapshot.data.actorList[index - 1].actor}',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    index == 0
                        ? '${snapshot.data.director.directorNameEn}'
                        : '${snapshot.data.actorList[index - 1].actorEn}',
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 12,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    index == 0
                        ? '导演'
                        : snapshot.data.actorList[index - 1].roleName.isEmpty ? '' : '饰 ${snapshot.data.actorList[index - 1].roleName}',
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 11,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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
