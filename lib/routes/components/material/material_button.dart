import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';

class MaterialButtonRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: '按钮',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('之前版本的 MD按钮'),
          SizedBox(height: 20,),
          Center(
            child: FlatButton(
              onPressed: () {

              },
              child: Text('FlatButton'),
            ),
          ),
          Center(
            child: OutlineButton(
              onPressed: () {

              },
              child: Text('OutlineButton'),
            ),
          ),
          Center(
            child: RaisedButton(
              onPressed: () {

              },
              child: Text('RaisedButton'),
            ),
          ),
          SizedBox(height: 20,),
          Text('Flutter1.22 新版 MD按钮'),
          SizedBox(height: 20,),
          Center(
            child: TextButton(
              onPressed: () {

              },
              child: Text('TextButton'),
            ),
          ),
          Center(
            child: OutlinedButton(
              onPressed: () {

              },
              child: Text('OutlinedButton'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {

              },
              child: Text('ElevatedButton'),
            ),
          ),
        ],
      ),
    );
  }
}
