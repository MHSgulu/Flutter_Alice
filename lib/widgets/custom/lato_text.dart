import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LatoText extends StatelessWidget {
  final String data;
  final TextStyle style;

  const LatoText({
    Key key,
    @required this.data,
    this.style,
  })  : assert(
          data != null,
          '必须为文本窗口小部件提供非空字符串',
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: GoogleFonts.lato(
        textStyle: style ?? TextStyle(),
      ),
    );
  }
}
