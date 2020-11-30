import 'package:alice/common/network/http_util.dart';
import 'package:alice/generated/json/garbage_c_a_i_entity_helper.dart';
import 'package:alice/model/garbage_c_a_i_entity.dart';
import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GarbageClassification extends StatefulWidget {
  @override
  _GarbageClassificationState createState() => _GarbageClassificationState();
}

class _GarbageClassificationState extends State<GarbageClassification> {
  TextEditingController _controller;
  GarbageCAIEntity entity;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: '垃圾分类',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: Builder(builder: (context) {
        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(8.0),
                child: TextField(
                  controller: _controller,
                  cursorColor: Colors.blueGrey[600],
                  cursorWidth: 2,
                  cursorRadius: Radius.circular(2),
                  style: TextStyle(color: Colors.blueGrey),
                  decoration: InputDecoration(
                    //icon: Icon(Icons.search),  //在输入字段前和装饰外部显示的图标
                    //border: InputBorder.none,
                    prefixIcon: Padding(
                      padding: EdgeInsets.fromLTRB(4, 8, 8, 8),
                      child: Image.asset(
                        'assets/icons/icon_magnifier.png',
                        width: 16,
                        height: 16,
                      ),
                    ),
                    suffixIcon: Padding(
                      padding: EdgeInsets.fromLTRB(0, 8, 8, 8),
                      child: Image.asset(
                        'assets/icons/icon_trash_can.png',
                        width: 16,
                        height: 16,
                      ),
                    ),
                    labelText: '关键词',
                    labelStyle: TextStyle(color: Colors.blueGrey[700]),
                    hintText: '请在此处输入垃圾关键词',
                    hintStyle: TextStyle(color: Colors.black38, fontSize: 14),
                    helperText: '点击输入框即可输入',
                    //helperStyle: TextStyle(color: Colors.black45),
                    filled: true,
                    //fillColor: Colors.blueGrey,
                    //未获得焦点时的下划线
                    enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.blueGrey[200],
                      ),
                    ),
                    //获得焦点时的下划线
                    focusedBorder: UnderlineInputBorder(
                      ///创建一个边界半径，其中所有半径都是[Radius.circular(radius)].
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: BorderSide(
                        width: 2, //边框(此处为下划线)宽度 默认为1.0
                        color: Colors.blueGrey[600], //边框(此处为下划线)颜色，默认为黑色。
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 16, 8, 0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: RaisedButton(
                    onPressed: () => queryClassification(context),
                    child: Text('查询', style: TextStyle(color: Colors.blueGrey)),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  void queryClassification(BuildContext context) async {
    if (_controller.text.trim().isEmpty) {
      Fluttertoast.showToast(msg: '请输入想要分类的垃圾关键词');
    } else {
      var json = await HttpUtil.queryGarbageClassification(_controller.text);
      if (json['result']['result']['status'] == 0) {
        entity = garbageCAIEntityFromJson(GarbageCAIEntity(), json);
        Scaffold.of(context).hideCurrentSnackBar();
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('${entity.result.result.garbageInfo[0].cateName}'),
          behavior: SnackBarBehavior.floating,
        ));
      } else {
        Fluttertoast.showToast(msg: '${json['result']['result']['message']}');
      }
    }
  }
}
