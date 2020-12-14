import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class SharedZAxisTransitionDemo extends StatelessWidget {
  const SharedZAxisTransitionDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        return _createHomeRoute();
      },
    );
  }

  Route _createHomeRoute() {
    return PageRouteBuilder<void>(
      pageBuilder: (context, animation, secondaryAnimation) {

        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Column(
              children: [
                Text('共用Z轴'),
                Text(
                  '“设置”图标按钮',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      .copyWith(color: Colors.white),
                ),
              ],
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  Navigator.of(context).push<void>(_createSettingsRoute());
                },
              ),
            ],
          ),
          body: const _RecipePage(),
        );
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SharedAxisTransition(
          fillColor: Colors.transparent,
          transitionType: SharedAxisTransitionType.scaled,
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        );
      },
    );
  }

  Route _createSettingsRoute() {
    return PageRouteBuilder<void>(
      pageBuilder: (context, animation, secondaryAnimation) =>
      const _SettingsPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SharedAxisTransition(
          fillColor: Colors.transparent,
          transitionType: SharedAxisTransitionType.scaled,
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        );
      },
    );
  }
}

class _SettingsPage extends StatelessWidget {
  const _SettingsPage();

  @override
  Widget build(BuildContext context) {
    final settingsList = <_SettingsInfo>[
      _SettingsInfo(
        Icons.person,
        '个人资料',
      ),
      _SettingsInfo(
        Icons.notifications,
        '通知',
      ),
      _SettingsInfo(
        Icons.security,
        '隐私设置',
      ),
      _SettingsInfo(
        Icons.help,
        '服务帮助',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('设置'),
      ),
      body: ListView(
        children: [
          for (var setting in settingsList) _SettingsTile(setting),
        ],
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile(this.settingData);
  final _SettingsInfo settingData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(settingData.settingIcon),
          title: Text(settingData.settingsLabel),
        ),
        const Divider(thickness: 2),
      ],
    );
  }
}

class _SettingsInfo {
  const _SettingsInfo(this.settingIcon, this.settingsLabel);

  final IconData settingIcon;
  final String settingsLabel;
}

class _RecipePage extends StatelessWidget {
  const _RecipePage();

  @override
  Widget build(BuildContext context) {
    final savedRecipes = <_RecipeInfo>[
      _RecipeInfo(
        '汉堡包',
        '汉堡包食谱',
        'https://icweiliimg6.pstatp.com/weili/l/783859105274921025.webp',
      ),
      _RecipeInfo(
        '三明治',
        '三明治食谱',
        'https://icweiliimg1.pstatp.com/weili/l/717226321213653043.webp',
      ),
      _RecipeInfo(
        '甜品',
        '甜品食谱',
        'https://icweiliimg1.pstatp.com/weili/l/337259154472960007.webp',
      ),
      _RecipeInfo(
        '虾',
        '虾食谱',
        'https://weiliicimg9.pstatp.com/weili/l/835035435904794694.webp',
      ),
      _RecipeInfo(
        '螃蟹',
        '螃蟹食谱',
        'https://weiliicimg6.pstatp.com/weili/l/789319795412566143.webp',
      ),
      _RecipeInfo(
        '牛肉三明治',
        '牛肉三明治食谱',
        'https://weiliicimg6.pstatp.com/weili/l/982417367508844831.webp',
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 8.0),
          child: Text('保存的食谱'),
        ),
        const SizedBox(height: 4),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: [
              for (var recipe in savedRecipes)
                _RecipeTile(recipe, savedRecipes.indexOf(recipe))
            ],
          ),
        ),
      ],
    );
  }
}

class _RecipeInfo {
  const _RecipeInfo(this.recipeName, this.recipeDescription, this.recipeImage);

  final String recipeName;
  final String recipeDescription;
  final String recipeImage;
}

class _RecipeTile extends StatelessWidget {
  const _RecipeTile(this._recipe, this._index);
  final _RecipeInfo _recipe;
  final int _index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 70,
          width: 100,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            child: Image.network(
              _recipe.recipeImage,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: Column(
            children: [
              ListTile(
                title: Text(_recipe.recipeName),
                subtitle: Text(_recipe.recipeDescription),
                trailing: Text('0${_index + 1}'),
              ),
              const Divider(thickness: 2),
            ],
          ),
        ),
      ],
    );
  }
}

