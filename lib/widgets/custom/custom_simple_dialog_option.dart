import 'package:flutter/material.dart';

class CustomSimpleDialogOption extends StatelessWidget {
  final String optionText;
  final String imagePath;
  final GestureTapCallback callback;

  const CustomSimpleDialogOption({
    Key key,
    @required this.optionText,
    @required this.imagePath,
    @required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Material(
        child: InkWell(
          onTap: callback,
          child: Container(
            padding: EdgeInsets.fromLTRB(24, 12, 24, 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.asset(
                  imagePath,
                  width: 35,
                  height: 35,
                ),
                SizedBox(height: 4),
                Text(
                  optionText,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
