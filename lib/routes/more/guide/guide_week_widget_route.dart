import 'package:alice/routes/example/official/widget/week/animated_container_demo.dart';
import 'package:alice/routes/example/official/widget/week/expanded_demo.dart';
import 'package:alice/routes/example/official/widget/week/cliprect_demo.dart';
import 'package:alice/routes/example/official/widget/week/fade_transition_demo.dart';
import 'package:alice/routes/example/official/widget/week/fadeinimage_demo.dart';
import 'package:alice/routes/example/official/widget/week/flexible_demo.dart';
import 'package:alice/routes/example/official/widget/week/futurebuilder_demo.dart';
import 'package:alice/routes/example/official/widget/week/inheritedmodel_demo.dart';
import 'package:alice/routes/example/official/widget/week/opacity_demo.dart';
import 'package:alice/routes/example/official/widget/week/page_view_demo.dart';
import 'package:alice/routes/example/official/widget/week/safe_area_demo.dart';
import 'package:alice/routes/example/official/widget/week/sliver_list_demo.dart';
import 'package:alice/routes/example/official/widget/week/sliverappbar_demo.dart';
import 'package:alice/routes/example/official/widget/week/streambuilder_demo.dart';
import 'package:alice/routes/example/official/widget/week/table_demo.dart';
import 'package:alice/routes/example/official/widget/week/wrap_demo.dart';
import 'package:alice/routes/example/official/widget/week/hero_demo.dart';
import 'package:alice/widgets/custom/custom_scroll_behavior.dart';
import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:alice/widgets/custom/my_list_tile_card.dart';
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
                MyCardTile(
                  text: 'SafeArea',
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SafeAreaDemo())),
                ),
                MyCardTile(
                  text: 'Expanded',
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ExpandedDemo())),
                ),
                MyCardTile(
                  text: 'Flexible',
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => FlexibleDemo())),
                ),
                MyCardTile(
                  text: 'Wrap',
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => WrapDemo())),
                ),
                MyCardTile(
                  text: 'AnimatedContainer',
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AnimatedContainerDemo())),
                ),
                MyCardTile(
                  text: 'Opacity',
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => OpacityDemo())),
                ),
                MyCardTile(
                  text: 'FutureBuilder',
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => FutureBuilderDemo())),
                ),
                MyCardTile(
                  text: 'FadeTransition',
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => FadeTransitionDemo())),
                ),
                MyCardTile(
                  text: 'PageView',
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => PageViewDemo())),
                ),
                MyCardTile(
                  text: 'Table',
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => TableDemo())),
                ),
                MyCardTile(
                  text: 'SliverAppBar',
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SliverAppBarDemo())),
                ),
                MyCardTile(
                  text: 'SliverList＆SliverGrid',
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SliverListDemo())),
                ),
                MyCardTile(
                  text: 'FadeInImage',
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => FadeInImageDemo())),
                ),
                MyCardTile(
                  text: 'FadeInImage',
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => FadeInImageDemo())),
                ),
                MyCardTile(
                  text: 'StreamBuilder',
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => StreamBuilderDemo())),
                ),
                MyCardTile(
                  text: 'InheritedModel',
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => InheritedModelDemo())),
                ),
                MyCardTile(
                  text: 'ClipRRect&ClipOval',
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ClipRectDemo())),
                ),
                MyCardTile(
                  text: 'Hero',
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => HeroDemo())),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
