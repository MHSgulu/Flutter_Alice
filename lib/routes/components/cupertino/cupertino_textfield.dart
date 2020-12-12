import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoTextFieldDemo extends StatelessWidget {
  const CupertinoTextFieldDemo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: '文本字段',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: CupertinoTextField(
                placeholder: '电子邮件',
                keyboardType: TextInputType.emailAddress,
                clearButtonMode: OverlayVisibilityMode.editing,
                autocorrect: false,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: CupertinoTextField(
                placeholder: '密码',
                clearButtonMode: OverlayVisibilityMode.editing,
                obscureText: true,
                autocorrect: false,
              ),
            ),
            CupertinoTextField(
              prefix: const Icon(
                CupertinoIcons.padlock_solid,
                size: 28,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
              clearButtonMode: OverlayVisibilityMode.editing,
              keyboardType: TextInputType.number,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 0,
                    color: CupertinoColors.inactiveGray,
                  ),
                ),
              ),
              placeholder: 'PIN 码',
            ),
          ],
        ),
      ),
    );
  }
}
