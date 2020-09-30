import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

///@immutable
///用于注释类“ C”。 表示C和C的所有子类型必须是不可变的。
///
///如果该类的所有实例字段（无论是直接定义的还是继承的）都是“最终的”，则该类是不可变的。
///如果注释与除类之外的其他任何东西相关联，或者具有注释或不扩展，实现或混合在具有该注释的类中的类之外的其他类与之关联，则诸如分析器之类的工具可以提供反馈。

/// 描述[可滚动]小部件的行为。
///
/// [ScrollConfiguration]用于在子树中配置[Scrollable]小部件
@immutable
class CustomScrollBehavior extends ScrollBehavior {
  final bool isShowLeading;
  final bool isShowTrailing;
  final Color color;

  CustomScrollBehavior(this.isShowLeading, this.isShowTrailing, this.color);

  /// 应实现其滚动物理的平台。
  ///
  /// 默认为当前平台。
  TargetPlatform getPlatform(BuildContext context) => defaultTargetPlatform;

  /// 包装给定的小部件，该小部件在给定的[AxisDirection]中滚动。
  ///
  /// 例如，在Android上，此方法使用[GlowingOverscrollIndicator]包装给定的小部件，以在用户使用时提供视觉反馈过度滚动
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    //构造参数可选时无数据，必填时有数据
    /*print('数据点位: isShowLeading：' + isShowLeading.toString());
    print('数据点位: isShowTrailing：' + isShowTrailing.toString());
    print('数据点位: color：' + color.toString());*/

    //修改此功能时，请考虑同时修改_MaterialScrollBehavior中的实现。
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
        return child;
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        /// 视觉指示滚动视图已过度滚动。 创建视觉指示，表明滚动视图已过度滚动。
        ///
        /// [GlowingOverscrollIndicator]监听[ScrollNotification]，以控制过度滚动指示。
        /// 这些通知通常由[ScrollView]（例如[ListView]或[GridView]）生成。
        ///
        /// [GlowingOverscrollIndicator]在显示过度滚动指示之前会生成[OverscrollIndicatorNotification]。
        /// 为防止指示器显示指示，请在通知上调用[OverscrollIndicatorNotification.disallowGlow]。
        ///
        ///由[ScrollBehavior.buildViewportChrome]在通常使用这种过度滚动指示的平台（例如Android）上自动创建。
        ///
        ///在[MaterialApp]中，边缘发光颜色为[ThemeData.accentColor]。
        ///
        /// 为了使此小部件显示过度滚动指示，请使用[child]小部件必须包含一个生成[ScrollNotification]的小部件，
        /// 例如[ListView]或[GridView]。
        ///
        /// [showLeading]，[showTrailing]，[axisDirection]，[color]，和[notificationPredicate]参数不能为null。
        return GlowingOverscrollIndicator(
          child: child,
          axisDirection: axisDirection,
          ///是否在负滚动偏移量的侧面显示过度滚动光晕。
          ///对于垂直向下的视口，这是顶部。
          ///默认为true。
          ///有关视口另一侧的相应控件，请参见[showTrailing]。
          showLeading: isShowLeading ?? true,
          ///是否以正的滚动偏移量在侧面显示过度滚动光晕。
          ///对于垂直向下的视口，这是底部。
          ///默认为true。
          ///请参见[showLeading]，以获取视口另一侧的相应控件。
          showTrailing: isShowTrailing ?? true,
          ///发光的颜色。 Alpha通道将被忽略(忽略颜色的透明度)。
          color: color ?? Colors.white,
        );
      case TargetPlatform.linux:
        // TODO: Handle this case.
        break;
      case TargetPlatform.macOS:
        // TODO: Handle this case.
        break;
      case TargetPlatform.windows:
        // TODO: Handle this case.
        break;
    }
    return null;
  }
}
