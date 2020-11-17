import 'file:///E:/Alice_flutter/alice/lib/routes/example/picker/src/item_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'view/show_city_picker.dart';
import 'view/wip.dart';
import 'view/show_full_page_picker.dart';
import 'view/util_getLocationInfo.dart';


class ExampleCityPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
          primaryColor: Color(0xFFC91B3A),
          backgroundColor: Color(0xFFEFEFEF),
          accentColor: Color(0xFF888888),
          textTheme: TextTheme(
            //设置Material的默认字体样式
            body1: TextStyle(color: Color(0xFF888888), fontSize: 16.0),
          )
      ),
      title: 'Welcome to Flutt2er',
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/name': (_) => ShowCityPicker(),
        '/full_page': (_) =>  ShowFullPageCityPicker(),
        '/city_select': (_) =>  WorkInProgress(),
        '/util_getLocationInfo': (_) =>  UtilGetLocationInfo()
      },
      home: Body(),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List demoList = [
    {
      "icon": Icons.place,
      "name": "ios选择器",
      "routerName": '/name'
    },
    {
      "icon": Icons.fullscreen,
      "name": "三级全屏选择器",
      "routerName": '/full_page'
    },
    {
      "icon": Icons.location_city,
      "name": "城市选择器",
      "routerName": '/city_select'
    },
    {
      "icon": Icons.location_city,
      "name": "内置工具类",
      "routerName": '/util_getLocationInfo'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('CityPickers Examples'),
        ),
        body: ItemContainer(
          itemList: demoList,
        ));
  }
}