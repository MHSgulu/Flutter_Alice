import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';


class TextJokesDetails extends StatefulWidget{
  @override
  _TextJokesDetailsState createState() => _TextJokesDetailsState();
}

class _TextJokesDetailsState extends State<TextJokesDetails> {
  @override
  Widget build(BuildContext context) {
    ///返回与给定上下文最紧密相关的模态路由。
    ///ModalRoute route = ModalRoute.of（context）;

    ///路线名称（例如“ / settings”）。
    /// 如果为null，则路由为匿名
    ///final String name;
    ///name;

    ///传递给此路由的参数。
    ///可在构建路线时使用，例如 在[Navigator.onGenerateRoute]中。
    ///final Object arguments;
    ///arguments;

    final String text = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: MyAppBar(
        label: '文本笑话',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(12, 10, 12, 20),
        child: Text(text),
      ),
    );
  }
}