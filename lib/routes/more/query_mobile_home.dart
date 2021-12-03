import 'package:alice/common/network/http_util.dart';
import 'package:alice/model/mobie_phone_entity.dart';
import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:alice/widgets/custom/my_loading_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class QueryMobileHome extends StatefulWidget {
  @override
  QueryMobileHomeState createState() =>
      QueryMobileHomeState();
}

class QueryMobileHomeState
    extends State<QueryMobileHome> {
  TextEditingController _controller;
  Future<MobiePhoneEntity> _futureMobilePhoneEntity;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: '查询手机号码归属地',
        onPressedBack: () => Navigator.pop(context),
      ),
      ///当BuildContext在Scaffold之前时，调用Scaffold.of(context)会报错。这时可以通过Builder Widget来解决
      body: Builder(builder: (context) {
        return (_futureMobilePhoneEntity == null)
            ? SingleChildScrollView(
                ///此处设置滚动视图，防止点击输入框弹出软键盘遮挡页面底部的视图，而且也给出像素溢出提示
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _controller,
                        //autofocus: true,  //是否自动获取焦点 默认false
                        cursorColor: Colors.blueGrey[600], //光标颜色
                        cursorWidth: 2, //光标宽度
                        cursorRadius: Radius.circular(2), //光标圆角
                        style: TextStyle(color: Colors.blueGrey),
                        maxLength: 11, //代表输入框文本的最大长度，设置后输入框右下角会显示输入的文本计数
                        ///用于设置该输入框默认的键盘输入类型
                        //text	文本输入键盘
                        //multiline	多行文本，需和maxLines配合使用(设为null或大于1)
                        //number	数字；会弹出数字键盘
                        //phone	优化后的电话号码输入键盘；会弹出数字键盘并显示“* #”
                        //datetime	优化后的日期输入键盘；Android上会显示“: -”
                        //emailAddress	优化后的电子邮件地址；会显示“@ .”
                        //url	优化后的url输入键盘； 会显示“/ .”
                        keyboardType: TextInputType
                            .phone, //优化后的电话号码输入键盘；会弹出数字键盘并显示“* #”   //TextInputType.numberWithOptions(),  数字；会弹出数字键盘
                        decoration: InputDecoration(
                          //icon: Icon(Icons.search),  //在输入字段前和装饰外部显示的图标
                          ///隐藏下划线
                          //border: InputBorder.none,
                          ///可选的文本前缀，用于放置在输入之前的行上。使用[prefixStyle]。 如果未指定[prefixStyle]，则使用[hintStyle]。前缀文本不会作为用户输入的一部分返回。
                          ///如果需要更详细的前缀，请考虑改用[prefix]。只能指定[prefix]和[prefixText]之一。如果同时指定了[prefixText]，则[prefixText]出现在[prefixIcon]之后。
                          //prefixText: '输入框时前的文字',
                          ///一旦设置Icon的初始颜色后，失去点击编辑框改变颜色的效果
                          prefixIcon: Icon(Icons.search,
                              color: Colors.blueGrey), //在输入之前放置在行上的可选小部件。
                          suffixIcon:
                              Icon(Icons.phone_iphone), //在输入后放置在行上的可选小部件。
                          labelText: '手机号码', //动态小字体提示文本
                          labelStyle: TextStyle(
                              color: Colors.blueGrey[700]), //动态小字体提示文本样式风格
                          hintText: '请在此处输入号码', //输入框内部提示文本
                          hintStyle:
                              TextStyle(color: Colors.black38), //输入框内部提示文本样式风格
                          helperText: '点击手机图标或输入框内即可输入手机号码', //输入框底部提示帮助文本
                          helperStyle:
                              TextStyle(color: Colors.black45), //输入框底部提示文本样式风格
                          counterStyle: TextStyle(
                              color: Colors
                                  .black45), //计数器小部件文本样式  如果为空，则默认为[helperStyle]。
                          ///如果为真，则装饰的容器中会填充[fillColor]。默认情况下，此属性为false。
                          filled: true,

                          ///装饰的容器填充颜色 默认情况下，fillColor基于当前的[Theme]。
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
                          //focusColor: Colors.red,
                          //hoverColor: Colors.blueGrey,
                          //isDense: true,
                          //contentPadding: EdgeInsets.all(8),    //编辑框所有本文内容 填充 即文本与编辑框拉开距离
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 16, 8, 0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_controller.text.trim() == '') {
                              ScaffoldMessenger.of(context).hideCurrentSnackBar();
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('查询的手机号码不能为空'),
                                //backgroundColor: Colors.transparent,  ///SnackBar的背景色
                                //elevation: 10.0, //阴影大小默认值为6.0。
                                //shape: ShapeBorder(),
                                behavior: SnackBarBehavior.floating,

                                ///这定义了SnackBar的行为和位置 它使用[圆角矩形边框]圆角半径为4.0。 默认//[SnackBarBehavior.fixed]未指定重写形状，因此是矩形的
                                duration: Duration(seconds: 2),

                                ///SnackBar显示的时间量，默认4秒  设置为2秒 参数int类型
                                action: SnackBarAction(
                                  ///SnackBar最多只能有一个动作
                                  label: '',
                                  onPressed: () {},
                                ),
                              ));
                            } else {
                              print(_controller.text);
                              setState(() {
                                //_futureMobilePhoneEntity = HttpUtil.query(_controller.text);
                              });
                            }
                          },
                          child: Text('查询',
                              style: TextStyle(color: Colors.blueGrey)),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(16, 56, 16, 0),
                      child: Card(
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.all(8.0),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(left: 8.0),
                                    child: Icon(Icons.phone_android,
                                        color: Colors.blueGrey),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 16.0),
                                    child: Text('手机号:',
                                        style:
                                            TextStyle(color: Colors.blueGrey)),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 8.0),
                                    child: Text('',
                                        style: TextStyle(
                                            color: Colors.blueGrey[700])),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(8.0),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(left: 8.0),
                                    child: Icon(Icons.home,
                                        color: Colors.blueGrey),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 16.0),
                                    child: Text('归属地:',
                                        style:
                                            TextStyle(color: Colors.blueGrey)),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 8.0),
                                    child: Text('',
                                        style: TextStyle(
                                            color: Colors.blueGrey[700])),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(8.0),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(left: 8.0),
                                    child: Icon(Icons.language,
                                        color: Colors.blueGrey),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 16.0),
                                    child: Text('运营商:',
                                        style:
                                            TextStyle(color: Colors.blueGrey)),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 8.0),
                                    child: Text('',
                                        style: TextStyle(
                                            color: Colors.blueGrey[700])),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(8.0),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(left: 8.0),
                                    child: Icon(Icons.sim_card,
                                        color: Colors.blueGrey),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 16.0),
                                    child: Text('卡类型:',
                                        style:
                                            TextStyle(color: Colors.blueGrey)),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 8.0),
                                    child: Text('',
                                        style: TextStyle(
                                            color: Colors.blueGrey[700])),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(8.0),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(left: 8.0),
                                    child: Icon(Icons.location_on,
                                        color: Colors.blueGrey),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 16.0),
                                    child: Text('区域号:',
                                        style:
                                            TextStyle(color: Colors.blueGrey)),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 8.0),
                                    child: Text('',
                                        style: TextStyle(
                                            color: Colors.blueGrey[700])),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : FutureBuilder<MobiePhoneEntity>(
                future: _futureMobilePhoneEntity,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(8.0),
                            child: TextField(
                              controller: _controller,
                              //autofocus: true,  //是否自动获取焦点 默认false
                              cursorColor: Colors.blueGrey[600], //光标颜色
                              cursorWidth: 2, //光标宽度
                              cursorRadius: Radius.circular(2), //光标圆角
                              style: TextStyle(color: Colors.blueGrey),
                              maxLength: 11, //代表输入框文本的最大长度，设置后输入框右下角会显示输入的文本计数
                              ///用于设置该输入框默认的键盘输入类型
                              keyboardType: TextInputType
                                  .phone, //优化后的电话号码输入键盘；会弹出数字键盘并显示“* #”   //TextInputType.numberWithOptions(),  数字；会弹出数字键盘
                              decoration: InputDecoration(
                                //icon: Icon(Icons.search),  //在输入字段前和装饰外部显示的图标
                                ///隐藏下划线
                                //border: InputBorder.none,
                                ///一旦设置Icon的初始颜色后，失去点击编辑框改变颜色的效果
                                prefixIcon: Icon(Icons.search,
                                    color: Colors.blueGrey), //在输入之前放置在行上的可选小部件。
                                suffixIcon:
                                    Icon(Icons.phone_iphone), //在输入后放置在行上的可选小部件。
                                labelText: '手机号码', //动态小字体提示文本
                                labelStyle: TextStyle(
                                    color:
                                        Colors.blueGrey[700]), //动态小字体提示文本样式风格
                                hintText: '请在此处输入号码', //输入框内部提示文本
                                hintStyle: TextStyle(
                                    color: Colors.black38), //输入框内部提示文本样式风格
                                helperText: '点击手机图标或输入框内即可输入手机号码', //输入框底部提示帮助文本
                                helperStyle: TextStyle(
                                    color: Colors.black45), //输入框底部提示文本样式风格
                                counterStyle: TextStyle(
                                    color: Colors
                                        .black45), //计数器小部件文本样式  如果为空，则默认为[helperStyle]。
                                ///如果为真，则装饰的容器中会填充[fillColor]。默认情况下，此属性为false。
                                filled: true,

                                ///装饰的容器填充颜色 默认情况下，fillColor基于当前的[Theme]。
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
                                    color: Colors
                                        .blueGrey[600], //边框(此处为下划线)颜色，默认为黑色。
                                  ),
                                ),
                                //focusColor: Colors.red,
                                //hoverColor: Colors.blueGrey,
                                //isDense: true,
                                //contentPadding: EdgeInsets.all(8),    //编辑框所有本文内容 填充 即文本与编辑框拉开距离
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 16, 8, 0),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_controller.text.trim() == '') {
                                    Fluttertoast.showToast(msg: '手机号码不能为空');
                                  } else {
                                    print(_controller.text);
                                    setState(() {
                                      //_futureMobilePhoneEntity = HttpUtil.query(_controller.text);
                                    });
                                  }
                                },
                                child: Text('查询', style: TextStyle(color: Colors.blueGrey)),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(16, 56, 16, 0),
                            child: Card(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.all(8.0),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(left: 8.0),
                                          child: Icon(Icons.phone_android,
                                              color: Colors.blueGrey),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 16.0),
                                          child: Text('手机号:',
                                              style: TextStyle(
                                                  color: Colors.blueGrey)),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 8.0),
                                          child: Text(
                                              snapshot
                                                  .data.result.result.shouji,
                                              style: TextStyle(
                                                  color: Colors.blueGrey[700])),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(8.0),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(left: 8.0),
                                          child: Icon(Icons.home,
                                              color: Colors.blueGrey),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 16.0),
                                          child: Text('归属地:',
                                              style: TextStyle(
                                                  color: Colors.blueGrey)),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 8.0),
                                          child: Text(
                                              snapshot
                                                  .data.result.result.province,
                                              style: TextStyle(
                                                  color: Colors.blueGrey[700])),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(8.0),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(left: 8.0),
                                          child: Icon(Icons.language,
                                              color: Colors.blueGrey),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 16.0),
                                          child: Text('运营商:',
                                              style: TextStyle(
                                                  color: Colors.blueGrey)),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 8.0),
                                          child: Text(
                                              snapshot
                                                  .data.result.result.company,
                                              style: TextStyle(
                                                  color: Colors.blueGrey[700])),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(8.0),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(left: 8.0),
                                          child: Icon(Icons.sim_card,
                                              color: Colors.blueGrey),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 16.0),
                                          child: Text('卡类型:',
                                              style: TextStyle(
                                                  color: Colors.blueGrey)),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 8.0),

                                          ///必须为文本小部件提供非空字符串。
                                          child: Text(
                                            snapshot.data.result.result
                                                        .cardtype ==
                                                    null
                                                ? '未查出该卡类型'
                                                : snapshot.data.result.result
                                                    .cardtype,
                                            style: TextStyle(
                                                color: Colors.blueGrey[700]),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(8.0),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(left: 8.0),
                                          child: Icon(Icons.location_on,
                                              color: Colors.blueGrey),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 16.0),
                                          child: Text('区域号:',
                                              style: TextStyle(
                                                  color: Colors.blueGrey)),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 8.0),
                                          child: Text(
                                              snapshot
                                                  .data.result.result.areacode,
                                              style: TextStyle(
                                                  color: Colors.blueGrey[700])),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text("${snapshot.error}"),
                    );
                  }
                  return MyLoadingIndicator(
                    valueColor: Colors.blueGrey[400],
                    strokeWidth: 3,
                  );
                },
              );
      }),
    );
  }
}
