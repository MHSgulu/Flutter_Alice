import 'package:alice/model/movie_actor_entity.dart';
import 'package:alice/widgets/custom/my_fade_in_image.dart';
import 'package:alice/widgets/custom/my_rounded_rectang_card.dart';
import 'package:alice/widgets/photo_view_single.dart';
import 'package:flutter/material.dart';

import 'all/movie_all_actor_draggable.dart';

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
  MovieActorEntity entity;
  List<MovieActorEntity> actorList = List();

  @override
  void initState() {
    actorList.add(MovieActorEntity(
      'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3479171438,187203267&fm=26&gp=0.jpg',
      '黑衣人',
      'Man in black',
      '导演',
    ));
    actorList.add(MovieActorEntity(
      'https://img3.doubanio.com/view/photo/l/public/p2621735140.webp',
      '灰原哀',
      'Haibara Ai',
      '饰  初始指引者',
    ));
    actorList.add(MovieActorEntity(
      'https://img1.doubanio.com/view/photo/l/public/p604983657.webp',
      '朽木露琪亚',
      'Kuchiki Rukia',
      '饰  成长羁绊者',
    ));
    actorList.add(MovieActorEntity(
      'https://img9.doubanio.com/view/photo/l/public/p1945704333.webp',
      '三笠 阿克曼',
      'Mikasa Ackerman',
      '饰  孤独陪伴者',
    ));
    actorList.add(MovieActorEntity(
      'https://img9.doubanio.com/view/photo/m/public/p2387056615.webp',
      '菜月昴',
      'Subaru Natsuki',
      '饰  无尽轮回者',
    ));
    actorList.add(MovieActorEntity(
      'https://img1.doubanio.com/view/photo/l/public/p2497256618.webp', //包哥
      '包哥',
      'Brother  Bao',
      '饰  快乐无忧者',
    ));
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
                onTap: () => showAllMovieActorBottomSheet(),
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
                      '${actorList.length}',
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
            itemCount: actorList.length,
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
                            imageUrl: actorList[index].img,
                            width: 80,
                            height: 120,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      actorList[index].nameCn,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      actorList[index].nameEn,
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 12,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      actorList[index].nameRole,
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

  void showAllMovieActorBottomSheet() {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) => MovieAllActorDraggableWidget(
        valueColor: widget.valueColor,
        actorList: actorList,
      ),
      isScrollControlled: true, //设置true，解决了模态底页无法全屏
    );
  }

  void jumpToPhotoView(int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => PhotoSingleView(
                  imgUrl: actorList[index].img,
                  heroTag: '$index',
                )));
  }
}
