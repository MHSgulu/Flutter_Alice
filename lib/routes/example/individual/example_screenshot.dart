import 'package:flutter/material.dart';

import 'dart:io';
import 'package:screenshot/screenshot.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class ScreenshotDemo extends StatefulWidget {
  @override
  _ScreenshotDemoState createState() => _ScreenshotDemoState();
}

class _ScreenshotDemoState extends State<ScreenshotDemo> {
  int _counter = 0;
  File _imageFile;

  //创建一个ScreenshotController实例
  ScreenshotController screenshotController = ScreenshotController();

  @override
  void initState() {
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screenshot'),
      ),
      body: Container(
        child: new Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Screenshot(
                controller: screenshotController,
                child: Column(
                  children: <Widget>[
                    Text(
                      '你已经按了很多次了:' + _counter.toString(),
                    ),
                    FlutterLogo(),
                  ],
                ),
              ),
              _imageFile != null ? Image.file(_imageFile) : Container(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /*_incrementCounter();
          _imageFile = null;
          screenshotController
              .capture(delay: Duration(milliseconds: 10))
              .then((File image) async {
            //print("Capture Done");
            setState(() {
              _imageFile = image;
            });
            final result =
                await ImageGallerySaver.saveImage(image.readAsBytesSync());
            print("result: " + result);
            print("文件已保存到图库");
          }).catchError((onError) {
            print(onError);
          });*/
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), //
    );
  }

/*_saved(File image) async {
    final result = await ImageGallerySaver.saveImage(image.readAsBytesSync());
    print("result: " + result);
    print("File Saved to Gallery");
  }*/
}
