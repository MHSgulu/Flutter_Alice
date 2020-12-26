import 'package:flutter/material.dart';

class MyFunctionCard extends StatelessWidget {
  final String title;
  final String asset;
  final GestureTapCallback onTap;

  const MyFunctionCard({
    Key key,
    @required this.title,
    @required this.asset,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(4, 6, 4, 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.cyan[50],
        child: ListTile(
          leading: Image.asset(
            asset,
            width: 24,
            height: 24,
          ),
          title: Text(title),
        ),
      ),
    );
  }
}