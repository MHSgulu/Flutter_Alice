import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:sticky_headers/sticky_headers.dart';

class StickyHeadersExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      title: 'Sticky Headers Example',
      child: ListView(
        children: ListTile.divideTiles(
          context: context,
          tiles: <Widget>[
            ListTile(
              title: const Text('Example 1 - Headers and Content'),
              onTap: () => navigateTo(context, (context) => Example1()),
            ),
            ListTile(
              title: const Text('Example 2 - Animated Headers with Content'),
              onTap: () => navigateTo(context, (context) => Example2()),
            ),
            ListTile(
              title: const Text('Example 3 - Headers overlapping the Content'),
              onTap: () => navigateTo(context, (context) => Example3()),
            ),
            ListTile(
              title: const Text('Example 4 - Example using scroll controller'),
              onTap: () => navigateTo(context, (context) => Example4()),
            ),
          ],
        ).toList(growable: false),
      ),
    );
  }

  navigateTo(BuildContext context, builder(BuildContext context)) {
    Navigator.of(context).push(MaterialPageRoute(builder: builder));
  }
}

class Example1 extends StatelessWidget {
  const Example1({
    Key key,
    this.controller,
  }) : super(key: key);

  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      title: 'Example 1',
      child: ListView.builder(
        controller: controller,
        itemBuilder: (context, index) {
          return Material(
            color: Colors.grey[300],
            child: StickyHeader(
              controller: controller, // Optional
              header: Container(
                height: 50.0,
                color: Colors.blueGrey[700],
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Header #$index',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              content: Container(
                child: Image.network(imageForIndex(index), fit: BoxFit.cover, width: double.infinity, height: 200.0),
              ),
            ),
          );
        },
      ),
    );
  }

  String imageForIndex(int index) {
    return Images.imageThumbUrls[index % Images.imageThumbUrls.length];
  }
}

