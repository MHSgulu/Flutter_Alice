import 'dart:math';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

class SharedYAxisTransitionDemo extends StatefulWidget {
  const SharedYAxisTransitionDemo({Key key}) : super(key: key);

  @override
  _SharedYAxisTransitionDemoState createState() =>
      _SharedYAxisTransitionDemoState();
}

class _SharedYAxisTransitionDemoState extends State<SharedYAxisTransitionDemo>
    with SingleTickerProviderStateMixin {
  bool _isAlphabetical = false;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  final _recentList = ListView(
    // Adding [UniqueKey] to make sure the widget rebuilds when transitioning.
    key: UniqueKey(),
    children: [
      for (int i = 0; i < 10; i++) _AlbumTile((i + 1).toString()),
    ],
  );

  final _alphabeticalList = ListView(
    // Adding [UniqueKey] to make sure the widget rebuilds when transitioning.
    key: UniqueKey(),
    children: [
      for (final letter in _alphabet) _AlbumTile(letter),
    ],
  );

  static const _alphabet = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Column(
          children: [
            Text('共用Y轴'),
            Text(
              '按“最近播放”排序',
              style: Theme.of(context)
                  .textTheme
                  .subtitle2
                  .copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text('268个专辑'),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 7),
                child: InkWell(
                  customBorder: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(_isAlphabetical
                          ? '最近播放'
                          : '按字母升序排列(A-Z)'
                      ),
                      RotationTransition(
                        turns: Tween(begin: 0.0, end: 1.0)
                            .animate(_controller.view),
                        child: const Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                  onTap: () {
                    if (!_isAlphabetical) {
                      _controller.reset();
                      _controller.animateTo(0.5);
                    } else {
                      _controller.animateTo(1);
                    }
                    setState(() {
                      _isAlphabetical = !_isAlphabetical;
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Container(
              child: PageTransitionSwitcher(
                reverse: _isAlphabetical,
                transitionBuilder: (child, animation, secondaryAnimation) {
                  return SharedAxisTransition(
                    child: child,
                    animation: animation,
                    secondaryAnimation: secondaryAnimation,
                    transitionType: SharedAxisTransitionType.vertical,
                  );
                },
                child: _isAlphabetical ? _alphabeticalList : _recentList,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AlbumTile extends StatelessWidget {
  const _AlbumTile(this._title);
  final String _title;

  @override
  Widget build(BuildContext context) {
    final randomNumberGenerator = Random();

    return Column(
      children: [
        ListTile(
          leading: Container(
            height: 60,
            width: 60,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(4),
              ),
              color: Colors.grey,
            ),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Image.network('https://weiliicimg1.pstatp.com/weili/l/919773688945442906.webp',),
            ),
          ),
          title: Text(
            '专辑 $_title',
          ),
          subtitle: Text('音乐人'),
          trailing: Text(
            '${(randomNumberGenerator.nextInt(50) + 10).toString()} 分钟',
          ),
        ),
        const Divider(height: 20, thickness: 1),
      ],
    );
  }
}

