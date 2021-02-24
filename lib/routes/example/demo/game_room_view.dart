import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GameRoomView extends StatefulWidget {
  @override
  _GameRoomViewState createState() => _GameRoomViewState();
}

class _GameRoomViewState extends State<GameRoomView> {
  List<String> leftPlayerName = [
    '香水有毒',
    '这搓手游戏',
    '玩家3',
    '幸福在哪里',
    '玩家5',
  ];

  List<String> leftPlayerRank = [
    '倔强青铜',
    '秩序白银',
    '',
    '荣耀黄金',
    '',
  ];

  List<String> leftPlayerLocation = [
    '打野',
    '射手',
    '',
    '全能',
    '',
  ];

  List<String> leftPlayerAvatar = [
    'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=558672251,3310269642&fm=26&gp=0.jpg',
    'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=230804620,1202249826&fm=26&gp=0.jpg',
    '',
    'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3288116592,1148298400&fm=15&gp=0.jpg',
    '',
  ];

  List<String> rightPlayerAvatar = [
    '',
    '',
    'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1957074572,1019634611&fm=26&gp=0.jpg',
    '',
    'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1936183981,1067006181&fm=15&gp=0.jpg',
  ];

  List<String> rightPlayerName = [
    '玩家1',
    '玩家2',
    '拉里拉里',
    '玩家4',
    '莫西莫西',
  ];

  List<String> rightPlayerRank = [
    '',
    '',
    '永恒钻石',
    '',
    '尊贵铂金',
  ];

  List<String> rightPlayerLocation = [
    '',
    '',
    '战士',
    '',
    '全能',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: '游戏房间',
        onPressedBack: ()=> Navigator.pop(context),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Row(
              children: [
                leftRoom(),
                rightRoom(),
              ],
            ),
            Positioned(
              top: 6,
              child: Image.asset(
                'assets/images/image_vs.png',
                width: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget leftRoom() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.fromLTRB(8, 16, 8, 4),
        decoration: BoxDecoration(
          color: Color(0xFF0F1521),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4),
            bottomLeft: Radius.circular(4),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                '蓝色方',
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            SizedBox(height: 20),
            Wrap(
              direction: Axis.vertical,
              children: List<Widget>.generate(
                5,
                (int index) => Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Fluttertoast.showToast(msg: '你选了蓝色方第${index + 1}的位置');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF0E1A26),
                            border: Border.all(
                              color: Color(0xFF143B7C),
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: leftPlayerAvatar[index].isEmpty
                              ? Container(
                                  margin: EdgeInsets.all(7.5),
                                  child: Image.asset(
                                    'assets/icons/icon_room1.png',
                                    width: 35,
                                  ),
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: Image.network(
                                    '${leftPlayerAvatar[index]}',
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${leftPlayerName[index]}',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            '${leftPlayerRank[index]}',
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 11,
                            ),
                          ),
                          SizedBox(height: 4),
                          Wrap(
                            children: List<Widget>.generate(
                              1,
                              (int index2) {
                                return Container(
                                  margin: EdgeInsets.only(right: 4),
                                  padding: EdgeInsets.fromLTRB(4, 1, 4, 1),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFDDA369),
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                  child: Text(
                                    '${leftPlayerLocation[index]}',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 9,
                                    ),
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget rightRoom() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.fromLTRB(8, 16, 8, 4),
        decoration: BoxDecoration(
          color: Color(0xFF1A100F),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(4),
            bottomRight: Radius.circular(4),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Center(
              child: Text(
                '红色方',
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            SizedBox(height: 20),
            Wrap(
              direction: Axis.vertical,
              //alignment: WrapAlignment.end,
              //runAlignment: WrapAlignment.end,
              ///尼玛 弄了半天 没有右对齐的属性在这里！！！！！
              crossAxisAlignment: WrapCrossAlignment.end,
              children: List<Widget>.generate(
                5,
                (int index) => Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Container(
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '${rightPlayerName[index]}',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              '${rightPlayerRank[index]}',
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 11,
                              ),
                            ),
                            SizedBox(height: 4),
                            Wrap(
                              children: List<Widget>.generate(
                                1,
                                (int index2) {
                                  return Container(
                                    margin: EdgeInsets.only(left: 4),
                                    padding: EdgeInsets.fromLTRB(4, 1, 4, 1),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFDDA369),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    child: Text(
                                      '${rightPlayerLocation[index]}',
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 9,
                                      ),
                                    ),
                                  );
                                },
                              ).toList(),
                            ),
                          ],
                        ),
                        SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {
                            Fluttertoast.showToast(
                                msg: '你选了红色方第${index + 1}的位置');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF0E1A26),
                              border: Border.all(
                                color: Color(0xFF6B100F),
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: rightPlayerAvatar[index].isEmpty
                                ? Container(
                                    margin: EdgeInsets.all(7.5),
                                    child: Image.asset(
                                      'assets/icons/icon_room2.png',
                                      width: 35,
                                    ),
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(4),
                                    child: Image.network(
                                      '${rightPlayerAvatar[index]}',
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
