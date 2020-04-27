import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';
import 'package:alice/model/moive_details_entity.dart';



class MovieRelatedVideosScreen extends StatefulWidget {

  final String videoUrl;
  final List<MoiveDetailsTrailer> data;

  MovieRelatedVideosScreen({Key key, @required this.videoUrl, this.data}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MovieRelatedVideosScreen();
  }
}

class _MovieRelatedVideosScreen extends State<MovieRelatedVideosScreen> {
  TargetPlatform _platform;
  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;
  List<MoiveDetailsTrailer> moiveDetailsTrailerlList;
  //当前被选中的预告片索引
  int selectedIndex;


  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
    moiveDetailsTrailerlList = widget.data;
    ///只能识别https http格式无法播放                          用[replacement]替换从[start]到[end]的子字符串。
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl.replaceRange(0, 4, 'https'));
    //print(widget.videoUrl.replaceRange(0, 4, 'https'));
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 1.6,
      autoPlay: true,
      looping: true,
    );
  }

  void replaceVideo(String url, int currentIndex){
    ///禁止setState（）在dispose（）之后调用，意思是当前页面在构建树里已被销毁，无法改变状态。
    setState(() {
      _chewieController.dispose();
      _videoPlayerController.pause();
      //_videoPlayerController.seekTo(Duration(seconds: 0));
      _videoPlayerController = VideoPlayerController.network(url.replaceRange(0, 4, 'https'));
      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        aspectRatio: 1.6,
        autoPlay: true,
        looping: true,
      );
      selectedIndex = currentIndex;
    });
  }




  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        platform: _platform ?? Theme.of(context).platform,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
          title: Text('电影预告片',style: TextStyle(fontSize: 16)),
          backgroundColor: Colors.black,
          actions: <Widget>[
            GestureDetector(
              onTap: (){
                print('跟多');
              },
              child: Container(
                padding: EdgeInsets.only(right: 16.0),
                child: Icon(Icons.more_horiz),
              ),
            ),
          ],
        ),
        ///SingleChildScrollView在主题最外层才可以滚动。
        body: SingleChildScrollView(
              child: Column(
                  children: <Widget>[
                    Container(
                      child: Chewie(
                        controller: _chewieController,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: FlatButton(
                            onPressed: () {
                              setState(() {
                                _platform = TargetPlatform.android;
                              });
                            },
                            child: Padding(
                              child: Text("Android播放器"),
                              padding: EdgeInsets.symmetric(vertical: 16.0),
                            ),
                          ),
                        ),
                        Expanded(
                          child: FlatButton(
                            onPressed: () {
                              setState(() {
                                _platform = TargetPlatform.iOS;
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 16.0),
                              child: Text("iOS播放器"),
                            ),
                          ),
                        )
                      ],
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: moiveDetailsTrailerlList.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return Container(
                          padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                          child: Divider(
                          ),
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                          child: FlatButton(
                            ///如果当前item被选中更换背景色，当前index等于被选中的index
                            color: index == selectedIndex ? Colors.orange[100] : Colors.white12, ///默认页面背景色  white12
                            splashColor: Colors.orange[100],
                            onPressed: (){
                              replaceVideo(moiveDetailsTrailerlList[index].resourceUrl,index);
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: Card(
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadiusDirectional.circular(2.0)),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: <Widget>[
                                        Image.network(
                                          moiveDetailsTrailerlList[index].medium,
                                          width: 120,
                                          //height: 150,
                                          fit: BoxFit.cover,
                                        ),
                                        Container(
                                          child: Icon(Icons.play_circle_outline, color: Colors.white70, size: 20),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(16, 4, 0, 0),
                                    child: Text(moiveDetailsTrailerlList[index].title),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
            ),
      ),
    );
  }
}