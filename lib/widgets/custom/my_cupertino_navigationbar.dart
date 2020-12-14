import 'package:flutter/cupertino.dart';

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


class MyCupertinoNavigationBar extends StatefulWidget implements ObstructingPreferredSizeWidget{
  final Color backgroundColor;

  const MyCupertinoNavigationBar({Key key, this.backgroundColor}) : super(key: key);

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
    return const Size.fromHeight(/*_kNavBarPersistentHeight*/44.0);
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
    final Color backgroundColor = CupertinoDynamicColor.resolve(this.backgroundColor, context) ?? CupertinoTheme.of(context).barBackgroundColor;
    return backgroundColor.alpha == 0xFF;
  }
}

class _MyCupertinoNavigationBarState extends State<MyCupertinoNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar();
  }
}
