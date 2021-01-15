import 'package:alice/common/network/http_util.dart';
import 'package:alice/model/eye_opening_video_daily_entity.dart';
import 'package:alice/widgets/custom/my_fade_in_image.dart';
import 'package:alice/widgets/custom/my_rounded_rectang_card.dart';
import 'package:alice/widgets/loading/video_loading_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class FeaturedVideoHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FeaturedVideoHomePageState();
}

class _FeaturedVideoHomePageState extends State<FeaturedVideoHomePage> {
  EyeOpeningVideoDailyEntity entity;
  List<EyeOpeningVideoDailyItemList> dataList = List();

  @override
  void initState() {
    fetchData(1);
    super.initState();
  }

  void fetchData(int page) async {
    var result = await HttpUtil.fetchEyeOpeningVideoDailyData();
    if (result is Exception) {
      Fluttertoast.showToast(msg: 'Exception: ${result.toString()}');
    } else {
      entity = result;
      if (mounted) {
        setState(() {
          if (page == 1) {
            dataList = entity.itemList;
          } else {
            dataList.addAll(entity.itemList);
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent[100],
        title: Text(
          '今日精选视频',
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: dataList.isEmpty ? VideoLoadingView() : videoListView(),
    );
  }

  Widget videoListView() {
    return ListView.builder(
      padding: EdgeInsets.only(bottom: 20),
      itemCount: dataList.length,
      itemBuilder: (context, index) {
        if (dataList[index].type == 'video') {
          double minutes = (dataList[index].data.duration) / 60;
          int seconds = (dataList[index].data.duration) % 60;
          return Container(
            padding: EdgeInsets.fromLTRB(8, 16, 8, 0),
            child: Column(
              children: [
                MyRRectCard(
                  elevation: 0,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      MyFadeInImage(
                        imageUrl: '${dataList[index].data.cover.detail}',
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(3, 2, 3, 2),
                        margin: EdgeInsets.fromLTRB(0, 0, 8, 6),
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                        child: Text(
                          '${minutes.toInt() < 10 ? '0${minutes.toInt()}' : minutes.toInt()}:${seconds < 10 ? '0$seconds' : seconds}',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 6),
                Row(
                  children: [
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey[300],
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: ClipOval(
                        child: MyFadeInImage(
                          imageUrl: dataList[index].data.author.icon,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            dataList[index].data.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '${dataList[index].data.author.name}/ #${dataList[index].data.category}',
                            style:
                                TextStyle(color: Colors.black45, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
