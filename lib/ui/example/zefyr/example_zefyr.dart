
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'form.dart';
import 'full_page.dart';
import 'text_field_page.dart';
import 'view.dart';

// 创建什么都不做的焦点意图
class FakeFocusIntent extends Intent {
  const FakeFocusIntent();
}

class ZefyrApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 禁用默认箭头焦点更改。
      // 否则当我们用箭头移动时，它会使键盘闪烁
      shortcuts: Map<LogicalKeySet, Intent>.from(WidgetsApp.defaultShortcuts)
        ..addAll(<LogicalKeySet, Intent>{
          LogicalKeySet(LogicalKeyboardKey.arrowLeft): const FakeFocusIntent(),
          LogicalKeySet(LogicalKeyboardKey.arrowRight): const FakeFocusIntent(),
          LogicalKeySet(LogicalKeyboardKey.arrowDown): const FakeFocusIntent(),
          LogicalKeySet(LogicalKeyboardKey.arrowUp): const FakeFocusIntent(),
        }),
      debugShowCheckedModeBanner: false,
      title: 'Zefyr Editor',
      home: HomePage(),
      routes: {
        '/fullPage': buildFullPage,
        '/form': buildFormPage,
        '/view': buildViewPage,
        '/textinput': buildTextFieldPage,
      },
    );
  }

  Widget buildFullPage(BuildContext context) {
    return FullPageEditorScreen();
  }

  Widget buildFormPage(BuildContext context) {
    return FormEmbeddedScreen();
  }

  Widget buildViewPage(BuildContext context) {
    return ViewScreen();
  }

  Widget buildTextFieldPage(BuildContext context) {
    return TextFieldScreen();
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final nav = Navigator.of(context);
    return Scaffold(
      appBar: AppBar(title: ZefyrLogo()),
      body: Column(
        children: <Widget>[
          Expanded(child: Container()),
          RaisedButton(
            onPressed: () => nav.pushNamed('/fullPage'),
            child: Text('全页编辑器'),
          ),
          RaisedButton(
            onPressed: () => nav.pushNamed('/form'),
            child: Text('嵌入表格'),
          ),
          RaisedButton(
            onPressed: () => nav.pushNamed('/view'),
            child: Text('只读可嵌入视图'),
          ),
          RaisedButton(
            onPressed: () => nav.pushNamed('/textinput'),
            child: Text('基本文字输入'),
          ),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}


