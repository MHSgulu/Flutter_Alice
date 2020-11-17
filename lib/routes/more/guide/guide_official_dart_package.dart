import 'file:///E:/Alice_flutter/alice/lib/routes/example/localization/example_localization.dart';
import 'file:///E:/Alice_flutter/alice/lib/routes/example/localization/intl/example_localization_intl.dart';
import 'package:alice/widgets/custom/custom_scroll_behavior.dart';
import 'package:alice/widgets/custom/my_appbar.dart';

import 'package:flutter/material.dart';

class GuideDartTeamOfficialPackageRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GuideOfficialPackageRouteState();
}

class GuideOfficialPackageRouteState
    extends State<GuideDartTeamOfficialPackageRoute> {
  List<String> titleList = [
    '不使用 intl包',
    'intl ',
  ];

  List<String> subTitleList = [
    'app 本地化资源的替代方法  不使用 intl包 它所有的翻译放在每个语言的映射当中。',
    '该软件包提供国际化和本地化功能，包括消息翻译，复数形式和性别，日期/数字格式和解析以及双向文本',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'Package',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: ScrollConfiguration(
        behavior: CustomScrollBehavior(
            isShowLeading: true,
            isShowTrailing: true,
            color: Colors.indigo[400]),
        child: ListView.builder(
          itemCount: titleList.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () => jumpToRoute(index),
                  splashColor: Colors.indigo[100],
                  child: ListTile(
                    title: Text(titleList[index]),
                    subtitle: Text(subTitleList[index]),
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
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Demo()));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (_) => DemoIntl()));
        break;
      case 2:
        //Navigator.push(context, MaterialPageRoute(builder: (_) => WebViewExample()));
        break;
      case 3:
        //Navigator.push(context, MaterialPageRoute(builder: (_) => DeviceInfo()));
        break;
      case 4:
        //Navigator.push(context, MaterialPageRoute(builder: (_) => BarChartSample5()));
        break;
      case 5:
        //Navigator.push(context, MaterialPageRoute(builder: (_) => LineChartSample1()));
        break;
    }
  }
}
