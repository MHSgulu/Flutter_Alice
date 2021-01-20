import 'package:alice/common/const/arguments.dart';
import 'package:alice/widgets/custom/my_fade_in_image.dart';
import 'package:alice/widgets/custom/my_loading_indicator.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayEyeOpeningVideo extends StatefulWidget {
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
    _videoPlayerController = VideoPlayerController.network(
        arg.data.playUrl.replaceRange(0, 4, 'https'));
    await _videoPlayerController.initialize();
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: true,
    );
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
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
              videoInfoView(),
              SizedBox(height: 16),
              Container(
                color: Colors.grey[800],
                padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
                child:  Row(
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
                          imageUrl: arg.data.author.icon,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            arg.data.author.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '${arg.data.author.description}',
                            style: TextStyle(
                                color: Colors.white60, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
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
          : MyLoadingIndicator(),
    );
  }

  Widget videoInfoView() {
    return Container(
      padding: EdgeInsets.fromLTRB(12, 15, 12, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            arg.data.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            '#${arg.data.category} / ${arg.data.author.name}',
            style: TextStyle(color: Colors.white70, fontSize: 12),
          ),
          SizedBox(height: 8),
          Text(
            '#${arg.data.description}',
            style: TextStyle(color: Colors.white70, fontSize: 13),
          ),
        ],
      ),
    );
  }
}