class Example2 extends StatelessWidget {
  const Example2({
    Key key,
    this.controller,
  }) : super(key: key);

  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      title: 'Example 2',
      child: ListView.builder(
        controller: controller,
        itemBuilder: (context, index) {
          return Material(
            color: Colors.grey[300],
            child: StickyHeaderBuilder(
              controller: controller, // Optional
              builder: (BuildContext context, double stuckAmount) {
                stuckAmount = 1.0 - stuckAmount.clamp(0.0, 1.0);
                return Container(
                  height: 50.0,
                  color: Color.lerp(Colors.blue[700], Colors.red[700], stuckAmount),
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'Header #$index',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      Offstage(
                        offstage: stuckAmount <= 0.0,
                        child: Opacity(
                          opacity: stuckAmount,
                          child: IconButton(
                            icon: Icon(Icons.favorite, color: Colors.white),
                            onPressed: () =>
                                Scaffold.of(context).showSnackBar(SnackBar(content: Text('Favorite #$index'))),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              content: Container(
                child: Image.network(imageForIndex(index), fit: BoxFit.cover, width: double.infinity, height: 200.0),
              ),
            ),
          );
        },
      ),
    );
  }

  String imageForIndex(int index) {
    return Images.imageThumbUrls[index % Images.imageThumbUrls.length];
  }
}

class Example3 extends StatelessWidget {
  const Example3({
    Key key,
    this.controller,
  }) : super(key: key);

  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      title: 'Example 3',
      child: ListView.builder(
        controller: controller,
        itemBuilder: (context, index) {
          return Material(
            color: Colors.grey[300],
            child: StickyHeaderBuilder(
              overlapHeaders: true,
              controller: controller, // Optional
              builder: (BuildContext context, double stuckAmount) {
                stuckAmount = 1.0 - stuckAmount.clamp(0.0, 1.0);
                return Container(
                  height: 50.0,
                  color: Colors.grey[900].withOpacity(0.6 + stuckAmount * 0.4),
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Header #$index',
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              },
              content: Container(
                child: Image.network(
                  imageForIndex(index),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200.0,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  String imageForIndex(int index) {
    return Images.imageThumbUrls[index % Images.imageThumbUrls.length];
  }
}

class ScaffoldWrapper extends StatelessWidget {
  final Widget child;
  final String title;

  const ScaffoldWrapper({
    Key key,
    @required this.title,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Hero(
          tag: 'app_bar',
          child: AppBar(
            title: Text(title),
            elevation: 0.0,
          ),
        ),
      ),
      body: child,
    );
  }
}

class Example4 extends StatefulWidget {
  @override
  _Example4State createState() => _Example4State();
}

class _Example4State extends State<Example4> {
  final controller = ScrollController();

  final _tabs = <String, WidgetBuilder>{};

  @override
  void initState() {
    super.initState();
    _tabs.addAll({
      'Example 1': (context) => Example1(controller: controller),
      'Example 2': (context) => Example2(controller: controller),
      'Example 3': (context) => Example3(controller: controller),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: DefaultTabController(
        length: _tabs.length,
        child: NestedScrollView(
          controller: controller,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  title: const Text('Example 4'),
                  pinned: true,
                  expandedHeight: 150.0,
                  forceElevated: innerBoxIsScrolled,
                  bottom: TabBar(
                    tabs: <Tab>[
                      ..._tabs.entries.map<Tab>((MapEntry<String, WidgetBuilder> entry) {
                        return Tab(text: entry.key);
                      }),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: <Widget>[
              ..._tabs.entries.map<Widget>((MapEntry<String, WidgetBuilder> entry) {
                return SafeArea(
                  top: false,
                  bottom: false,
                  child: Builder(
                    builder: (BuildContext context) {
                      return KeyedSubtree(
                        key: PageStorageKey<String>(entry.key),
                        child: entry.value(context),
                      );
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class Images {
  /// http://www.flickr.com/photos/romainguy
  static List<String> imageUrls = [
    'https://icweiliimg6.pstatp.com/weili/l/919795258271596547.webp', //插画
    'https://icweiliimg1.pstatp.com/weili/l/913146374019088384.webp', //红色机器人独自站在机械墓地的奇幻风景
    'https://icweiliimg1.pstatp.com/weili/l/903658980241571862.webp', //在地狱中用他的魔法漂浮的死亡数字艺术风格
    'https://icweiliimg9.pstatp.com/weili/l/903733240221532175.webp', //年轻女子为魔法树弹吉他，星轨和天空中的月亮，数字艺术风格
    'https://weiliicimg6.pstatp.com/weili/l/903097215699910793.webp', //戴着虚拟现实耳机的男人触摸自己的粒子
    'https://icweiliimg1.pstatp.com/weili/l/903431965445586961.webp', //男子手持红烟信号弹腾空而起，与天启世界对峙，数码艺术风格
    'https://weiliicimg6.pstatp.com/weili/l/919779495736508463.webp', //巫师工作人员用他的魔法点燃灯塔的人
    'https://icweiliimg1.pstatp.com/weili/l/903487834380173423.webp', //站在通往天空的破楼梯上的年轻女子，数字艺术风格
    'https://weiliicimg6.pstatp.com/weili/l/912724883108921353.webp', //破楼飞鸟的超现实场景光
    'https://icweiliimg1.pstatp.com/weili/l/903129256155938931.webp', //太空中的奇幻桥段3D渲染
    'https://icweiliimg9.pstatp.com/weili/l/919798058585161797.webp', //科幻神奇的景观
    'https://icweiliimg1.pstatp.com/weili/l/919767315209257008.webp', //魔法师与龙
    'https://icweiliimg9.pstatp.com/weili/l/900993824183025685.webp', //科幻概念，展示一个站在未来主义门户的男人，数字艺术风格
    'https://icweiliimg6.pstatp.com/weili/l/903299654683066410.webp', //有大气层和月球的太阳系外行星
    'https://icweiliimg1.pstatp.com/weili/l/915011343308685373.webp', //幻想之地城堡的抽象数字插图
    'https://icweiliimg6.pstatp.com/weili/l/904638653692641357.webp', //3d渲染空间艺术：外星星球-奇幻景观
    'https://weiliicimg1.pstatp.com/weili/l/919853987649290287.webp', //酷炫的三角形未来主义科幻技术灯
    'https://icweiliimg1.pstatp.com/weili/l/903744905357295642.webp', //站在银河裂缝中间的抽象独特的年轻女人
    'https://weiliicimg9.pstatp.com/weili/l/919768062538678320.webp', //黑色独角兽上的未来主义骑士进入破碎的门户到另一个世界
    'https://icweiliimg1.pstatp.com/weili/l/903686210335015059.webp', //世界崩溃，末日场景，数码绘画
  ];

  static List<String> imageThumbUrls = [
    'https://icweiliimg6.pstatp.com/weili/l/919795258271596547.webp', //插画
    'https://icweiliimg1.pstatp.com/weili/l/913146374019088384.webp', //红色机器人独自站在机械墓地的奇幻风景
    'https://icweiliimg1.pstatp.com/weili/l/903658980241571862.webp', //在地狱中用他的魔法漂浮的死亡数字艺术风格
    'https://icweiliimg9.pstatp.com/weili/l/903733240221532175.webp', //年轻女子为魔法树弹吉他，星轨和天空中的月亮，数字艺术风格
    'https://weiliicimg6.pstatp.com/weili/l/903097215699910793.webp', //戴着虚拟现实耳机的男人触摸自己的粒子
    'https://icweiliimg1.pstatp.com/weili/l/903431965445586961.webp', //男子手持红烟信号弹腾空而起，与天启世界对峙，数码艺术风格
    'https://weiliicimg6.pstatp.com/weili/l/919779495736508463.webp', //巫师工作人员用他的魔法点燃灯塔的人
    'https://icweiliimg1.pstatp.com/weili/l/903487834380173423.webp', //站在通往天空的破楼梯上的年轻女子，数字艺术风格
    'https://weiliicimg6.pstatp.com/weili/l/912724883108921353.webp', //破楼飞鸟的超现实场景光
    'https://icweiliimg1.pstatp.com/weili/l/903129256155938931.webp', //太空中的奇幻桥段3D渲染
    'https://icweiliimg9.pstatp.com/weili/l/919798058585161797.webp', //科幻神奇的景观
    'https://icweiliimg1.pstatp.com/weili/l/919767315209257008.webp', //魔法师与龙
    'https://icweiliimg9.pstatp.com/weili/l/900993824183025685.webp', //科幻概念，展示一个站在未来主义门户的男人，数字艺术风格
    'https://icweiliimg6.pstatp.com/weili/l/903299654683066410.webp', //有大气层和月球的太阳系外行星
    'https://icweiliimg1.pstatp.com/weili/l/915011343308685373.webp', //幻想之地城堡的抽象数字插图
    'https://icweiliimg6.pstatp.com/weili/l/904638653692641357.webp', //3d渲染空间艺术：外星星球-奇幻景观
    'https://weiliicimg1.pstatp.com/weili/l/919853987649290287.webp', //酷炫的三角形未来主义科幻技术灯
    'https://icweiliimg1.pstatp.com/weili/l/903744905357295642.webp', //站在银河裂缝中间的抽象独特的年轻女人
    'https://weiliicimg9.pstatp.com/weili/l/919768062538678320.webp', //黑色独角兽上的未来主义骑士进入破碎的门户到另一个世界
    'https://icweiliimg1.pstatp.com/weili/l/903686210335015059.webp', //世界崩溃，末日场景，数码绘画
  ];
}