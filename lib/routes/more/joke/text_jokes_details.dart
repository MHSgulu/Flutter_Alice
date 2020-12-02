import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';


class TextJokesDetails extends StatefulWidget{
  @override
  _TextJokesDetailsState createState() => _TextJokesDetailsState();
}

class _TextJokesDetailsState extends State<TextJokesDetails> {
  @override
  Widget build(BuildContext context) {
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