import 'package:flutter/material.dart';

class HttpErrorView extends StatelessWidget {
  final String errorText;

  const HttpErrorView({Key key, this.errorText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/image_http_500_1.png',
            height: 200,
          ),
          SizedBox(height: 20),
          Text(
            errorText ?? '服务器响应失败',
            style: TextStyle(
              color: Colors.red,
              fontSize: 13,
              //fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
