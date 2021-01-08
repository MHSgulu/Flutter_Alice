import 'package:alice/common/util/tool_util.dart';
import 'package:alice/model/m_t_movie_detail_entity.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class MovieBasicInfoWidget extends StatelessWidget{
  final AsyncSnapshot<MTMovieDetailEntity> snapshot;

  const MovieBasicInfoWidget({Key key, @required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Card(
          elevation: 2,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
          ),
          child: Container(
            child: FadeInImage.memoryNetwork(
              width: 110,
              fit: BoxFit.cover,
              placeholder: kTransparentImage,
              image: snapshot.data.image,
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.fromLTRB(8, 4, 0, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  snapshot.data.titleCn,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  maxLines: 2, //文字显示最大行数
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  snapshot.data.titleCn == snapshot.data.titleEn
                      ? ' (${snapshot.data.year})'
                      : snapshot.data.titleEn + ' (${snapshot.data.year})',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  maxLines: 2, //文字显示最大行数
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '类型: ${ToolUtil.listToString(snapshot.data.type)}'
                      ' / 上映时间:  ${snapshot.data.release.date} (${snapshot.data.release.location}) '
                      '/ 片长:  ${snapshot.data.runTime}',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white70,
                  ),
                  maxLines: 2, //文字显示最大行数
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

}