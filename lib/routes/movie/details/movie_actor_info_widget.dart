import 'package:alice/widgets/custom/my_fade_in_image.dart';
import 'package:alice/widgets/custom/my_rounded_rectang_card.dart';
import 'package:alice/widgets/photo_view_single.dart';
import 'package:flutter/material.dart';

class MovieActorInfoWidget extends StatefulWidget {
  final Color valueColor;

  const MovieActorInfoWidget({
    Key key,
    @required this.valueColor,
  }) : super(key: key);

  @override
  _MovieActorInfoWidgetState createState() => _MovieActorInfoWidgetState();
}

class _MovieActorInfoWidgetState extends State<MovieActorInfoWidget> {
  //演员图像
  List myMovieActorPictureList = [
    'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3479171438,187203267&fm=26&gp=0.jpg', //黑衣人
    'https://img3.doubanio.com/view/photo/l/public/p2621735140.webp', //灰原哀
    'https://img1.doubanio.com/view/photo/l/public/p604983657.webp', //朽木露琪亚
    'https://img9.doubanio.com/view/photo/l/public/p1945704333.webp', //三立阿卡曼
  ];

  List myMovieActorCnNameList = [
    '黑衣人',
    '灰原哀',
    '朽木露琪亚',
    '三笠 阿克曼',
  ];

  List myMovieActorEnNameList = [
    'Man in black',
    'Haibara Ai',
    'Kuchiki Rukia',
    'Mikasa Ackerman',
  ];

  List myMovieActorRoleNameList = [
    '导演',
    '饰  初始指引者',
    '饰  成长羁绊者',
    '饰  孤独陪伴者',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '演职员',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      //onTap: () => showAllMovieActorBottomSheet(),
                      child: Row(
                        children: [
                          Text(
                            '全部',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white70,
                            ),
                          ),
                          SizedBox(width: 4),
                          Text(
                            '${myMovieActorPictureList.length}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white70,
                            ),
                          ),
                          SizedBox(width: 2),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white70,
                            size: 14,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 185,
                //color: Colors.pink,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: myMovieActorPictureList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 90,
                      child: Column(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () => jumpToPhotoView(index),
                            child: Hero(
                              tag: '$index',
                              child: MyRRectCard(
                              child: MyFadeInImage(
                                imageUrl: myMovieActorPictureList[index],
                                width: 80,
                                height: 120,
                              ),
                            ),
                            ),
                          ),
                          Text(
                            myMovieActorCnNameList[index],
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            myMovieActorEnNameList[index],
                            style: TextStyle(
                              color: Colors.white60,
                              fontSize: 12,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            myMovieActorRoleNameList[index],
                            style: TextStyle(
                              color: Colors.white60,
                              fontSize: 11,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
  }

  /*void showAllMovieActorBottomSheet() {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) => MovieAllActorDraggableWidget(
        valueColor: widget.valueColor,
        entity: entity,
      ),
      isScrollControlled: true, //设置true，解决了模态底页无法全屏
    );
  }*/

  void jumpToPhotoView(int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => PhotoSingleView(
              imgUrl: myMovieActorPictureList[index],
              heroTag: '$index',
            )));
  }

}
