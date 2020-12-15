import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

///一个容器，该容器会增长以填充屏幕，以在点击时显示新内容。
///
///当容器关闭时，它显示[closedBuilder]返回的[Widget]。
///轻按容器时，它会逐渐变满以填充周围[Navigator]的整个大小，同时使[closedBuilder]返回的窗口小部件褪色，而[openBuilder]返回的窗口小部件褪色。
///当通过提供给[openBuilder]的回调或通过Android的后退按钮再次关闭容器时，动画将反转：
///容器缩小到其原始大小，而[openBuilder]返回的窗口小部件淡出，[ [openBuilder]消失了。
///
///默认情况下，容器处于关闭状态。
///在从关闭到打开的转换（反之亦然）期间，由[openBuilder]和[closedBuilder]返回的窗口小部件同时存在于树中。
///因此，这些构建器返回的窗口小部件不能包含相同的全局密钥。
///
///`T`表示关闭容器时路由返回的数据类型。可以在onClosed函数中访问该值。
///
/// 也可以看看：
///
/// * [材质说明中的[带有动画容器的过渡]（https://material.io/design/motion/choreography.html#transformation）。


const double _fabDimension = 56;

class OpenContainerTransformDemo extends StatefulWidget {
  const OpenContainerTransformDemo({Key key}) : super(key: key);

  @override
  _OpenContainerTransformDemoState createState() =>
      _OpenContainerTransformDemoState();
}

