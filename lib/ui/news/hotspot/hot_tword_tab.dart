import 'package:alice/custom/custom_scroll_behavior.dart';
import 'package:alice/custom/my_appbar.dart';
import 'package:alice/model/hot_word_type_entity.dart';
import 'file:///E:/Alice_flutter/alice/lib/ui/global/theme_mode.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'hot_word_list.dart';

class HotWordTab extends StatefulWidget {
  final String title;
  final List<HotWordTypeResultShowapiResBodyListChildList> childList;

  const HotWordTab({Key key, this.title, this.childList}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HotWordTabState();
}

class HotWordTabState extends State<HotWordTab> {
  List<Tab> myTabs = List();
  List<String> typeId = List();

  @override
  void initState() {
    widget.childList.forEach((f) {
      typeId.add(f.id);
      myTabs.add(Tab(
        text: f.name,
      ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: MyAppBar(
          label: widget.title,
          onPressedBack: () => Navigator.pop(context),
          bottom: PreferredSize(
            child: Container(
              height: 40,
              child: ChangeNotifierProvider(
                create: (context) => AppThemeMode(),
                child: Consumer<AppThemeMode>(
                  builder: (context, theme, child) => TabBar(
                    tabs: myTabs,
                    isScrollable: true,
                    indicatorColor: AppThemeMode.isDark ? Colors.white70 : Colors.black54,
                    indicatorSize: TabBarIndicatorSize.label,
                    labelColor: AppThemeMode.isDark ? Colors.white : Colors.black87,
                    unselectedLabelColor: AppThemeMode.isDark ? Colors.white54 : Colors.black45,
                  ),
                ),
              ),
            ),
            preferredSize: Size.fromHeight(35),
          ),
        ),
        body: ScrollConfiguration(
          behavior: CustomScrollBehavior(),
          child: TabBarView(
            children: [
              for (final id in typeId)
                HotWordList(
                  id: id,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
