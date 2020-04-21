import 'package:alice/ui/news/search_news_list_screen.dart';
import 'package:flutter/material.dart';




class SearchNewsScreen extends StatefulWidget{

  final String keyword;

  SearchNewsScreen({Key key, this.keyword}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SearchNewsScreenState();
  }

}

class SearchNewsScreenState extends State<SearchNewsScreen> {

  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller =  widget.keyword == '' ? TextEditingController() : TextEditingController(text: widget.keyword);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[200],
        title: Text('搜你想看的新闻'),
      ),
      body: Builder(
          builder: (context){
            return  SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _controller,
                        //autofocus: true,
                        cursorColor: Colors.blueAccent[200],
                        cursorWidth: 2,
                        cursorRadius: Radius.circular(2),
                        style: TextStyle(color: Colors.blueAccent[200]),
                        maxLength: 8,
                        keyboardType:  TextInputType.text,
                        decoration: InputDecoration(
                          //此属性仅在[errorBorder]，[FocusedOrder]、[FocusedRorBorder]、[DisabledOrder]或[EnabledOrder]中的适当一个时使用
                          //未指定时，此边框的[InputBorder.borderSide]属性是由InputDecorator配置，具体取决于[InputDecoration.errorText]，[InputDecoration.enabled]，[InputDecorator.isFocused]和当前的[主题]。
                          //通常是[UnderlineInputBorder]或[OutlineInputBorder]之一。
                          //如果为空，则InputDecorator的默认值为“const UnderlineInputBorder（）”。
                          //[InputBorder.none]，它不绘制边框。[UnderlineInputBorder]，它在输入装饰器容器的底部。[OutlineInputBorder]，一个[InputDecorator]边框，用于绘制输入装饰器容器周围的圆形矩形。
                          border: OutlineInputBorder(
                            ///边框
                            //borderSide: BorderSide(),
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),  //边框圆角的半径。 拐角半径必须是圆形的，即它们的[半径x]和[半径y]值必须相同。默认4.0
                            gapPadding: 5.0,  //边框两边的水平填充与[labelText]的宽度间隔。 默认4.0
                          ),
                          labelText: '关键词',
                          labelStyle: TextStyle(color: Colors.blueAccent[200]),
                          hintText: '请在此处输入关键词',
                          hintStyle: TextStyle(color: Colors.black38),
                          helperText: '关键词长度尽量控制在提示字符长度以内',
                          helperStyle: TextStyle(color: Colors.black45),
                          counterStyle: TextStyle(color: Colors.black45),
                          //filled: true,  ///如果为真，则装饰的容器中会填充[fillColor]的颜色。默认情况下，此属性为false。
                          //未获得焦点时的下划线
                          /*enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.blueAccent[200],
                          ),
                        ),*/
                          //获得焦点时的下划线
                          /*focusedBorder: UnderlineInputBorder(
                          ///创建一个边界半径，其中所有半径都是[Radius.circular(radius)].
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: BorderSide(
                            width: 2, //边框(此处为下划线)宽度 默认为1.0
                            color: Colors.blueAccent[200], //边框(此处为下划线)颜色，默认为黑色。
                          ),
                        ),*/
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0,16,8,0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: RaisedButton(
                          onPressed: (){
                            if(_controller.text.trim() == ''){
                              Scaffold.of(context).hideCurrentSnackBar();
                              Scaffold.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('关键词不能为空'),
                                    behavior: SnackBarBehavior.floating,
                                    duration: Duration(seconds: 2),
                                  )
                              );
                            }
                            if(_controller.text.length > 8){
                              Scaffold.of(context).hideCurrentSnackBar();
                              Scaffold.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('关键词长度超出限制，请删减'),
                                    behavior: SnackBarBehavior.floating,
                                    duration: Duration(seconds: 2),
                                  )
                              );
                            }
                            else{
                              print(_controller.text);
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SearchNewsListScreen(keyword: _controller.text)));
                            }
                          },
                          child: Text('搜索',style: TextStyle(color: Colors.blueAccent[200])),
                        ),
                      ),
                    ),
                  ],
                )
            );
          }
      )
    );
  }

}