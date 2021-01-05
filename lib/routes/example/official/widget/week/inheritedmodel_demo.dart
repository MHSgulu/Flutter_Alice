import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';

class InheritedModelDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'InheritedModel',
        onPressedBack: () => Navigator.pop(context),
      ),
    );
  }

}