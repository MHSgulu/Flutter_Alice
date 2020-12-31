import 'package:alice/routes/example/official/widget/week/animated_container_demo.dart';
import 'package:alice/routes/example/official/widget/week/expanded_demo.dart';
import 'package:alice/routes/example/official/widget/week/flexible_demo.dart';
import 'package:alice/routes/example/official/widget/week/futurebuilder_demo.dart';
import 'package:alice/routes/example/official/widget/week/opacity_demo.dart';
import 'package:alice/routes/example/official/widget/week/safe_area_demo.dart';
import 'package:alice/routes/example/official/widget/week/wrap_demo.dart';
import 'package:alice/widgets/custom/custom_scroll_behavior.dart';
import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';


class GuideWeekWidgetRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: '每周Flutter小部件',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: ScrollConfiguration(
        behavior: CustomScrollBehavior(),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: InkWell(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SafeAreaDemo())),
                    child: ListTile(
                      title: Text('SafeArea(安全区)'),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: InkWell(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ExpandedDemo())),
                    child: ListTile(
                      title: Text('Expanded(展开式)'),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: InkWell(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => FlexibleDemo())),
                    child: ListTile(
                      title: Text('Flexible(灵活)'),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: InkWell(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => WrapDemo())),
                    child: ListTile(
                      title: Text('Wrap(包)'),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: InkWell(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AnimatedContainerDemo())),
                    child: ListTile(
                      title: Text('AnimatedContainer(动画容器)'),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: InkWell(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => OpacityDemo())),
                    child: ListTile(
                      title: Text('Opacity(不透明度)'),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: InkWell(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => FutureBuilderDemo())),
                    child: ListTile(
                      title: Text('FutureBuilder(未来建设者)'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
