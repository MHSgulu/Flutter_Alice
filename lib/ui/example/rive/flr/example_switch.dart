import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class ExampleSwitchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ExampleSwitchPageState();
}

class _ExampleSwitchPageState extends State<ExampleSwitchPage> {
  static final List<bool> options = [false, true, false, true, true];
  bool _snapToEnd = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: options
                  .asMap()
                  .map((i, isOn) => MapEntry(
                      i,
                      SmileySwitch(isOn, snapToEnd: _snapToEnd, onToggle: () {
                        setState(() {
                          _snapToEnd = false;
                          options[i] = !isOn;
                        });
                      })))
                  .values
                  .toList()
                  .cast<Widget>() +
              [
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: Colors.pinkAccent,
                  child: const Text('Back'),
                )
              ],
        ),
      ),
    );
  }
}

class SmileySwitch extends StatelessWidget {
  final bool isOn;
  final VoidCallback onToggle;
  final bool snapToEnd;

  SmileySwitch(this.isOn, {this.snapToEnd, this.onToggle});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onToggle,
        child: Container(
            width: 200,
            height: 100,
            child: FlareActor(
              "assets/animations/smiley_switch.flr",
              snapToEnd: snapToEnd,
              animation: isOn ? "On" : "Off",
            )));
  }
}
