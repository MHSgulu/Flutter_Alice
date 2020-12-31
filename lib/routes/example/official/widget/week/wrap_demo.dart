import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';

///一个小部件，可在多个水平或垂直运行中显示其子级。
///
/// [Wrap]布局每个孩子，并尝试将其放置在主轴上与前一个孩子相邻的位置上（由[direction]指定），在它们之间留出[spacing]间距。
/// 如果没有足够的空间容纳子项，则[Wrap]在横轴上与现有子项相邻创建一个新的_run_。
///
///在所有子项均已分配给游程后，游程中的子项将根据主轴中的[alignment]和交叉轴中的[crossAxisAlignment]进行定位。
///
///然后根据[runSpacing]和[runAlignment]将走线本身定位在横轴上。
///
/// {@youtube 560315 https://www.youtube.com/watch?v=z5iw2SeFx2M}
///
/// 也可以看看：
///
/// * [Row]，它将子级放在一行中，并控制其对齐方式和间距。
/// * [布局小部件目录]（https://flutter.dev/widgets/layout/）。

///创建换行布局。
///
///默认情况下，换行布局是水平的，子进程和行程均与起点对齐。
///
/// [textDirection]参数默认为环境[Directionality]（如果有）。
/// 如果没有环境方向性，并且需要文本方向来决定将孩子放置在哪个方向上或消除主轴或交叉轴方向的“开始”或“结束”值的歧义，则[textDirection]不得为空。

class WrapDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'Wrap',
        onPressedBack: () => Navigator.pop(context),
      ),
      ///此示例呈现了一些[Chip]，它们表示[Wrap]中的四个联系人，以便它们根据需要跨线流动
      body: Wrap(
        spacing: 8.0, // 相邻芯片之间的间隙
        runSpacing: 4.0, //线间距
        children: <Widget>[
          Chip(
            avatar: CircleAvatar(backgroundColor: Colors.blue.shade900, child: Text('AH')),
            label: Text('Hamilton'),
          ),
          Chip(
            avatar: CircleAvatar(backgroundColor: Colors.blue.shade900, child: Text('ML')),
            label: Text('Lafayette'),
          ),
          Chip(
            avatar: CircleAvatar(backgroundColor: Colors.blue.shade900, child: Text('HM')),
            label: Text('Mulligan'),
          ),
          Chip(
            avatar: CircleAvatar(backgroundColor: Colors.blue.shade900, child: Text('JL')),
            label: Text('Laurens'),
          ),
        ],
      ),
    );
  }

}