import 'package:alice/widgets/custom/my_fade_in_image.dart';
import 'package:alice/widgets/custom/my_rounded_rectang_card.dart';
import 'package:alice/widgets/photo_view_gallry.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MovieStillInfoWidget extends StatefulWidget {
  final Color valueColor;

  const MovieStillInfoWidget({
    Key key,
    @required this.valueColor,
  }) : super(key: key);

  @override
  _MovieStillInfoWidgetState createState() => _MovieStillInfoWidgetState();
}

class _MovieStillInfoWidgetState extends State<MovieStillInfoWidget> {
  List<String> myMovieStillList = List();

  @override
  void initState() {
    myMovieStillList = [
      'https://icweiliimg6.pstatp.com/weili/l/919795258271596547.webp', //插画
      'https://icweiliimg1.pstatp.com/weili/l/913146374019088384.webp', //红色机器人独自站在机械墓地的奇幻风景
      'https://icweiliimg1.pstatp.com/weili/l/903658980241571862.webp', //在地狱中用他的魔法漂浮的死亡数字艺术风格
      'https://icweiliimg9.pstatp.com/weili/l/903733240221532175.webp', //年轻女子为魔法树弹吉他，星轨和天空中的月亮，数字艺术风格
      'https://weiliicimg6.pstatp.com/weili/l/903097215699910793.webp', //戴着虚拟现实耳机的男人触摸自己的粒子
      'https://icweiliimg1.pstatp.com/weili/l/903431965445586961.webp', //男子手持红烟信号弹腾空而起，与天启世界对峙，数码艺术风格
      'https://weiliicimg6.pstatp.com/weili/l/919779495736508463.webp', //巫师工作人员用他的魔法点燃灯塔的人
      'https://icweiliimg1.pstatp.com/weili/l/903487834380173423.webp', //站在通往天空的破楼梯上的年轻女子，数字艺术风格
      'https://weiliicimg6.pstatp.com/weili/l/912724883108921353.webp', //破楼飞鸟的超现实场景光
      'https://icweiliimg1.pstatp.com/weili/l/903129256155938931.webp', //太空中的奇幻桥段3D渲染
      'https://icweiliimg9.pstatp.com/weili/l/919798058585161797.webp', //科幻神奇的景观
      'https://icweiliimg1.pstatp.com/weili/l/919767315209257008.webp', //魔法师与龙
      'https://icweiliimg9.pstatp.com/weili/l/900993824183025685.webp', //科幻概念，展示一个站在未来主义门户的男人，数字艺术风格
      'https://icweiliimg6.pstatp.com/weili/l/903299654683066410.webp', //有大气层和月球的太阳系外行星
      'https://icweiliimg1.pstatp.com/weili/l/915011343308685373.webp', //幻想之地城堡的抽象数字插图
      'https://icweiliimg6.pstatp.com/weili/l/904638653692641357.webp', //3d渲染空间艺术：外星星球-奇幻景观
      'https://weiliicimg1.pstatp.com/weili/l/919853987649290287.webp', //酷炫的三角形未来主义科幻技术灯
      'https://icweiliimg1.pstatp.com/weili/l/903744905357295642.webp', //站在银河裂缝中间的抽象独特的年轻女人
      'https://weiliicimg9.pstatp.com/weili/l/919768062538678320.webp', //黑色独角兽上的未来主义骑士进入破碎的门户到另一个世界
      'https://icweiliimg1.pstatp.com/weili/l/903686210335015059.webp', //世界崩溃，末日场景，数码绘画
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(8, 16, 8, 8),
          child: Row(
            children: <Widget>[
              Text(
                '剧照',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              Expanded(
                child: Container(),
              ),
              GestureDetector(
                onTap: () {
                  Fluttertoast.showToast(msg: '全部');
                },
                child: Row(
                  children: <Widget>[
                    Text(
                      '全部',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white60,
                      ),
                    ),
                    SizedBox(width: 4),
                    Text(
                      '${myMovieStillList.length}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white60,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white60,
                      size: 12,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 160,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: myMovieStillList.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => PhotoGalleryView(
                                imageList: myMovieStillList,
                                index: index,
                                heroTag: 'still:$index',
                              ))),
                child: Hero(
                  tag: 'still:$index',
                  child: MyRRectCard(
                    child: MyFadeInImage(
                      imageUrl: myMovieStillList[index],
                      width: 200,
                      height: 150,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
