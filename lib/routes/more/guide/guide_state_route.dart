import 'package:alice/routes/example/company/dash_overflow/provider/example_provider_counter.dart';
import 'package:alice/widgets/custom/custom_scroll_behavior.dart';
import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:alice/widgets/custom/my_list_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GuideStateRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: '状态管理',
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
                  text: 'provider',
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) {
                    // 为应用程序内的所有小部件提供模型。
                    // 我们使用ChangeNotifierProvider是因为这是在模型更改时重建小部件的简单方法。
                    // 我们也可以只使用Provider，但随后我们必须听听Counter
                    //
                    // 阅读提供者的文档以了解所有可用的提供者。
                    return ChangeNotifierProvider(
                      // 在构建器中初始化模型。 这样，Provider可以拥有Counter的生命周期，确保在不再需要时调用`dispose`。
                      create: (context) => Counter(),
                      child: ProviderCounterPage(),
                    );
                  })),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}