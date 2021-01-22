import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

import 'home_page.dart';

class MyCupertinoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false, //去掉右上角Debug标志
      title: 'Cupertino Alice',
      home: CupertinoHomePage(),
    );
  }
}