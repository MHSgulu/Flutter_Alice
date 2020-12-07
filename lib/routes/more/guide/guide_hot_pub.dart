import 'package:alice/routes/example/Individual/badges/example_badge.dart';
import 'package:alice/routes/example/Individual/city_picker/example_city_picker.dart';
import 'package:alice/routes/example/Individual/flutter_html/example_html.dart';
import 'package:alice/routes/example/Individual/flutter_image_compress/example_picture_compression.dart';
import 'package:alice/routes/example/Individual/flutter_staggered_grid/test_staggered_grid.dart';
import 'package:alice/routes/example/Individual/gesture_password/example_gesture_password.dart';
import 'package:alice/routes/example/Individual/image_gallery_saver/image_gallery_saver.dart';
import 'package:alice/routes/example/Individual/marquee/example_marquee.dart';
import 'package:alice/routes/example/Individual/zefyr/example_zefyr.dart';
import 'package:alice/routes/example/company/baseflow/cached_network_image/example_cached_network_image.dart';
import 'package:alice/routes/example/company/baseflow/permission_handler/example_permission.dart';
import 'package:alice/widgets/custom/custom_scroll_behavior.dart';
import 'package:alice/widgets/custom/my_appbar.dart';

import 'package:flutter/material.dart';

import 'guide_chart.dart';

class GuideHotPubLibraryRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GuideHotPubLibraryRouteState();
}

class GuideHotPubLibraryRouteState extends State<GuideHotPubLibraryRoute> {
  List<String> titleList = [
    'cached_network_image',
    'permission_handler',
    'fl_chart ',
    'zefyr',
    'flutter_image_compress',
    'city_pickers',
    'badges',
    'marquee',
    'flutter_html',
    'flutter_staggered_grid_view',
    'gesture_password_widget',
    'image_gallery_saver',
  ];

  List<String> subTitleList = [
    '用于显示来自互联网的图像并将其保存在缓存目录中',
    'Flutter的权限插件。此插件提供了跨平台（iOS，Android）API来请求和检查权限',
    '强大的Flutter图表库，当前支持折线图，条形图和饼图',
    '干净，简约，易于协作的Flutter富文本编辑器',
    '使用本机代码（objc kotlin）压缩图像，速度更快。这个程式库可以在android / ios上运作',
    '中国的城市三级联动选择器',
    '徽章可用于任何小部件的附加标记，例如，显示购物车中的许多物品',
    'Flutter小部件，可无限滚动文本。提供许多自定义设置，包括自定义滚动方向，持续时间，曲线以及每轮结束后的暂停',
    'Flutter小部件，将静态HTML和CSS呈现为Flutter小部件',
    'Flutter交错网格视图，支持多列且行大小不同',
    'Flutter的手势解锁小部件，支持高度自定义',
    '一个新的flutter插件项目，用于将图像保存到图库',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'Pub热门',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: ScrollConfiguration(
        behavior: CustomScrollBehavior(
            isShowLeading: true,
            isShowTrailing: true,
            color: Colors.indigo[400],
        ),
        child: ListView.builder(
          //reverse: true,
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
        Navigator.push(context, MaterialPageRoute(builder: (_) => ExampleCachedNetworkImage()));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (_) => ExamplePermission()));
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (_) => GuideChartRoute()));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (_) => ZefyrApp()));
        break;
      case 4:
        Navigator.push(context, MaterialPageRoute(builder: (_) => ExamplePictureCompression()));
        break;
      case 5:
        Navigator.push(context, MaterialPageRoute(builder: (_) => ExampleCityPicker()));
        break;
      case 6:
        Navigator.push(context, MaterialPageRoute(builder: (_) => ExampleBadgePage()));
        break;
      case 7:
        Navigator.push(context, MaterialPageRoute(builder: (_) => ExampleMarquee()));
        break;
      case 8:
        Navigator.push(context, MaterialPageRoute(builder: (_) => HtmlExamplePage()));
        break;
      case 9:
        Navigator.push(context, MaterialPageRoute(builder: (_) => TestStaggeredGrid()));
        break;
      case 10:
        Navigator.push(context, MaterialPageRoute(builder: (_) => GesturePasswordWidgetDemo()));
        break;
      case 11:
        Navigator.push(context, MaterialPageRoute(builder: (_) => ExampleImageGallerySaver()));
        break;
    }
  }
}
