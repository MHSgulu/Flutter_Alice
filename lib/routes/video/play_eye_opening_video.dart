import 'package:alice/common/const/arguments.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayEyeOpeningVideo extends StatefulWidget{
  @override
  _PlayEyeOpeningVideoState createState() => _PlayEyeOpeningVideoState();
}

class _PlayEyeOpeningVideoState extends State<PlayEyeOpeningVideo> {
  VideoInfoArguments arg;
  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    arg = ModalRoute.of(context).settings.arguments;
    print('数据点位: 播放地址： ${arg.data.playUrl.replaceRange(0, 4, 'https')}');
    initializePlayer();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  Future<void> initializePlayer() async {
    _videoPlayerController = VideoPlayerController.network(arg.data.playUrl.replaceRange(0, 4, 'https'));
    await _videoPlayerController.initialize();
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: true,
      // 尝试使用其他一些选项：
      // showControls: false,
      // materialProgressColors: ChewieProgressColors(
      //   playedColor: Colors.red,
      //   handleColor: Colors.blue,
      //   backgroundColor: Colors.grey,
      //   bufferedColor: Colors.lightGreen,
      // ),
      // placeholder: Container(
      //   color: Colors.grey,
      // ),
      // autoInitialize: true,
    );
    if(mounted){
      setState(() {

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: PreferredSize(
        child: AppBar(
          backgroundColor: Colors.black,
        ),
        preferredSize: Size.fromHeight(0),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
        child: Column(
          children: [
            videoPlayView(),

          ],
        ),
      ),
      ),
    );
  }

  Widget videoPlayView() {
    return AspectRatio(
      aspectRatio: 16.0 / 9.0, //视频宽高比 基本1.7
      child: _chewieController != null && _chewieController.videoPlayerController.value.initialized
          ? Chewie(
        controller: _chewieController,
      )
          : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircularProgressIndicator(),
          SizedBox(height: 20),
          Text('Loading'),
        ],
      ),
    );
  }

}