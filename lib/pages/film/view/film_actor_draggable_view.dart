import 'package:alice/model/movie_actor_entity.dart';
import 'package:alice/widgets/custom/my_fade_in_image.dart';
import 'package:alice/widgets/custom/my_rounded_rectang_card.dart';
import 'package:alice/widgets/view/photo_view_gallry.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';

class FilmActorDraggableView extends StatefulWidget {
  final Color valueColor;
  final List<MovieActorEntity> actorList;

  const FilmActorDraggableView({
    Key key,
    @required this.valueColor,
    @required this.actorList,
  }) : super(key: key);

  @override
  _FilmActorDraggableViewState createState() => _FilmActorDraggableViewState();
}

class _FilmActorDraggableViewState extends State<FilmActorDraggableView> {
  List<String> actorPictureList = [];

  @override
  void initState() {
    widget.actorList.forEach((element) {
      actorPictureList.add(element.img);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 1.0,
      minChildSize: 0.5,
      maxChildSize: 1.0,
      //expand: false, //设置false，解决了下滑时小部件的留白。
      builder: (context, scrollController) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            //brightness: Brightness.light,
            leading: IconButton(
              icon: Icon(
                Icons.close_rounded,
                color: Colors.black,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            title: Text(
              '全部演员',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            centerTitle: true,
            elevation: 0,
          ),
          body: ListView.builder(
            controller: scrollController,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
            itemBuilder: (context, index) {
              return StickyHeader(
                header: index == 0
                    ? Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.fromLTRB(12, 2, 0, 2),
                        color: Color(0xFFF7F7F7),
                        child: Text(
                          '导演    1',
                          style: TextStyle(color: Colors.black54, fontSize: 13),
                        ),
                      )
                    : index == 1
                        ? Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.fromLTRB(12, 2, 0, 2),
                            color: Color(0xFFF7F7F7),
                            child: Text(
                              '演员    ${widget.actorList.length - 1}',
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 13),
                            ),
                          )
                        : Container(),
                content: Container(
                  padding: EdgeInsets.fromLTRB(12, 4, 0, 4),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => jumpToPhotoView(index),
                        child: Hero(
                          tag: 'actorPicture:$index',
                          child: MyRRectCard(
                            child: MyFadeInImage(
                              imageUrl: widget.actorList[index].img,
                              width: 80,
                              height: 120,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.actorList[index].nameCn),
                            SizedBox(height: 4),
                            Text(
                              widget.actorList[index].nameEn,
                            ),
                            SizedBox(height: 4),
                            Text(
                              widget.actorList[index].nameRole,
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            //separatorBuilder: (context, index) => Divider(),
            itemCount: widget.actorList.length,
          ),
        );
      },
    );
  }

  void jumpToPhotoView(int index) {
    Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (_) => PhotoGalleryView(
                  imageList: actorPictureList,
                  index: index,
                  heroTag: 'actorPicture:$index',
                )));
  }
}
