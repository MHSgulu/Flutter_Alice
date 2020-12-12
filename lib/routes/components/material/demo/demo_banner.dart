

import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';

enum BannerDemoAction {
  reset,
  showMultipleActions,
  showLeading,
}

class BannerDemo extends StatefulWidget {
  const BannerDemo();

  @override
  _BannerDemoState createState() => _BannerDemoState();
}

class _BannerDemoState extends State<BannerDemo> with RestorationMixin {
  static const _itemCount = 20;

  @override
  String get restorationId => 'banner_demo';

  @override
  void restoreState(RestorationBucket oldBucket, bool initialRestore) {
    registerForRestoration(_displayBanner, 'display_banner');
    registerForRestoration(_showMultipleActions, 'show_multiple_actions');
    registerForRestoration(_showLeading, 'show_leading');
  }

  final RestorableBool _displayBanner = RestorableBool(true);
  final RestorableBool _showMultipleActions = RestorableBool(true);
  final RestorableBool _showLeading = RestorableBool(true);

  void handleDemoAction(BannerDemoAction action) {
    setState(() {
      switch (action) {
        case BannerDemoAction.reset:
          _displayBanner.value = true;
          _showMultipleActions.value = true;
          _showLeading.value = true;
          break;
        case BannerDemoAction.showMultipleActions:
          _showMultipleActions.value = !_showMultipleActions.value;
          break;
        case BannerDemoAction.showLeading:
          _showLeading.value = !_showLeading.value;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final banner = MaterialBanner(
      content: Text('您的密码已在其他设备上更新。请重新登录。'),
      leading: _showLeading.value
          ? CircleAvatar(
        child: Icon(Icons.access_alarm, color: colorScheme.onPrimary),
        backgroundColor: colorScheme.primary,
      )
          : null,
      actions: [
        TextButton(
          child: Text('登录'),
          onPressed: () {
            setState(() {
              _displayBanner.value = false;
            });
          },
        ),
        if (_showMultipleActions.value)
          TextButton(
            child: Text('关闭'),
            onPressed: () {
              setState(() {
                _displayBanner.value = false;
              });
            },
          ),
      ],
      //backgroundColor: colorScheme.background,
    );

    return Scaffold(
      appBar: MyAppBar(
        label: '横幅',
        onPressedBack: () => Navigator.pop(context),
        actions: [
          PopupMenuButton<BannerDemoAction>(
            icon: Icon(Icons.more_vert_rounded,color: Colors.black,),
            onSelected: handleDemoAction,
            itemBuilder: (context) => <PopupMenuEntry<BannerDemoAction>>[
              PopupMenuItem<BannerDemoAction>(
                value: BannerDemoAction.reset,
                child:
                Text('重置横幅'),
              ),
              const PopupMenuDivider(),
              CheckedPopupMenuItem<BannerDemoAction>(
                value: BannerDemoAction.showMultipleActions,
                checked: _showMultipleActions.value,
                child: Text('多项操作'),
              ),
              CheckedPopupMenuItem<BannerDemoAction>(
                value: BannerDemoAction.showLeading,
                checked: _showLeading.value,
                child: Text('前置图标'),
              ),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        restorationId: 'banner_demo_list_view',
        itemCount: _displayBanner.value ? _itemCount + 1 : _itemCount,
        itemBuilder: (context, index) {
          if (index == 0 && _displayBanner.value) {
            return banner;
          }
          return ListTile(
            title: Text('项 ${_displayBanner.value ? index : index + 1}'),
          );
        },
      ),
    );
  }
}

