import "package:flare_flutter/flare_actor.dart";
import "package:flare_flutter/flare_cache_builder.dart";
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flare_flutter/provider/asset_flare.dart';

class ExampleRocketManPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ExampleRocketManPage> {
  String _animationName = "idle";
  final asset = AssetFlare(bundle: rootBundle, name: "assets/animations/rocket_man.flr");


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FlareActor.asset(
        asset,
        fit: BoxFit.cover,
        animation: _animationName,
      ),
    );
  }
}
