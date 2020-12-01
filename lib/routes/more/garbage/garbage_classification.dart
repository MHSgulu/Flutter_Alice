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
                  //cursorColor: Colors.blueGrey[600],
                  style: TextStyle(fontSize: 15),
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
                    labelStyle: TextStyle(fontSize: 14),
                    hintText: '请在此处输入垃圾关键词',
                    hintStyle: TextStyle(fontSize: 14),
                    helperText: '点击输入框即可输入',
                    filled: true,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 16, 8, 0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: RaisedButton(
                    onPressed: () => queryClassification(context),
                    child: Text('查询'),
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
      if(json['result']['result']['status'] == 0) {
        entity = garbageCAIEntityFromJson(GarbageCAIEntity(), json);
        Scaffold.of(context).hideCurrentSnackBar();
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('${entity.result.result.garbageInfo[0].cateName}'),
          behavior: SnackBarBehavior.floating,
        ));
      }else if(json['result']['result']['status'] == 4108 && json['result']['result']['message'] == 'No match result'){
        Fluttertoast.showToast(msg: '没有匹配结果');
      }else {
        Fluttertoast.showToast(msg: '${json['result']['result']['message']}');
      }
    }
  }
}
