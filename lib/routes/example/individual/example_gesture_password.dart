import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gesture_password_widget/gesture_password_widget.dart';

const backgroundColor = Color(0xff252534);

class GesturePasswordWidgetDemo extends StatefulWidget {
  @override
  _GesturePasswordWidgetDemoState createState() =>
      _GesturePasswordWidgetDemoState();
}

class _GesturePasswordWidgetDemoState extends State<GesturePasswordWidgetDemo> {
  //String result;
  List<int> result = [];
  List<int> answer = [0,1,2,4,7];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 150.0, bottom: 10.0),
              child: Text(
                '正确答案：0, 1, 2, 4, 7',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              height: 80,
              child: Text(
                '结果：${result ?? ''}',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30.0),
              child: createNormalGesturePasswordView(),
            ),
          ],
        ),
      ),
    );
  }

  /// 一个简单而通用的演示。
  Widget createNormalGesturePasswordView() {
    return GesturePasswordWidget(
      lineColor: const Color(0xff0C6BFE),
      errorLineColor: const Color(0xffFB2E4E),
      singleLineCount: 3,
      identifySize: 80.0,
      minLength: 4,
      errorItem: Image.asset(
        'assets/images/error.png',
        color: const Color(0xffFB2E4E),
      ),
      normalItem: Image.asset('assets/images/normal.png'),
      selectedItem: Image.asset(
        'assets/images/selected.png',
        color: const Color(0xff0C6BFE),
      ),
      arrowItem: Image.asset(
        'assets/images/arrow.png',
        width: 20.0,
        height: 20.0,
        color: const Color(0xff0C6BFE),
        fit: BoxFit.fill,
      ),
      errorArrowItem: Image.asset(
        'assets/images/arrow.png',
        width: 20.0,
        height: 20.0,
        fit: BoxFit.fill,
        color: const Color(0xffFB2E4E),
      ),
      answer: answer,
      color: backgroundColor,
      onComplete: (data) {
        setState(() {
          result = data/*.join(',')*/;
          print('数据点位: result: $result');
          if(result.length == answer.length){
            for(final e in answer){
              if(result.contains(e)){
                Fluttertoast.showToast(msg: '与正确答案一致');
              }else{
                Fluttertoast.showToast(msg: '与正确答案不一致 ');
              }
            }
          }else{
            Fluttertoast.showToast(msg: '与正确答案长度不一致');
          }
        });
      },
    );
  }

  /// 一个复杂的演示。
  /// 一行有四个点，并支持通过设置[hitItem]进行选择的效果。
  Widget createXiMiGesturePasswordView() {
    return GesturePasswordWidget(
      lineColor: Colors.white,
      errorLineColor: Colors.redAccent,
      singleLineCount: 4,
      identifySize: 80.0,
      minLength: 4,
      hitShowMilliseconds: 40,
      errorItem: Container(
        width: 10.0,
        height: 10.0,
        decoration: BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
      normalItem: Container(
        width: 10.0,
        height: 10.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
      selectedItem: Container(
        width: 10.0,
        height: 10.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
      hitItem: Container(
        width: 15.0,
        height: 15.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
      answer: [0, 1, 2, 3, 6, 10, 14],
      color: backgroundColor,
      onComplete: (data) {
        setState(() {
          result = data/*.join(', ')*/;
        });
      },
    );
  }
}
