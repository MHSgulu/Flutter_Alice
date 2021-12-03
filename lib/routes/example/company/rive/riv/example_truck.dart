import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class MyRiveAnimation extends StatefulWidget {
  @override
  _MyRiveAnimationState createState() => _MyRiveAnimationState();
}

class _MyRiveAnimationState extends State<MyRiveAnimation> {
  final riveFileName = 'assets/animations/truck.riv';
  Artboard _artboard;
  RiveAnimationController _wipersController;
  // 打开和关闭雨刮器的标志
  bool _wipers = false;

  @override
  void initState() {
    _loadRiveFile();
    super.initState();
  }

  // 加载Rive文件
  void _loadRiveFile() async {
    final bytes = await rootBundle.load(riveFileName);
    /*final file = RiveFile();
    if (file.import(bytes)) {
      // 按名称选择动画
      setState(() {
        return _artboard = file.mainArtboard
          ..addController(
            SimpleAnimation('idle'),
          );
      });
    }*/
  }

  void _wipersChange(bool wipersOn) {
    if (_wipersController == null) {
      _artboard.addController(
        _wipersController = SimpleAnimation('windshield_wipers'),
      );
    }
    setState(() {
      return _wipersController.isActive = _wipers = wipersOn;
    });
  }

  /// 显示加载时的Rive文件
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: _artboard != null
                ? Rive(
              artboard: _artboard,
              fit: BoxFit.cover,
            )
                : Container(),
          ),
          SizedBox(
            height: 50,
            width: 200,
            child: SwitchListTile(
              title: const Text('雨刮器'),
              value: _wipers,
              onChanged: _wipersChange,
            ),
          ),
        ],
      ),
    );
  }
}
