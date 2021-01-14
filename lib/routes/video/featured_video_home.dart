import 'package:alice/widgets/custom/my_fade_in_image.dart';
import 'package:alice/widgets/custom/my_rounded_rectang_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeaturedVideoHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FeaturedVideoHomePageState();
}

class _FeaturedVideoHomePageState extends State<FeaturedVideoHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent[100],
        title: Text(
          '今日开眼精选',
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(bottom: 20),
        itemCount: 8,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.fromLTRB(8, 16, 8, 0),
            child: Column(
              children: [
                MyRRectCard(
                  elevation: 0.5,
                  child: Stack(
                    children: [
                      MyFadeInImage(
                        imageUrl:
                            'https://icweiliimg6.pstatp.com/weili/l/919795258271596547.webp',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 6),
                Row(
                  children: [
                    ClipOval(
                      child: MyFadeInImage(
                        width: 45,
                        height: 45,
                        imageUrl: 'https://icweiliimg6.pstatp.com/weili/l/919795258271596547.webp',
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '这是标题啊这是标题啊这是标题啊这是标题啊这是标题啊这是标题啊这是标题啊',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            '这是小标题啊',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
