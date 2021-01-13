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
      Fluttertoast.showToast(msg: '地址为空');
    }else {
      Fluttertoast.showToast(msg: '无法启动该网页链接');
    }
  }

  ///存儲文本到剪切板
  static void setTextToClipboard(String content){
    Clipboard.setData(ClipboardData(text: content));
  }


 ///List转String  直接toString()会带上方括号[]
 static String listToString(List list) {
   StringBuffer sb = new StringBuffer();
   list.forEach((item) {
     sb.write(' $item ');
   });
   return sb.toString();
 }

 ///String转List
 static List stringToList(String string) {
   return string.split(' / ');
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