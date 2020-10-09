import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';


class ExampleRivePage extends StatefulWidget {
  const ExampleRivePage({Key key}) : super(key: key);

  @override
  _ExampleRivePageState createState() => _ExampleRivePageState();
}

class _ExampleRivePageState extends State<ExampleRivePage> with SingleTickerProviderStateMixin{
  void _togglePlay() {
    setState(() => _controller.isActive = !_controller.isActive);
  }

  /// 我们通过控制器是否正在运行来跟踪动画是否正在播放。
  bool get isPlaying => _controller?.isActive ?? false;

  Artboard _riveArtboard;
  RiveAnimationController _controller;
  @override
  void initState() {
    super.initState();

    // 从包中加载动画文件，请注意，您也可以下载它。 RiveFile只需要一个字节列表。
    rootBundle.load('assets/animations/off_road_car.riv').then(
          (data) async {
        var file = RiveFile();

        // 从二进制数据加载RiveFile。
        var success = file.import(data);
        if (success) {
          // 画板是动画的根源，是绘制到Rive小部件中的东西。
          var artboard = file.mainArtboard;
          // 添加一个控制器以在主/默认画板上播放已知动画。
          // 我们存储了对它的引用，因此可以切换播放。
          artboard.addController(
            _controller = SimpleAnimation('idle'),
          );
          setState(() {
            return _riveArtboard = artboard;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rive 动画',style: TextStyle(fontSize: 17),),
      ),
      body: Center(
        child: _riveArtboard == null
            ? const SizedBox()
            : Rive(artboard: _riveArtboard),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _togglePlay,
        tooltip: isPlaying ? 'Pause' : 'Play',
        child: Icon(
          isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}