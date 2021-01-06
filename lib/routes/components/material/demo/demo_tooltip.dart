import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';

//应用程序通常使用图标来传达意思。
// 使用工具提示包裹您的图标和图像，以附加提高可访问性和提供更多上下文的工具提示消息。
// {@youtube 560 315 https://www.youtube.com/watch?v=EeEfD5fI-5Q}

///材料设计工具提示。
///
///工具提示提供了文本标签，可帮助解释按钮或其他用户界面操作的功能。 将按钮包装在[Tooltip]小部件中，并提供一条消息，长按该小部件时将显示该消息。
///
///许多小部件，例如[IconButton]，[FloatingActionButton]和[PopupMenuButton]都具有一个“ tooltip”属性，当该属性为非null时，会导致该小部件在其构建中包含[Tooltip]。
///
///工具提示通过证明小部件的文本表示来改善可视化小部件的可访问性，例如，可以由屏幕阅读器发出声音。
///
/// 也可以看看：
///
/// * <https://material.io/design/components/tooltips.html>
/// * [TooltipTheme]或[ThemeData.tooltipTheme]

class TooltipDemo extends StatelessWidget {
  const TooltipDemo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: '工具提示',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '长按元素或将鼠标悬停在元素上方即可显示工具提示',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ///创建一个工具提示。
              ///
              ///默认情况下，工具提示应遵守[材料规格]（https://material.io/design/components/tooltips.html#spec）。
              ///如果未定义可选的构造函数参数，则当[ThemeData]中存在或指定了[TooltipTheme]时，将使用[TooltipTheme.of]提供的值。
              ///
              ///构造函数中定义的所有参数都将覆盖默认值_和[TooltipTheme.of]中的值。
              Tooltip(
                message: '搜索',
                child: IconButton(
                  color: Theme.of(context).colorScheme.primary,
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
