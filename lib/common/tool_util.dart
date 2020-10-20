import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class ToolUtil{

  ///打开手机自带浏览器启动url网址
 static void launchWebUrl(String url) async {
    if(await canLaunch(url)) {
      await launch(url);
    }else if(url == null){
      Fluttertoast.showToast(msg: '链接地址为空');
    }else {
      Fluttertoast.showToast(msg: '无法启动该网页链接');
    }
  }

  ///存儲文本到剪切板
  static void setTextToClipboard(String content){
    Clipboard.setData(ClipboardData(text: content));
  }


  ///自定义 加载框
 Future<void> _submit(BuildContext context) async{
   showDialog(
     context: context,
     barrierDismissible: false,
     builder: (context){
       return AlertDialog(
         title: Text('正在加载中...'),
         content: Container(
           height: 50,
           child: Center(
             child: CircularProgressIndicator(
               valueColor: AlwaysStoppedAnimation<Color>(Colors.deepOrange),
               strokeWidth: 3,
             ),
           ),
         ),
       );
     },
   );

 }


 ///更新弹窗
 void _showDialog(BuildContext context){
   showDialog(
     context: context,
     builder: (context){
       return AlertDialog(
         title: Text('App版本更新提示'),
         content: Text('检测到当前App非最新版本，请及时升级，点击确定按钮进行更新'),
         actions: <Widget>[
           FlatButton(
               child: Text('取消',style: TextStyle(color: Colors.deepOrange),),
               onPressed: () => Navigator.of(context).pop()  // 关闭对话框
           ),
           FlatButton(
               child: Text('确定',style: TextStyle(color: Colors.deepOrange),),
               onPressed: (){
                 Navigator.of(context).pop();
               } // 关闭对话框
           ),
         ],
       );
     },
   );
 }

 ///List转String  直接toString()会带上方括号[]
 static String listToString(List list) {
   StringBuffer sb = new StringBuffer();
   list.forEach((item) {
     sb.write(' $item ');
   });
   return sb.toString();
 }


 ///判断电影简介的文本是否溢出 (简洁版)
 static bool isFilmIntroductionOverflow(String text, double maxWidth) {
   var textPainter = TextPainter(
     maxLines: 4,
     textAlign: TextAlign.left,
     textDirection: TextDirection.ltr,
     text: TextSpan(
       text: text,
       style: TextStyle(color: Colors.white70),
     ),
   )..layout(maxWidth: maxWidth);

   return textPainter.didExceedMaxLines;
 }

 ///判断用户评论的文本是否溢出 (详细版)
 bool isCommentTextOverflow(String text, double maxWidth) {
   // 生成文本跨度
   var span = TextSpan(
     text: text,
     style: TextStyle(color: Colors.white70),
   );

// 文本绘制器 确定是否超过最大行数
   var tp = TextPainter(
     maxLines: 4,
     textAlign: TextAlign.left,
     textDirection: TextDirection.ltr,
     text: span,
   );

// 触发到布局
   tp.layout(maxWidth: maxWidth);

// 文本是否溢出
   var exceeded = tp.didExceedMaxLines;

   return exceeded;
 }


}