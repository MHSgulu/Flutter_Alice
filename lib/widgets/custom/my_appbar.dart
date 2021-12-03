import 'package:alice/common/const/colors.dart';
import 'package:alice/common/global/theme_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

///尽可能通用的AppBar
class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String label;
  final VoidCallback onPressedBack;
  final Widget leading;
  final List<Widget> actions;
  final PreferredSizeWidget bottom;
  final double elevation;
  final Color backgroundColor;
  final Brightness brightness;
  final double toolbarHeight;

  const MyAppBar({
    Key key,
    @required this.label,
    this.onPressedBack,
    this.actions,
    this.leading,
    this.bottom,
    this.elevation,
    this.backgroundColor,
    this.brightness,
    this.toolbarHeight,
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
          backgroundColor: AppThemeMode.isDark
              ? MyColors.appBarDarkColor
              : widget.backgroundColor ?? Colors.white,
          //应用栏材料的亮度。 通常，它与[backgroundColor]，[iconTheme]，[textTheme]一起设置。
          //如果此属性为null，则使用[ThemeData.appBarTheme]的[AppBarTheme.brightness]。
          // 如果该值也为null，则使用[ThemeData.primaryColorBrightness]。
          /*brightness: widget.brightness == null ? AppThemeMode.isDark
              ? Brightness.dark
              : Brightness.light : widget.brightness,*/
          systemOverlayStyle: SystemUiOverlayStyle(
            /// 顶部状态栏的亮度.
            ///
            /// 仅支持iOS.
            //statusBarBrightness: Brightness.light,
          ),
          leading: widget.leading ??
              IconButton(
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: AppThemeMode.isDark
                      ? Colors.white
                      : widget.backgroundColor == null
                          ? Colors.black
                          : Colors.white,
                ),
                onPressed: widget.onPressedBack,
              ),
          title: Text(
            widget.label,
            style: TextStyle(
              color: AppThemeMode.isDark
                  ? Colors.white
                  : widget.backgroundColor == null
                      ? Colors.black
                      : Colors.white,
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
          bottom: widget.bottom ??
              PreferredSize(
                child: Container(),
                preferredSize: Size.fromHeight(0),
              ),
          toolbarHeight: widget.toolbarHeight ?? kToolbarHeight,
        ),
      ),
    );
  }
}
