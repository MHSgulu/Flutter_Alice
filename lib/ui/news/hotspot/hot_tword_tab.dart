import 'package:alice/custom/custom_scroll_behavior.dart';
import 'package:alice/model/hot_word_type_entity.dart';

import 'package:flutter/material.dart';

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
        appBar: AppBar(
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            widget.title,
            style: TextStyle(color: Colors.black, fontSize: 17),
          ),
          centerTitle: true,
          elevation: 0.5,
          bottom: PreferredSize(
            child: Container(
              height: 40,
              color: Colors.white,
              child: TabBar(
                tabs: myTabs,
                isScrollable: true,
                indicatorColor: Colors.black54,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Colors.black87,
                unselectedLabelColor: Colors.black45,
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
