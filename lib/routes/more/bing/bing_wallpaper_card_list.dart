import 'package:alice/common/const/strings.dart';
import 'package:alice/common/util/tool_util.dart';
import 'package:alice/model/bingwallpaper.dart';
import 'package:alice/widgets/view/photo_view_gallry.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class BingWallpaperCardList extends StatelessWidget {
  final AsyncSnapshot<BingWallpaper> snapshot;
  final List<String> imageList;

  const BingWallpaperCardList({
    Key key,
    @required this.snapshot,
    @required this.imageList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 8,
      itemBuilder: (context, index) => Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          clipBehavior: Clip.antiAlias,
          elevation: 2.0,
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PhotoGalleryView(
                              imageList: imageList,
                              index: index,
                              heroTag: '$index',
                            ),
                    ),
                  );
                },
                child: Hero(
                  tag: '$index',
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: Util.bingUrl + snapshot.data.images[index].url,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  margin: EdgeInsets.all(2.0),
                  child: Text(
                    snapshot.data.images[index].startdate,
                    style: TextStyle(color: Colors.white70, fontSize: 10.0),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => ToolUtil.launchWebUrl(snapshot.data.images[index].copyrightlink),
                child: Container(
                  margin: EdgeInsets.fromLTRB(8, 0, 8, 16),
                  child: Text(
                    snapshot.data.images[index].copyright,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12.0,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
