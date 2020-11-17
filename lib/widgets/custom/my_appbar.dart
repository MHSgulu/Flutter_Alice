import 'package:alice/common/const/colors.dart';
import 'package:alice/common/global/theme_mode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// 封装  基础通用型AppBar(适用于子级页面的AppBar里)
class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String label;
  final VoidCallback onPressedBack;
  final PreferredSizeWidget bottom;

  const MyAppBar({
    Key key,
    @required this.label,
    @required this.onPressedBack,
    this.bottom,
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
          backgroundColor:
              AppThemeMode.isDark ? MyColors.appBarDarkColor : Colors.white,
          brightness: AppThemeMode.isDark ? Brightness.dark : Brightness.light,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_rounded,
              color: AppThemeMode.isDark ? Colors.white : Colors.black,
            ),
            onPressed: widget.onPressedBack,
          ),
          title: Text(
            widget.label,
            style: TextStyle(
              color: AppThemeMode.isDark ? Colors.white : Colors.black,
              fontSize: 18,
            ),
          ),
          centerTitle: true,
          elevation: 1,
          bottom: widget.bottom ??
              PreferredSize(
                child: Container(),
                preferredSize: Size.fromHeight(0),
              ),
        ),
      ),
    );
  }
}
