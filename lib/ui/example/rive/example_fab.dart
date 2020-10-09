import "package:flare_flutter/flare_actor.dart";
import "package:flare_flutter/flare_cache_builder.dart";
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flare_flutter/provider/asset_flare.dart';

class ExampleFabPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ExampleFabPage> {
  bool _useAA = true;
  String _animationName = "idle";
  final asset =
      AssetFlare(bundle: rootBundle, name: "assets/animations/filip.flr");

  /// 在[FlareActor]上切换抗锯齿
  void _toggleAntialiasing() {
    setState(() {
      _useAA = !_useAA;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
          title: Text(
        '点击FAB按钮来决定是否抗锯齿',
        style: TextStyle(fontSize: 16),
      )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: FlareCacheBuilder(
                [asset],
                builder: (BuildContext context, bool isWarm) {
                  return !isWarm
                      ? Container(child: Text("等待动画加载"))
                      : FlareActor.asset(
                          asset,
                          alignment: Alignment.center,
                          fit: BoxFit.contain,
                          animation: _animationName,
                          antialias: _useAA,
                        );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: _toggleAntialiasing,
          child: Icon(
              _useAA ? Icons.center_focus_strong : Icons.center_focus_weak)),
    );
  }
}
