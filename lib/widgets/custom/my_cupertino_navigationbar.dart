import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///一个iOS样式的导航栏。
///
///导航栏是一个工具栏，在工具栏的[中间]至少由一个小部件（通常是页面标题）组成。
///
///它还支持[middle]小部件之前和之后的[leading]和[trailing]小部件，同时使[middle]小部件居中。
///
/// [前导]小部件将自动为后部V形图标按钮（如果是全屏对话框，则为关闭按钮），以在没有提供且[automaticallyImplyLeading]为true（默认为true）时弹出当前路线。
///
///如果未提供[middle]小部件，并且[automaticallyImplyMiddle]为true（默认为true），则[middle]小部件将自动为当前[CupertinoPageRoute]的标题文本。
///
///应该将其放在屏幕顶部，并自动说明操作系统的状态栏。
///
///如果给定的[backgroundColor]的不透明度不是1.0（默认情况下是这种情况），它将对其后面的内容产生模糊效果。
///
///当[transitionBetweenRoutes]为true时，如果要转换到的路线也具有[CupertinoNavigationBar]或[CupertinoSliverNavigationBar]且[transitionBetweenRoutes]设置为true，则此导航栏将在路线顶部而不是路线内部进行转换。如果[transitionBetweenRoutes]为true，则[Widget]参数均不能在其子树中包含关键字，因为该控件将同时存在于树中的多个位置。
///
///默认情况下，每个[PageRoute]中仅应存在一个[CupertinoNavigationBar]或[CupertinoSliverNavigationBar]以支持默认过渡。
///使用[transitionBetweenRoutes]或[heroTag]自定义每个路线的多个导航栏的过渡行为。
///
///在[CupertinoPageScaffold]中使用时，[CupertinoPageScaffold.navigationBar]的文本比例因子设置为1.0，并且不响应操作系统中文本比例因子的变化，以匹配本机iOS行为。要覆盖此行为，请使用所需的[MediaQueryData.textScaleFactor]值将每个`navigationBar`组件包装在[MediaQuery]中。可以通过多种方式检索操作系统中的文本比例因子值，例如，根据[CupertinoApp]的[BuildContext]查询[MediaQuery.textScaleFactorOf]。
///
/// 也可以看看：
///
/// * [CupertinoPageScaffold]，通常用于托管
/// [CupertinoNavigationBar]。
/// * [CupertinoSliverNavigationBar]用于将导航栏放置在滚动列表中，并支持iOS-11-样式的大标题。

class MyCupertinoNavigationBar extends StatefulWidget
    implements ObstructingPreferredSizeWidget {
  final Widget leading;
  final String title;
  final Widget trailing;
  final Border border;
  final Color backgroundColor;
  final Brightness brightness;
  final EdgeInsetsDirectional padding;

  const MyCupertinoNavigationBar({
    Key key,
    this.leading,
    this.title,
    this.trailing,
    this.border,
    this.backgroundColor,
    this.brightness,
    this.padding,
  }) : super(key: key);

  @override
  _MyCupertinoNavigationBarState createState() =>
      _MyCupertinoNavigationBarState();

  @override
  Size get preferredSize {
    ///不带状态栏的标准iOS导航栏高度。此高度是恒定的，并且与iOS中的可访问性无关。
    //const double _kNavBarPersistentHeight = kMinInteractiveDimensionCupertino;
    ///根据iOS人机界面指南，任何交互式区域的最小尺寸。
    ///
    ///用于避免用户难以与之交互的小区域。 它适用于区域的两个维度，因此大小为kMinInteractiveDimension x kMinInteractiveDimension的正方形是应响应手势的最小可接受区域。
    ///
    /// 也可以看看：
    ///
    /// * [kMinInteractiveDimension]
    /// * <https://developer.apple.com/ios/human-interface-guidelines/visual-design/adaptivity-and-layout/> />
    //const double kMinInteractiveDimensionCupertino = 44.0;
    return const Size.fromHeight(/*_kNavBarPersistentHeight*/ 44.0);
  }

  ///具有首选大小的小部件，并报告是否完全阻塞了其后面的小部件。
  ///
  ///由[CupertinoPageScaffold]使用，以移走完全受阻的内容或为部分受阻的内容提供填充指南。
  //   //ObstructingPreferredSizeWidget

  ///如果为true，则此小部件将以指定的大小完全阻塞其后的小部件。
  ///如果为false，则此小部件会部分阻塞。

  ///如果导航栏的背景色不透明，则为true。
  @override
  bool shouldFullyObstruct(BuildContext context) {
    ///通过调用[resolveFrom]解析给定的[Color]。
    ///如果给定的颜色已经是具体的[Color]，它将照原样返回。
    ///如果给定的颜色为null，则返回null。
    ///如果给定的颜色是[CupertinoDynamicColor]，但是给定的[BuildContext]缺少颜色分辨率所需的依赖性，
    ///则将使用默认特征值（[Brightness.light]平台亮度，正常对比度，[CupertinoUserInterfaceLevelData.base]海拔级别），
    ///除非[nullOk]设置为false，否则将引发异常。
    final Color backgroundColor =
        CupertinoDynamicColor.resolve(this.backgroundColor, context) ??
            CupertinoTheme.of(context).barBackgroundColor;
    return backgroundColor.alpha == 0xFF;
  }
}

