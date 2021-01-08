import 'package:alice/common/util/tool_util.dart';
import 'package:alice/model/m_t_movie_detail_entity.dart';
import 'package:flutter/material.dart';

class MovieContentInfoWidget extends StatefulWidget {
  final AsyncSnapshot<MTMovieDetailEntity> snapshot;

  const MovieContentInfoWidget({Key key, @required this.snapshot})
      : super(key: key);

  @override
  _MovieContentInfoWidgetState createState() => _MovieContentInfoWidgetState();
}

class _MovieContentInfoWidgetState extends State<MovieContentInfoWidget> {
  bool isExpand = false; //是否展开电影简介的内容

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(8, 16, 8, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text('简介',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                )),
          ),
          Container(
            padding: EdgeInsets.only(top: 8),
            child: isExpand
                ? Text(
                    widget.snapshot.data.content,
                    style: TextStyle(color: Colors.white60),
                  )
                : LayoutBuilder(builder: (context, size) {
                    return Column(
                      children: <Widget>[
                        Text.rich(
                          TextSpan(
                            text: widget.snapshot.data.content,
                            style:
                                TextStyle(fontSize: 14, color: Colors.white70),
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                        ),
                        ToolUtil.isFilmIntroductionOverflow(
                          widget.snapshot.data.content,
                          size.maxWidth,
                        )
                            ? GestureDetector(
                                onTap: () {
                                  //print('点击展开');
                                  setState(() {
                                    isExpand = true;
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      '展开',
                                      style: TextStyle(
                                          color: Colors.white70, fontSize: 13),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 2.0),
                                      child: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Container(),
                      ],
                    );
                  }),
          ),
        ],
      ),
    );
  }
}
