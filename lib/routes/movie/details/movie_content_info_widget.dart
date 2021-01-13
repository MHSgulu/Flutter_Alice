import 'package:alice/common/util/tool_util.dart';
import 'package:flutter/material.dart';

class MovieContentInfoWidget extends StatefulWidget {
  @override
  _MovieContentInfoWidgetState createState() => _MovieContentInfoWidgetState();
}

class _MovieContentInfoWidgetState extends State<MovieContentInfoWidget> {
  String movieSynopsis;
  bool isExpand = false; //是否展开电影简介的内容

  @override
  void initState() {
    movieSynopsis = '我是谁？我从哪里来？我到哪里去？每当马小萌午夜进入梦境时，总是要自动发出哲学三连击来询问自己。'
        '无数个日日夜夜，形形色色的不同世界，看似不一样的世界，但是好像这些梦境之间都有着若隐若现的关联。'
        '他何时能够知道自己是谁？他又如何能够明白自己从哪来和到哪去？'
        '一次又一次的梦境经历，仿佛轮回似的宿命，他又怎样挣脱命运的锁链呢？';
    super.initState();
  }

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
                    movieSynopsis,
                    style: TextStyle(color: Colors.white60),
                  )
                : LayoutBuilder(builder: (context, size) {
                    return Column(
                      children: <Widget>[
                        Text.rich(
                          TextSpan(
                            text: movieSynopsis,
                            style:
                                TextStyle(fontSize: 14, color: Colors.white70),
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                        ),
                        ToolUtil.isFilmIntroductionOverflow(
                          movieSynopsis,
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
