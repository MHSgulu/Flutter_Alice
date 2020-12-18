import 'package:alice/common/const/colors.dart';
import 'package:alice/common/global/theme_mode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// 封装  基础通用型AppBar(适用于子级页面的AppBar里)
class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String label;
  final VoidCallback onPressedBack;
  final List<Widget> actions;
  final PreferredSizeWidget bottom;
  final double elevation;
  final Color backgroundColor;

  const MyAppBar({
    Key key,
    @required this.label,
    @required this.onPressedBack,
    this.actions,
    this.bottom,
    this.elevation,
    this.backgroundColor,
  }) : super(key: key);

  @override
  _MyAppBarState createState() => _MyAppBarState();

  //preferredSize = Size.fromHeight(toolbarHeight ?? kToolbarHeight + (bottom?.preferredSize?.height ?? 0.0)),
  //preferredSize = Size.fromHeight(56 + (bottom?.preferredSize?.height ?? 0.0)),
  @override
  Size get preferredSize => Size.fromHeight(56.0 + (bottom?.preferredSize?.height ?? 0.0)); //当AppBar设置bottom,AppBar的高度加上bottom的高度。
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppThemeMode(),
      child: Consumer<AppThemeMode>(
        builder: (context, theme, child) => AppBar(
          //如果指定了昼夜主题，使用昼夜主题色，如果指定了背景色，采用背景色。
          backgroundColor: AppThemeMode.isDark ? MyColors.appBarDarkColor : widget.backgroundColor ?? Colors.white,
          brightness: AppThemeMode.isDark ? Brightness.dark : widget.backgroundColor == null ? Brightness.light : Brightness.dark,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_rounded,
              color: AppThemeMode.isDark ? Colors.white : widget.backgroundColor == null ? Colors.black : Colors.white,
            ),
            onPressed: widget.onPressedBack,
          ),
          title: Text(
            widget.label,
            style: TextStyle(
              color: AppThemeMode.isDark ? Colors.white : widget.backgroundColor == null ? Colors.black : Colors.white,
              fontSize: 18,
            ),
          ),
          //在[title]小部件之后连续显示的小部件。
          //通常，这些小部件是表示常用操作的[IconButton]。
          //对于不太常见的操作，请考虑将[PopupMenuButton]作为最后一个动作。
          //[actions]成为此小部件构建的[NavigationToolbar]的尾随组件。
          //每个动作的高度不得超过[toolbarHeight]。
          actions: widget.actions ?? [],
          centerTitle: true,
          elevation: widget.elevation ?? 1,
          bottom: widget.bottom ?? PreferredSize(
                child: Container(),
                preferredSize: Size.fromHeight(0),
              ),
        ),
      ),
    );
  }
}
