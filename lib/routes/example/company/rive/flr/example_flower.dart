import "package:flare_flutter/flare_actor.dart";
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flare_flutter/provider/asset_flare.dart';

class ExampleFlowerPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ExampleFlowerPage> {
  String _animationName = "idle";
  final asset = AssetFlare(bundle: rootBundle, name: "assets/animations/flower.flr");


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FlareActor.asset(
        asset,
        fit: BoxFit.fill,
        animation: _animationName,
      ),
    );
  }
}
