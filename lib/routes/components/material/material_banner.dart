import 'package:alice/routes/components/material/demo/demo_banner.dart';
import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';

///材质设计标语。
///
///横幅显示一条重要的简短消息，并为用户提供解决（或关闭横幅）的操作。
///需要用户采取行动才能将其撤消。
///
///横幅广告应显示在屏幕顶部，顶部应用栏下方。
///它们是持久性和非模态的，允许用户忽略它们或随时与它们交互。
///
///如果只有一个，则[动作]将放置在[内容]旁边。
///否则，[动作]将放置在[内容]下方。使用[forceActionsBelow]覆盖此行为。
///
///必须提供[动作]和[内容]。 还可以提供可选的前导小部件（通常为[Image]）。
///可以提供[contentTextStyle]和[backgroundColor]以自定义横幅。
///
///此小部件与小部件库[横幅]小部件无关。

class MaterialBannerRoute extends StatefulWidget {
  @override
  _MaterialBannerRouteState createState() => _MaterialBannerRouteState();
}

class _MaterialBannerRouteState extends State<MaterialBannerRoute> {
  bool isShowBanner = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: '横幅',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: Column(
        children: [
          isShowBanner
              ? MaterialBanner(
                  content: Text('当前网络状况不佳，是否切换到4G网络?'),
                  leading: CircleAvatar(child: Icon(Icons.delete)),
                  actions: [
                    TextButton(
                      child: Text('否'),
                      onPressed: () => hideBanner(),
                    ),
                    TextButton(
                      child: Text('是'),
                      onPressed: () => hideBanner(),
                    ),
                  ],
                )
              : Container(),
          SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => BannerDemo()));
            },
            child: Text('查看画廊演示'),
          ),
        ],
      ),
    );
  }

  void hideBanner() {
    if (mounted) {
      setState(() {
        isShowBanner = false;
      });
    }
  }
}
