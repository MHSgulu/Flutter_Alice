import 'package:alice/custom/custom_scroll_behavior.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';
import 'package:alice/model/moive_details_entity.dart';



class MovieRelatedVideosScreen extends StatefulWidget {

  final String videoUrl;
  final List<MoiveDetailsTrailer> data;
  final List<MoiveDetailsBlooper> data2;
  final List<MoiveDetailsClip> data3;

  MovieRelatedVideosScreen({Key key, @required this.videoUrl, this.data,this.data2,this.data3}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MovieRelatedVideosScreen();
  }
}

class _MovieRelatedVideosScreen extends State<MovieRelatedVideosScreen> {
  TargetPlatform _platform;
  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;
  //预告片列表
  List<MoiveDetailsTrailer> moiveDetailsTrailerlList;
  //花絮列表
  List<MoiveDetailsBlooper> moiveDetailsBlooperlList;
  //片段列表
  List<MoiveDetailsClip> moiveDetailsCliplList;
  //当前被选中的预告片索引
  int selectedIndex;
  //当前被选中的花絮索引
  int selectedBlooperIndex;
  //当前被选中的片段索引
  int selectedClipIndex;


  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
    moiveDetailsTrailerlList = widget.data;
    moiveDetailsBlooperlList = widget.data2;
    moiveDetailsCliplList = widget.data3;
    ///只能识别https     http开头无法播放                          用[replacement]替换从[start]到[end]的子字符串。
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl.replaceRange(0, 4, 'https'));
    //print(widget.videoUrl.replaceRange(0, 4, 'https'));
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 1.6,
      autoPlay: true,
      looping: true,
    );
  }

  void replaceTrailerVideo(String url, int currentIndex){
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
      selectedBlooperIndex = null;
      selectedClipIndex = null;
    });
  }

  void replaceBlooperVideo(String url, int currentIndex){
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
      selectedIndex = null;
      selectedBlooperIndex = currentIndex;
      selectedClipIndex = null;
    });
  }

  void replaceClipVideo(String url, int currentIndex){
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
      selectedIndex = null;
      selectedBlooperIndex = null;
      selectedClipIndex = currentIndex;
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        platform: _platform ?? Theme.of(context).platform,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_rounded),
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
        body: ScrollConfiguration(
            behavior: CustomScrollBehavior(),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  ///视频播放器视口
                  Container(
                    child: Chewie(
                      controller: _chewieController,
                    ),
                  ),
                  ///播放器样式选择
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
                  ///预告片列表
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
                            replaceTrailerVideo(moiveDetailsTrailerlList[index].resourceUrl,index);
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
                  Container(
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: Divider(
                    ),
                  ),
                  moiveDetailsBlooperlList.isNotEmpty ? ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: moiveDetailsBlooperlList.length,
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
                          color: index == selectedBlooperIndex ? Colors.orange[100] : Colors.white12,
                          splashColor: Colors.orange[100],
                          onPressed: (){
                            replaceBlooperVideo(moiveDetailsBlooperlList[index].resourceUrl,index);
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
                                        moiveDetailsBlooperlList[index].medium,
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
                                  child: Text(moiveDetailsBlooperlList[index].title),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ) : Container(),
                  Container(
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: Divider(
                    ),
                  ),
                  moiveDetailsCliplList.isNotEmpty ? ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: moiveDetailsCliplList.length,
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
                          color: index == selectedClipIndex ? Colors.orange[100] : Colors.white12,
                          splashColor: Colors.orange[100],
                          onPressed: (){
                            replaceClipVideo(moiveDetailsCliplList[index].resourceUrl,index);
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
                                        moiveDetailsCliplList[index].medium,
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
                                  child: Text(moiveDetailsCliplList[index].title),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ) : Container(),
                ],
              ),
            ),
        ),
      ),
    );
  }
}