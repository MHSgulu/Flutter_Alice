import 'package:alice/model/movie_crew_entity.dart';
import 'package:alice/widgets/custom/custom_scroll_behavior.dart';
import 'package:alice/widgets/custom/my_fade_in_image.dart';
import 'package:alice/widgets/custom/my_rounded_rectang_card.dart';
import 'package:alice/widgets/photo_view_gallry.dart';
import 'package:flutter/material.dart';

class MovieAllActorDraggableWidget extends StatefulWidget {
  final Color valueColor;
  final MovieCrewEntity entity;

  const MovieAllActorDraggableWidget({
    Key key,
    @required this.valueColor,
    @required this.entity,
  }) : super(key: key);

  @override
  _MovieAllActorDraggableWidgetState createState() => _MovieAllActorDraggableWidgetState();
}

class _MovieAllActorDraggableWidgetState extends State<MovieAllActorDraggableWidget> {
  List<String> actorPictureList = List();


  @override
  void initState() {
    widget.entity.types[1].persons.forEach((element) {
      actorPictureList.add(element.image);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 1.0,
      minChildSize: 0.8,
      maxChildSize: 1.0,
      expand: false, //设置false，解决了下滑时小部件的留白。
      builder: (context, scrollController) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(15),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.close_rounded,
                    color: Colors.black,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
                Flexible(child: Container()),
                Flexible(child: Text('全部演员')),
                Flexible(child: Container()),
              ],
            ),
          ),
          elevation: 0.5,
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          centerTitle: true,
        ),
        body: ScrollConfiguration(
          behavior: CustomScrollBehavior(
            isShowLeading: true,
            isShowTrailing: true,
            color: widget.valueColor,
          ),
          child: ListView.separated(
            controller: scrollController,
            padding: EdgeInsets.fromLTRB(12, 8, 0, 8),
            itemBuilder: (context, index) => Container(
              child: Row(
                children: [
                  GestureDetector(
                    onTap: ()=> jumpToPhotoView(index),
                    child: Hero(
                      tag: 'actorPicture:$index',
                      child: MyRRectCard(
                        child: MyFadeInImage(
                          imageUrl: '${widget.entity.types[1].persons[index].image}',
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
                        Text(
                          '${widget.entity.types[1].persons[index].name}',
                        ),
                        SizedBox(height: 4),
                        Text(
                          '${widget.entity.types[1].persons[index].nameEn}',
                        ),
                        SizedBox(height: 4),
                        Text(
                          '演员  ${widget.entity.types[1].persons[index].personate.isEmpty ? '' : '饰 (${widget.entity.types[1].persons[index].personate})'}',
                          style: TextStyle(color: Colors.black54, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            separatorBuilder: (context, index) => Divider(),
            itemCount: widget.entity.types[1].persons.length,
          ),
        ),
      ),
    );
  }

  void jumpToPhotoView(int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => PhotoGalleryView(
              imageList: actorPictureList,
              index: index,
              heroTag: 'actorPicture:$index',
            )));
  }
}