class _OpenContainerTransformDemoState
    extends State<OpenContainerTransformDemo> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ContainerTransitionType _transitionType = ContainerTransitionType.fade;

  void _showSettingsBottomModalSheet(BuildContext context) {

    showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              height: 125,
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '淡化模式',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ToggleButtons(
                    borderRadius: BorderRadius.circular(2),
                    selectedBorderColor: Theme.of(context).colorScheme.primary,
                    onPressed: (index) {
                      setModalState(() {
                        setState(() {
                          _transitionType = index == 0
                              ? ContainerTransitionType.fade
                              : ContainerTransitionType.fadeThrough;
                        });
                      });
                    },
                    isSelected: <bool>[
                      _transitionType == ContainerTransitionType.fade,
                      _transitionType == ContainerTransitionType.fadeThrough,
                    ],
                    children: [
                      Text('淡入'),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Text('淡出后淡入'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Navigator(
      // 添加[ValueKey]以确保更改类型时重新构建窗口小部件。
      key: ValueKey(_transitionType),
      onGenerateRoute: (settings) {
        return MaterialPageRoute<void>(
          builder: (context) => Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              title: Column(
                children: [
                  Text('容器转换'),
                  Text(
                    '(卡片、列表和FAB)',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.settings,
                  ),
                  onPressed: () {
                    _showSettingsBottomModalSheet(context);
                  },
                ),
              ],
            ),
            body: ListView(
              padding: const EdgeInsets.all(8),
              children: [
                _OpenContainerWrapper(
                  transitionType: _transitionType,
                  closedBuilder: (context, openContainer) {
                    return _DetailsCard(openContainer: openContainer);
                  },
                ),
                const SizedBox(height: 16),
                _OpenContainerWrapper(
                  transitionType: _transitionType,
                  closedBuilder: (context, openContainer) {
                    return _DetailsListTile(openContainer: openContainer);
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: _OpenContainerWrapper(
                        transitionType: _transitionType,
                        closedBuilder: (context, openContainer) {
                          return _SmallDetailsCard(
                            openContainer: openContainer,
                            subtitle: '副标题',
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: _OpenContainerWrapper(
                        transitionType: _transitionType,
                        closedBuilder: (context, openContainer) {
                          return _SmallDetailsCard(
                            openContainer: openContainer,
                            subtitle: '副标题',
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: _OpenContainerWrapper(
                        transitionType: _transitionType,
                        closedBuilder: (context, openContainer) {
                          return _SmallDetailsCard(
                            openContainer: openContainer,
                            subtitle: '副标题',
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: _OpenContainerWrapper(
                        transitionType: _transitionType,
                        closedBuilder: (context, openContainer) {
                          return _SmallDetailsCard(
                            openContainer: openContainer,
                            subtitle: '副标题',
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: _OpenContainerWrapper(
                        transitionType: _transitionType,
                        closedBuilder: (context, openContainer) {
                          return _SmallDetailsCard(
                            openContainer: openContainer,
                            subtitle: '副标题',
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                ...List.generate(10, (index) {
                  return OpenContainer<bool>(
                    ///容器关闭时的背景色。
                    ///当容器打开时，它将首先从该颜色过渡到[Colors.white]，然后在一个平滑动画中从该颜色过渡到[openColor]。
                    ///关闭容器后，它将通过[Colors.white]从[openColor]转换回该颜色。
                    ///默认为[Colors.white]。[Material.color]，用于实现此属性。
                    closedColor: Colors.white,
                    ///容器打开时的背景颜色。
                    ///当容器关闭时，它将首先从[closedColor]过渡到[Colors.white]，然后在一个平滑动画中从那里过渡到该颜色。
                    ///关闭容器后，它将通过[Colors.white]从此颜色转换回[closedColor]。
                    ///默认为[Colors.white]。[Material.color]，用于实现此属性。
                    openColor: Colors.white,
                    ///容器关闭时的高度。
                    ///当容器打开时，它将从此高程转换为[openElevation]。 当容器关闭时，它将从[openElevation]转换回此高度。
                    ///默认为1.0。 * [Material.elevation]，用于实现此属性。
                    closedElevation: 0,
                    closedShape: RoundedRectangleBorder(),
                    closedBuilder: (context, openContainer) => ListTile(
                        leading: Image.network(
                          'https://weiliicimg1.pstatp.com/weili/l/919773688945442906.webp',
                          width: 40,
                        ),
                        onTap: openContainer,
                        title: Text('列表项 ${index + 1}'),
                        subtitle: Text('副标题'),
                      ),
                    openBuilder: (context, openContainer) => _DetailsPage(),
                    ///是否可以点击整个封闭容器以打开它。
                    ///默认为true。
                    ///设置为false时，只能通过调用提供给[closedBuilder]的`action`回调来打开容器。
                    tappable: false,
                    ///使容器从封闭状态恢复到打开状态所需的时间，反之亦然。 默认为300ms。
                    transitionDuration: Duration(milliseconds: 300),
                    /// [OpenContainer]小部件的淡入淡出过渡类型。
                    ///这确定了传入和传出内容将使用的淡入淡出过渡的类型。
                    ///fade 使传入元素淡入到传出元素上方。
                    ///fadeThrough 首先淡出输出元素，一旦输出元素完全淡出，就开始使输入元素淡入。
                    transitionType: _transitionType,
                  );
                }),
              ],
            ),
            floatingActionButton: OpenContainer(
              transitionType: _transitionType,
              openBuilder: (context, openContainer) => const _DetailsPage(),
              closedElevation: 6,
              closedShape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(_fabDimension / 2),
                ),
              ),
              closedColor: colorScheme.secondary,
              closedBuilder: (context, openContainer) {
                return SizedBox(
                  height: _fabDimension,
                  width: _fabDimension,
                  child: Center(
                    child: Icon(
                      Icons.add,
                      color: colorScheme.onSecondary,
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class _OpenContainerWrapper extends StatelessWidget {
  const _OpenContainerWrapper({
    this.closedBuilder,
    this.transitionType,
  });

  final CloseContainerBuilder closedBuilder;
  final ContainerTransitionType transitionType;

  @override
  Widget build(BuildContext context) {
    return OpenContainer<bool>(
      transitionType: transitionType,
      openBuilder: (context, openContainer) => const _DetailsPage(),
      tappable: false,
      closedBuilder: closedBuilder,
    );
  }
}

class _DetailsCard extends StatelessWidget {
  const _DetailsCard({this.openContainer});

  final VoidCallback openContainer;

  @override
  Widget build(BuildContext context) {
    return _InkWellOverlay(
      openContainer: openContainer,
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              color: Colors.black38,
              child: Center(
                child: Image.network(
                  'https://weiliicimg1.pstatp.com/weili/l/919773688945442906.webp',
                  width: 100,
                ),
              ),
            ),
          ),
          ListTile(
            title: Text('标题'),
            subtitle: Text('副标题'),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 16,
            ),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur '
                  'adipiscing elit, sed do eiusmod tempor.',
              style: Theme.of(context).textTheme.bodyText2.copyWith(
                color: Colors.black54,
                inherit: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SmallDetailsCard extends StatelessWidget {
  const _SmallDetailsCard({
    this.openContainer,
    this.subtitle,
  });

  final VoidCallback openContainer;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return _InkWellOverlay(
      openContainer: openContainer,
      height: 225,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.black38,
            height: 150,
            child: Center(
              child: Image.network(
                'https://weiliicimg1.pstatp.com/weili/l/919773688945442906.webp',
                width: 80,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '标题',
                    style: textTheme.headline6,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    subtitle,
                    style: textTheme.caption,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailsListTile extends StatelessWidget {
  const _DetailsListTile({this.openContainer});

  final VoidCallback openContainer;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    const height = 120.0;

    return _InkWellOverlay(
      openContainer: openContainer,
      height: height,
      child: Row(
        children: [
          Container(
            color: Colors.black38,
            height: height,
            width: height,
            child: Center(
              child: Image.network(
                'https://weiliicimg1.pstatp.com/weili/l/919773688945442906.webp',
                width: 60,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '标题',
                    style: textTheme.subtitle1,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur '
                        'adipiscing elit,',
                    style: textTheme.caption,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InkWellOverlay extends StatelessWidget {
  const _InkWellOverlay({
    this.openContainer,
    this.width,
    this.height,
    this.child,
  });

  final VoidCallback openContainer;
  final double width;
  final double height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: InkWell(
        onTap: openContainer,
        child: child,
      ),
    );
  }
}

class _DetailsPage extends StatelessWidget {
  const _DetailsPage();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('详情页面'),
      ),
      body: ListView(
        children: [
          Container(
            color: Colors.black38,
            height: 250,
            child: Padding(
              padding: const EdgeInsets.all(70),
              child: Image.network(
                'https://weiliicimg1.pstatp.com/weili/l/919773688945442906.webp',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '标题',
                  style: textTheme.headline5.copyWith(
                    color: Colors.black54,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  _loremIpsumParagraph,
                  style: textTheme.bodyText2.copyWith(
                    color: Colors.black54,
                    height: 1.5,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

const String _loremIpsumParagraph =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod '
    'tempor incididunt ut labore et dolore magna aliqua. Vulputate dignissim '
    'suspendisse in est. Ut ornare lectus sit amet. Eget nunc lobortis mattis '
    'aliquam faucibus purus in. Hendrerit gravida rutrum quisque non tellus '
    'orci ac auctor. Mattis aliquam faucibus purus in massa. Tellus rutrum '
    'tellus pellentesque eu tincidunt tortor. Nunc eget lorem dolor sed. Nulla '
    'at volutpat diam ut venenatis tellus in metus. Tellus cras adipiscing enim '
    'eu turpis. Pretium fusce id velit ut tortor. Adipiscing enim eu turpis '
    'egestas pretium. Quis varius quam quisque id. Blandit aliquam etiam erat '
    'velit scelerisque. In nisl nisi scelerisque eu. Semper risus in hendrerit '
    'gravida rutrum quisque. Suspendisse in est ante in nibh mauris cursus '
    'mattis molestie. Adipiscing elit duis tristique sollicitudin nibh sit '
    'amet commodo nulla. Pretium viverra suspendisse potenti nullam ac tortor '
    'vitae.\n'
    '\n'
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod '
    'tempor incididunt ut labore et dolore magna aliqua. Vulputate dignissim '
    'suspendisse in est. Ut ornare lectus sit amet. Eget nunc lobortis mattis '
    'aliquam faucibus purus in. Hendrerit gravida rutrum quisque non tellus '
    'orci ac auctor. Mattis aliquam faucibus purus in massa. Tellus rutrum '
    'tellus pellentesque eu tincidunt tortor. Nunc eget lorem dolor sed. Nulla '
    'at volutpat diam ut venenatis tellus in metus. Tellus cras adipiscing enim '
    'eu turpis. Pretium fusce id velit ut tortor. Adipiscing enim eu turpis '
    'egestas pretium. Quis varius quam quisque id. Blandit aliquam etiam erat '
    'velit scelerisque. In nisl nisi scelerisque eu. Semper risus in hendrerit '
    'gravida rutrum quisque. Suspendisse in est ante in nibh mauris cursus '
    'mattis molestie. Adipiscing elit duis tristique sollicitudin nibh sit '
    'amet commodo nulla. Pretium viverra suspendisse potenti nullam ac tortor '
    'vitae';
