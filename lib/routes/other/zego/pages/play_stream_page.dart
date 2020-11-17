import 'package:alice/routes/other/zego/config/zego_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:zego_express_engine/zego_express_engine.dart';



class PlayStreamPage extends StatefulWidget {

  final int screenWidthPx;
  final int screenHeightPx;

  PlayStreamPage(this.screenWidthPx, this.screenHeightPx);

  @override
  _PlayStreamPageState createState() => new _PlayStreamPageState();
}

class _PlayStreamPageState extends State<PlayStreamPage> {

  String _title = '';
  bool _isPlaying = false;

  int _playViewID = -1;
  Widget _playViewWidget;
  ZegoCanvas _playCanvas;

  int _playWidth = 0;
  int _playHeight = 0;
  double _playRecvFPS = 0.0;
  double _playDecodeFPS = 0.0;
  double _playRenderFPS = 0.0;
  double _playVideoBitrate = 0.0;
  double _playAudioBitrate = 0.0;
  bool _isHardwareDecode = false;
  String _networkQuality = '';

  bool _isUseSpeaker = true;

  TextEditingController _controller = new TextEditingController();

  @override
  void initState() {
    super.initState();

    _title = '步骤3 准备拉流';

    if (ZegoConfig.instance.streamID.isNotEmpty) {
      _controller.text = ZegoConfig.instance.streamID;
    }

    setPlayerCallback();

  }

  void setPlayerCallback() {

    // 设置播放器状态回调
    ZegoExpressEngine.onPlayerStateUpdate = (String streamID, ZegoPlayerState state, int errorCode, Map<String, dynamic> extendedData) {

      if(errorCode == 0) {
        setState(() {
          _isPlaying = true;
          _title = 'Playing';
        });

        ZegoConfig.instance.streamID = streamID;
        ZegoConfig.instance.saveConfig();

      } else {
        print('Play error: $errorCode');
      }
    };

    // Set the player quality callback
    ZegoExpressEngine.onPlayerQualityUpdate = (String streamID, ZegoPlayStreamQuality quality) {

      setState(() {
        _playRecvFPS = quality.videoRecvFPS;
        _playDecodeFPS = quality.videoDecodeFPS;
        _playRenderFPS = quality.videoRenderFPS;
        _playVideoBitrate = quality.videoKBPS;
        _playAudioBitrate = quality.audioKBPS;
        _isHardwareDecode = quality.isHardwareDecode;

        switch (quality.level) {
          case ZegoStreamQualityLevel.Excellent:
            _networkQuality = '☀️';
            break;
          case ZegoStreamQualityLevel.Good:
            _networkQuality = '⛅️️';
            break;
          case ZegoStreamQualityLevel.Medium:
            _networkQuality = '☁️';
            break;
          case ZegoStreamQualityLevel.Bad:
            _networkQuality = '🌧';
            break;
          case ZegoStreamQualityLevel.Die:
            _networkQuality = '❌';
            break;
          default:
            break;
        }
      });
    };

    // 设置播放器视频大小更改回调
    ZegoExpressEngine.onPlayerVideoSizeChanged = (String streamID, int width, int height) {
      setState(() {
        _playWidth = width;
        _playHeight = height;
      });
    };
  }

  @override
  void dispose() {
    super.dispose();

    if (_isPlaying) {
      // 停止播放
      ZegoExpressEngine.instance.stopPlayingStream(ZegoConfig.instance.streamID);
    }

    // 取消注册播放器回调
    ZegoExpressEngine.onPlayerStateUpdate = null;
    ZegoExpressEngine.onPlayerQualityUpdate = null;
    ZegoExpressEngine.onPlayerVideoSizeChanged = null;

    if (ZegoConfig.instance.enablePlatformView) {
      // 销毁播放平台视图
      ZegoExpressEngine.instance.destroyPlatformView(_playViewID);
    } else {
      // Destroy play texture renderer
      ZegoExpressEngine.instance.destroyTextureRenderer(_playViewID);
    }

    // 退出房间
    ZegoExpressEngine.instance.logoutRoom(ZegoConfig.instance.roomID);
  }

