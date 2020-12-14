import 'package:alice/routes/components/dynamic/container_conversion.dart';
import 'package:alice/routes/components/dynamic/fade_in.dart';
import 'package:alice/routes/components/dynamic/fade_in_after_fade_out.dart';
import 'package:alice/routes/components/dynamic/shared_x_axis.dart';
import 'package:alice/routes/components/dynamic/shared_y_axis.dart';
import 'package:alice/routes/components/dynamic/shared_z_axis.dart';
import 'package:alice/widgets/custom/custom_scroll_behavior.dart';
import 'package:alice/widgets/custom/my_appbar.dart';

import 'package:flutter/material.dart';

class GuideDynamicEffectRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GuideDynamicEffectRouteRouteState();
}

class _GuideDynamicEffectRouteRouteState extends State<GuideDynamicEffectRoute> {
  List<String> titleList = [
    '容器转换',
    '共用X轴',
    '共用Y轴',
    '共用Z轴',
    '淡出后淡入',
    '淡入',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'Widget',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: ScrollConfiguration(
        behavior: CustomScrollBehavior(),
        child: ListView.builder(
          itemCount: titleList.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(4),
                ),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () => jumpToRoute(index),
                  //splashColor: Colors.indigo[100],
                  child: ListTile(
                    title: Text(titleList[index]),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void jumpToRoute(int index) {
    switch (index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (_) => OpenContainerTransformDemo()));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (_) => SharedXAxisTransitionDemo()));
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (_) => SharedYAxisTransitionDemo()));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (_) => SharedZAxisTransitionDemo()));
        break;
      case 4:
        Navigator.push(context, MaterialPageRoute(builder: (_) => FadeThroughTransitionDemo()));
        break;
      case 5:
        Navigator.push(context, MaterialPageRoute(builder: (_) => FadeScaleTransitionDemo()));
        break;
    }
  }
}
