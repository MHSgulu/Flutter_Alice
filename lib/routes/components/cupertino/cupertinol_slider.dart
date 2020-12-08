import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoSliderDemo extends StatefulWidget {
  const CupertinoSliderDemo();

  @override
  _CupertinoSliderDemoState createState() => _CupertinoSliderDemoState();
}

class _CupertinoSliderDemoState extends State<CupertinoSliderDemo> {
  double _value = 25.0;
  double _discreteValue = 20.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'CupertinoSlider',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: double.infinity,
                child: CupertinoSlider(
                  value: _value,
                  min: 0.0,
                  max: 100.0,
                  onChanged: (value) {
                    setState(() {
                      _value = value;
                    });
                  },
                ),
              ),
              MergeSemantics(
                child: Text('连续: ${_value.toStringAsFixed(1)}'),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: double.infinity,
                child: CupertinoSlider(
                  value: _discreteValue,
                  min: 0.0,
                  max: 100.0,
                  divisions: 5,
                  onChanged: (value) {
                    setState(() {
                      _discreteValue = value;
                    });
                  },
                ),
              ),
              MergeSemantics(
                child: Text('间续: ${_discreteValue.toStringAsFixed(1)}'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
