import 'package:alice/common/global/theme_mode.dart';
import 'package:alice/routes/more/joke/tab/text_jokes_list.dart';
import 'package:alice/widgets/custom/custom_scroll_behavior.dart';
import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'tab/gif_picture_list.dart';
import 'tab/static_picture_list.dart';

class LifeInterestPictureRoute extends StatelessWidget {
  final List<Tab> myTabs = <Tab>[
    Tab(text: '动图'),
    Tab(text: '图片'),
    Tab(text: '文本'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: MyAppBar(
          label: '趣图',
          onPressedBack: () => Navigator.pop(context),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(35),
            child: SizedBox(
              height: 40,
              child: ChangeNotifierProvider(
                create: (context) => AppThemeMode(),
                child: Consumer<AppThemeMode>(
                  builder: (context, theme, child) => TabBar(
                    tabs: myTabs,
                    isScrollable: false,
                    indicatorColor: Colors.deepOrangeAccent[100],
                    indicatorWeight: 2.0,
                    indicatorSize: TabBarIndicatorSize.label,
                    labelColor: Colors.deepOrangeAccent[100],
                    unselectedLabelColor:
                        AppThemeMode.isDark ? Colors.white54 : Colors.black54,
                  ),
                ),
              ),
            ),
          ),
        ),
        body: ScrollConfiguration(
          behavior: CustomScrollBehavior(),
          child: TabBarView(
            children: [
              GifPictureList(),
              StaticPictureList(),
              TextJokeList(),
            ],
          ),
        ),
      ),
    );
  }
}
