import 'package:alice/widgets/custom/custom_scroll_behavior.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotoGalleryView extends StatefulWidget {
  final List<String> imageList;
  final int index;
  final Object heroTag;

  const PhotoGalleryView({
    Key key,
    @required this.imageList,
    @required this.index,
    this.heroTag,
  }) : super(key: key);

  @override
  _PhotoViewGalleryScreenState createState() => _PhotoViewGalleryScreenState();
}

class _PhotoViewGalleryScreenState extends State<PhotoGalleryView> {
  int currentIndex = 0;
  PageController controller;

  @override
  void initState() {
    currentIndex = widget.index;
    controller = PageController(initialPage: widget.index);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ScrollConfiguration(
            behavior: CustomScrollBehavior(),
            child: PhotoViewGallery.builder(
            itemCount: widget.imageList.length,
            builder: (BuildContext context, int index) {
              return PhotoViewGalleryPageOptions(
                imageProvider: NetworkImage(widget.imageList[index]),
                heroAttributes: widget.heroTag == null ? PhotoViewHeroAttributes(tag: '') : PhotoViewHeroAttributes(tag: widget.heroTag),
                minScale: 0.2,
                maxScale: 1.0,
              );
            },
            loadingBuilder: (context, event) => Center(
              child: CircularProgressIndicator(
                value: event == null
                    ? 0
                    : event.cumulativeBytesLoaded /
                    event.expectedTotalBytes,
              ),
            ),
            loadFailedChild: Center(
              child: Image.asset('assets/images/image_failed_load.png'),
            ),
            pageController: controller,
            onPageChanged: (index) {
              if(mounted){
                setState(() {
                  currentIndex = index;
                });
              }
            },
          ),
          ),
          //居中 图片index显示
          Positioned(
            top: MediaQuery.of(context).padding.top + 15,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text(
                  "${currentIndex + 1}/${widget.imageList.length}",
                  style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          //右上角关闭按钮
          Positioned(
            right: 10,
            top: MediaQuery.of(context).padding.top,
            child: IconButton(
              icon: Icon(
                Icons.close_rounded,
                //size: 30,
                color: Colors.white,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}