class _MyCupertinoNavigationBarState extends State<MyCupertinoNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      //放置在导航栏开始处的小部件。 通常，正常页面的后退按钮或整页对话框的取消按钮。
      //如果为null且[automaticallyImplyLeading]为true，则会自动创建一个适当的按钮。
      leading: widget.leading,
      //控制是否应尝试将前导小部件隐含为null。
      //如果为true，并且[leading]为null，则自动尝试推断[leading]小部件应该是什么。 如果[leading]小部件不为null，则此参数无效。
      //具体来说，此导航栏将：
      // 1.如果当前路径是“ fullscreenDialog”，则显示“关闭”按钮。
      // 2.如果[previousPageTitle]不为null，则显示带有[previousPageTitle]的后V形。
      // 3.如果当前路线是[CupertinoPageRoute]，而先前路线也是[CupertinoPageRoute]，则显示带有上一条路线的“ title”的后部V形符号。
      //此值不能为null。
      automaticallyImplyLeading: true,
      //控制是否应尝试将中间小部件隐含为null。
      //如果为true，且[middle]为null，则如果路由为[CupertinoPageRoute]，则自动使用当前路由的“ title”填充[Text]小部件。
      //如果[middle]小部件不为null，则此参数无效。
      //此值不能为null。
      automaticallyImplyMiddle: true,
      //当自动隐含前导按钮时，手动指定上一条路线的标题。
      //当[automaticallyImplyLeading]为true时，覆盖用后燕尾形显示的文本，而不是自动显示前一个[CupertinoPageRoute]的`title`。
      //当[leading]不为null或[automaticallyImplyLeading]为false时无效。
      ///previousPageTitle: '',
      //放置在导航栏中间的小部件。 通常是标题或分段控件。
      //如果为null并且[automaticallyImplyMiddle]为true，则如果当前路由为[CupertinoPageRoute]并具有“ title”，则将创建适当的[Text]标题。
      middle: Text('${widget.title}'),
      //放置在导航栏末尾的小部件。 通常在页面上执行的其他操作，例如搜索或编辑功能。 可为空(null)
      trailing: widget.trailing,
      //导航栏的边框。 默认情况下，渲染单个像素的底部边框。
      //如果边框为空(null)，则导航栏将不会显示边框。
      border: widget.backgroundColor ??
          Border(
            bottom: BorderSide(
              color: Color(0x4D000000),
              width: 0.0, // One physical pixel.
              style: BorderStyle.solid,
            ),
          ),
      //导航栏的背景色。 如果它包含透明度，则标签栏将自动对其后面的内容产生模糊效果。
      //如果为null，则默认为[CupertinoTheme]的`barBackgroundColor`。
      backgroundColor: widget.backgroundColor,
      //指定的[backgroundColor]的亮度。
      //设置此值将更改系统状态栏的样式。 通常用于在[backgroundColor]上增加系统状态栏的对比度。
      //如果设置为null，则将从[backgroundColor]的相对亮度推断出属性的值。  亲测还很有效！！
      brightness: widget.brightness,
      //填充导航栏的内容。
      //如果为null，则导航栏将采用以下默认值：
      // *在垂直方向上，内容的大小将与导航栏本身减去状态栏的高度相同。
      // *在水平方向上，根据iOS规范，填充将为16像素，除非前导窗口部件是自动插入的后退按钮，在这种情况下，填充将为0。
      //垂直填充不会更改导航栏的高度。
      padding: widget.padding,
      //用于导航栏中[lead]和[trailing]小部件的文本和图标的默认颜色。
      //如果为null，则默认为[CupertinoTheme]的`primaryColor`。
      //根据iOS标准设计，[中间]插槽中文本的默认颜色始终为黑色。
      // @不推荐使用（
      // '使用CupertinoTheme和primaryColor传播颜色。 '
      //  “ v1.1.2之后不推荐使用此功能。”
      // ）
      //actionsForegroundColor: null,
      //是否在导航栏之间过渡。
      //当[transitionBetweenRoutes]为true时，如果要转换到的路由也具有[CupertinoNavigationBar]或[CupertinoSliverNavigationBar]且[transitionBetweenRoutes]设置为true，则此导航栏将在路径顶部而不是内部进行转换。
      //这种过渡也将发生在边缘向后滑动手势上，例如在iOS上，但前提是下面的上一页在[PageRoute]上将`maintainState`设置为true。
      //设置为true时，除非还设置了[heroTag]，否则每个路线只能出现一个导航栏。
      //此值默认为true，不能为null。
      transitionBetweenRoutes: true,
      //如果[transitionBetweenRoutes]为true，则为导航栏的Hero小部件标记。
      //默认为同一[Navigator]的所有[CupertinoNavigationBar]和[CupertinoSliverNavigationBar]实例之间的公共标记。
      //使用默认标签，同一导航器的所有导航栏都可以在彼此之间转换，只要每条路线只有一个导航栏即可。
      //可以覆盖此[heroTag]，以手动处理每条路线具有多个导航栏或在多个[Navigator]之间切换。
      //不能为null。 要为此导航栏禁用英雄转换，请将[transitionBetweenRoutes]设置为false。
      ///heroTag: ,
    );
  }
}
