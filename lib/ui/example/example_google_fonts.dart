import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GoogleFontsPage extends StatefulWidget {
  @override
  _GoogleFontsPageState createState() => _GoogleFontsPageState();
}

class _GoogleFontsPageState extends State<GoogleFontsPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google字体'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 40,
            ),
            Text(
              '这是默认字体 没加任何修饰 This is the default font without any decoration',
            ),
            Container(
              height: 20,
            ),
            Text(
              '这是Google字体（lato） This is Google font (lato) GoogleFonts与默认TextStyle一起使用',
              style: GoogleFonts.lato(),
            ),
            Container(
              height: 20,
            ),
            Text(
              '这是Google字体（lato） This is Google font (lato) 动态加载字体',
              style: GoogleFonts.getFont('Lato'),
            ),
            Container(
              height: 20,
            ),
            Text(
              '这是Google字体（lato）  使用GoogleFonts与现有的TextStyle',
              style: GoogleFonts.lato(
                textStyle: TextStyle(color: Colors.blue, letterSpacing: .5),
              ),
            ),
            Container(
              height: 20,
            ),
            Text(
              '这是Google字体（lato）',
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.headline4,
                fontSize: 20,
              ),

              ///这是2014版材料设计中使用的术语。 现代术语是标题4。 ' v1.13.8之后不推荐使用此功能
            ),
            Container(
              height: 20,
            ),
            Text(
              '这是Google字体（lato） 覆盖fontSize，fontWeight或者fontStyle',
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.headline4,
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
              ),
            ),
            Container(
              height: 20,
            ),
            Text(
              '您已多次按下按钮：',
              style: GoogleFonts.oswald(
                  textStyle: Theme.of(context).textTheme.headline4),
            ),
            Text(
              '$_counter',
              style: GoogleFonts.lato(fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
