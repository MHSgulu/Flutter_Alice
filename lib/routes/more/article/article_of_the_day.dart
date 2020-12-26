import 'package:alice/common/network/http_util.dart';
import 'package:alice/model/article_entity.dart';
import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:alice/widgets/custom/my_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ArticleOfTheDayRoute extends StatefulWidget {
  @override
  _ArticleOfTheDayRouteState createState() => _ArticleOfTheDayRouteState();
}

class _ArticleOfTheDayRouteState extends State<ArticleOfTheDayRoute> {
  ArticleEntity entity;
  bool isDataReady = false;
  ScrollController controller;

  @override
  void initState() {
    controller = ScrollController();
    fetchData();
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: '每日一文',
        onPressedBack: () => Navigator.pop(context),
        actions: [
          TextButton(
            onPressed: () => fetchRandomArticle(),
            child: Text(
              '随机文章',
              style: TextStyle(fontSize: 13.5),
            ),
          ),
        ],
      ),
      body: isDataReady ? articleView() : MyLoadingIndicator(),
    );
  }

  Widget articleView() {
    return SingleChildScrollView(
      controller: controller,
      padding: EdgeInsets.fromLTRB(4, 16, 4, 24),
      child: Column(
        children: [
          Text(
            '${entity.data.title}',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 8),
          Text('${entity.data.author}'),
          SizedBox(height: 8),
          Html(data: '${entity.data.content}'),
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('${entity.data.date.curr}',style: TextStyle(fontSize: 13),),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void fetchData() async {
    var result = await HttpUtil.requestArticleOfTheDay();
    if (result is Exception) {
      Exception exception = result as Exception;
      Fluttertoast.showToast(msg: 'error: $exception');
    } else {
      entity = result;
      if (mounted) {
        setState(() {
          isDataReady = true;
        });
      }
    }
  }

  void fetchRandomArticle() async {
    var result = await HttpUtil.requestRandomArticle();
    if (result is Exception) {
      Exception exception = result as Exception;
      Fluttertoast.showToast(msg: 'error: $exception');
    } else {
      if (mounted) {
        setState(() {
          entity = result;
        });
      }
      /// scrollController 通过 animateTo 方法滚动到某个具体高度
      controller.animateTo(
        0.0, //顶部
        duration: Duration(milliseconds: 500),
        curve: Curves.decelerate,
      );
    }
  }
}