  void onPlayButtonPressed() {

    String streamID = _controller.text.trim();

    if (ZegoConfig.instance.enablePlatformView) {

      setState(() {
        // 创建平台视图小部件
        _playViewWidget = ZegoExpressEngine.instance.createPlatformView((viewID) {

          _playViewID = viewID;

          // 使用平台视图开始播放流
          startPlayingStream(viewID, streamID);

        });
      });

    } else {


      // 创建纹理渲染器
      ZegoExpressEngine.instance.createTextureRenderer(widget.screenWidthPx, widget.screenHeightPx).then((textureID) {

        _playViewID = textureID;

        setState(() {
          // 创建纹理小部件
          _playViewWidget = Texture(textureId: textureID);
        });

        // 开始使用纹理渲染器播放流
        startPlayingStream(textureID, streamID);
      });
    }

  }

  void startPlayingStream(int viewID, String streamID) {
    setState(() {

      // 设置播放画布
      _playCanvas = ZegoCanvas.view(viewID);

      // 开始播放流
      ZegoExpressEngine.instance.startPlayingStream(streamID, canvas: _playCanvas);
    });
  }

  void onSpeakerStateChanged() {
    setState(() {
      _isUseSpeaker = !_isUseSpeaker;
      ZegoExpressEngine.instance.muteSpeaker(!_isUseSpeaker);
    });
  }



  Widget showPreviewToolPage() {
    return GestureDetector(

      behavior: HitTestBehavior.translucent,
      onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),

      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
            ),
            Row(
              children: <Widget>[
                Text('StreamID: ')
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
            ),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 10.0, top: 12.0, bottom: 12.0),
                  hintText: '请输入 streamID',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey
                      )
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0xff0e88eb)
                      )
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
            ),
            Text(
              'StreamID必须是全局唯一的，长度不应超过255个字节',
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.black45
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
            ),
            Container(
              padding: const EdgeInsets.all(0.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Color(0xee0e88eb),
              ),
              width: 240.0,
              height: 60.0,
              child: CupertinoButton(
                child: Text('开始播放',
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
                onPressed: onPlayButtonPressed,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget showPublishingToolPage() {
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: MediaQuery.of(context).padding.bottom + 20.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
          ),
          Row(
            children: <Widget>[
              Text('RoomID: ${ZegoConfig.instance.roomID}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 9
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text('StreamID: ${ZegoConfig.instance.streamID}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 9
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text('Rendering with: ${ZegoConfig.instance.enablePlatformView ? 'PlatformView' : 'TextureRenderer'}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 9
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text('Resolution: $_playWidth x $_playHeight',
                style: TextStyle(
                    color: Colors.white,
                  fontSize: 9
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text('FPS(Recv): ${_playRecvFPS.toStringAsFixed(2)}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 9
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text('FPS(Decode): ${_playDecodeFPS.toStringAsFixed(2)}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 9
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text('FPS(Render): ${_playDecodeFPS.toStringAsFixed(2)}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 9
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text('Bitrate(Video): ${_playVideoBitrate.toStringAsFixed(2)} kb/s',
                style: TextStyle(
                    color: Colors.white,
                  fontSize: 9
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text('Bitrate(Audio): ${_playAudioBitrate.toStringAsFixed(2)} kb/s',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 9
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text('HardwareDecode: ${_isHardwareDecode ? '✅' : '❎'}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 9
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text('NetworkQuality: $_networkQuality',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 9
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(padding: const EdgeInsets.only(top: 10.0)),
          ),
          Row(
            children: <Widget>[
              CupertinoButton(
                padding: const EdgeInsets.all(0.0),
                pressedOpacity: 1.0,
                borderRadius: BorderRadius.circular(
                    0.0),
                child: Image(
                  width: 44.0,
                  image: _isUseSpeaker
                      ? AssetImage('resources/images/bottom_microphone_on_icon.png')
                      : AssetImage('resources/images/bottom_microphone_off_icon.png'),
                ),
                onPressed: onSpeakerStateChanged,
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text(_title),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
              child: _playViewWidget,
            ),
            _isPlaying ? showPublishingToolPage() : showPreviewToolPage(),
          ],
        )
    );
  }

}