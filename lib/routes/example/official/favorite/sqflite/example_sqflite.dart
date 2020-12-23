import 'dart:async';

import 'package:flutter/material.dart';
import 'batch_test_page.dart';
import 'deprecated_test_page.dart';
import 'exception_test_page.dart';
import 'exp_test_page.dart';
import 'manual_test_page.dart';
import 'src/dev_utils.dart';

import 'model/main_item.dart';
import 'open_test_page.dart';
import 'raw_test_page.dart';
import 'slow_test_page.dart';
import 'src/main_item_widget.dart';
import 'todo_test_page.dart';
import 'type_test_page.dart';


class ExampleSqlLite extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

/// Simple test page.
const String testRawRoute = '/test/simple';

/// Open test page.
const String testOpenRoute = '/test/open';

/// Slow test page.
const String testSlowRoute = '/test/slow';

/// Type test page.
const String testTypeRoute = '/test/type';

/// Batch test page.
const String testBatchRoute = '/test/batch';

/// `todo` example test page.
const String testTodoRoute = '/test/todo';

/// Exception test page.
const String testExceptionRoute = '/test/exception';

/// Manual test page.
const String testManualRoute = '/test/manual';

/// Experiment test page.
const String testExpRoute = '/test/exp';

/// Deprecated test page.
const String testDeprecatedRoute = '/test/deprecated';

class _MyAppState extends State<ExampleSqlLite> {
  var routes = <String, WidgetBuilder>{
    '/test': (BuildContext context) => MyHomePage(),
    testRawRoute: (BuildContext context) => RawTestPage(),
    testOpenRoute: (BuildContext context) => OpenTestPage(),
    testSlowRoute: (BuildContext context) => SlowTestPage(),
    testTodoRoute: (BuildContext context) => TodoTestPage(),
    testTypeRoute: (BuildContext context) => TypeTestPage(),
    testManualRoute: (BuildContext context) => ManualTestPage(),
    testBatchRoute: (BuildContext context) => BatchTestPage(),
    testExceptionRoute: (BuildContext context) => ExceptionTestPage(),
    testExpRoute: (BuildContext context) => ExpTestPage(),
    testDeprecatedRoute: (BuildContext context) => DeprecatedTestPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Sqflite Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Sqflite Demo Home Page'),
        routes: routes,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key) {
    _items.add(MainItem('原始测试', '原始SQLite操作', route: testRawRoute));
    _items.add(MainItem('开放测试', '打开onCreate / onUpgrade / onDowngrade', route: testOpenRoute));
    _items.add(MainItem('型式试验', '测试值类型', route: testTypeRoute));
    _items.add(MainItem('批量测试', '测试批处理操作', route: testBatchRoute));
    _items.add(MainItem('测试缓慢', '长时间的操作', route: testSlowRoute));
    _items.add(MainItem('所有示例数据库', '简单的类似Todo的数据库用法示例', route: testTodoRoute));
    _items.add(MainItem('exp测试', '实验和各种测试', route: testExpRoute));
    _items.add(MainItem('异常测试', '触发异常的测试', route: testExceptionRoute));
    _items.add(MainItem('手动测试', '需要手动执行的测试', route: testManualRoute));
    _items.add(MainItem('不推荐使用的测试', '保留一些过时的功能测试', route: testDeprecatedRoute));

    // 取消注释以查看所有日志
    //Sqflite.devSetDebugModeOn(true);
  }

  final List<MainItem> _items = [];

  /// Page title.
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

String _debugAutoStartRouteName;

/// （调试）设置开始的路线。
String get debugAutoStartRouteName => _debugAutoStartRouteName;

/// 不建议使用以避免通话
@deprecated
set debugAutoStartRouteName(String routeName) =>
    _debugAutoStartRouteName = routeName;

class _MyHomePageState extends State<MyHomePage> {
  int get _itemCount => widget._items.length;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero).then((_) async {
      if (mounted) {
        // 用它来自动启动测试页
        if (debugAutoStartRouteName != null) {
          // 只有一次

          // await Navigator.of(context).pushNamed(testExpRoute);
          // await Navigator.of(context).pushNamed(testRawRoute);
          var future = Navigator.of(context).pushNamed(debugAutoStartRouteName);
          // ignore: deprecated_member_use_from_same_package
          debugAutoStartRouteName = null;
          await future;
          // await Navigator.of(context).pushNamed(testExceptionRoute);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
          Center(child: Text('Sqflite 示例', textAlign: TextAlign.center)),
        ),
        body:
        ListView.builder(itemBuilder: _itemBuilder, itemCount: _itemCount));
  }

  //new Center(child: new Text('Running on: $_platformVersion\n')),

  Widget _itemBuilder(BuildContext context, int index) {
    return MainItemWidget(widget._items[index], (MainItem item) {
      Navigator.of(context).pushNamed(item.route);
    });
  }
}