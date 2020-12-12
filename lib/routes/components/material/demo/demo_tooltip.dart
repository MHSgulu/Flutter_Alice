import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';

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
