import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoProgressIndicatorDemo extends StatelessWidget {
  const CupertinoProgressIndicatorDemo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: '活动指示器',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  }
}
