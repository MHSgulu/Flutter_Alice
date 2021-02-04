import 'package:alice/widgets/custom/my_fade_in_image.dart';
import 'package:alice/widgets/custom/my_rounded_rectang_card.dart';
import 'package:flutter/material.dart';

class MovieBasicInfoWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        MyRRectCard(
          child: MyFadeInImage(
              imageUrl: 'https://icweiliimg1.pstatp.com/weili/l/902997606818381932.jpg',
              width: 110, //1
              height: 165, //1.5
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.fromLTRB(8, 4, 0, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '即使能够进入梦境世界，但还是无法找到Alice',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Even if I can enter the dream world, I still can’t find Alice',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '类型: 剧情 / 科幻 / 奇幻 / 动作 / 爱情',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white70,
                  ),
                ),
                Text(
                  '上映: 2033-2-29',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white70,
                  ),
                ),
                Text(
                  '片长: 未知 分钟',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

}