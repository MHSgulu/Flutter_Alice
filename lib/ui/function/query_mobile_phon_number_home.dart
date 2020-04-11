import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


/*查询手机号码归属地*/
class QueryMobilePhoneNumberHomeView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[400],
        title: Text('查询手机号码归属地'),
      ),
      ///此处设置滚动视图，防止点击输入框弹出软键盘遮挡页面底部的视图，而且也给出像素溢出提示。
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(8.0),
              child: TextField(
                //autofocus: true,  //是否自动获取焦点 默认false
                cursorColor: Colors.blueGrey[600],  //光标颜色
                cursorWidth: 2,                    //光标宽度
                cursorRadius: Radius.circular(2),  //光标圆角
                style: TextStyle(color: Colors.blueGrey),
                maxLength: 11,  //代表输入框文本的最大长度，设置后输入框右下角会显示输入的文本计数
                ///用于设置该输入框默认的键盘输入类型
                keyboardType:  TextInputType.phone,    //优化后的电话号码输入键盘；会弹出数字键盘并显示“* #”   //TextInputType.numberWithOptions(),  数字；会弹出数字键盘
                decoration: InputDecoration(
                  //icon: Icon(Icons.search),  //在输入字段前和装饰外部显示的图标
                  ///隐藏下划线
                  //border: InputBorder.none,
                  ///一旦设置Icon的初始颜色后，失去点击编辑框改变颜色的效果
                  prefixIcon: Icon(Icons.search,color: Colors.blueGrey),  //在输入之前放置在行上的可选小部件。
                  suffixIcon: Icon(Icons.phone_iphone),  //在输入后放置在行上的可选小部件。
                  labelText: '手机号码',    //动态小字体提示文本
                  labelStyle: TextStyle(color: Colors.blueGrey[700]),  //动态小字体提示文本样式风格
                  hintText: '请在此处输入号码',  //输入框内部提示文本
                  hintStyle: TextStyle(color: Colors.black38),  //输入框内部提示文本样式风格
                  helperText: '点击两边图标或输入框内即可输入手机号码',  //输入框底部提示帮助文本
                  helperStyle: TextStyle(color: Colors.black45),  //输入框底部提示文本样式风格
                  counterStyle: TextStyle(color: Colors.black45),  //计数器小部件文本样式  如果为空，则默认为[helperStyle]。
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
              margin: EdgeInsets.fromLTRB(0,16,8,0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: RaisedButton(
                  onPressed: (){

                  },
                  child: Text('查询',style: TextStyle(color: Colors.blueGrey)),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(16,56,16,0),
              child: Card(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(8.0),
                      child:Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 8.0),
                            child: Icon(Icons.phone_android,color: Colors.blueGrey),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 16.0),
                            child:  Text('手机号:',style: TextStyle(color: Colors.blueGrey)),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 8.0),
                            child:  Text('12345678901',style: TextStyle(color: Colors.blueGrey[700])),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(8.0),
                      child:Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 8.0),
                            child: Icon(Icons.home,color: Colors.blueGrey),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 16.0),
                            child:  Text('归属地:',style: TextStyle(color: Colors.blueGrey)),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 8.0),
                            child:  Text('西部世界',style: TextStyle(color: Colors.blueGrey[700])),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(8.0),
                      child:Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 8.0),
                            child: Icon(Icons.language,color: Colors.blueGrey),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 16.0),
                            child:  Text('运营商:',style: TextStyle(color: Colors.blueGrey)),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 8.0),
                            child:  Text('动视科技',style: TextStyle(color: Colors.blueGrey[700])),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(8.0),
                      child:Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 8.0),
                            child: Icon(Icons.sim_card,color: Colors.blueGrey),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 16.0),
                            child:  Text('卡类型:',style: TextStyle(color: Colors.blueGrey)),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 8.0),
                            child:  Text('宇宙通',style: TextStyle(color: Colors.blueGrey[700])),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(8.0),
                      child:Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 8.0),
                            child: Icon(Icons.location_on,color: Colors.blueGrey),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 16.0),
                            child:  Text('区域号:',style: TextStyle(color: Colors.blueGrey)),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 8.0),
                            child:  Text('8868',style: TextStyle(color: Colors.blueGrey[700])),
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
      ),
    );
  }

}