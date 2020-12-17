import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

class SharedXAxisTransitionDemo extends StatefulWidget {
  const SharedXAxisTransitionDemo();
  @override
  _SharedXAxisTransitionDemoState createState() =>
      _SharedXAxisTransitionDemoState();
}

class _SharedXAxisTransitionDemoState extends State<SharedXAxisTransitionDemo> {
  bool _isLoggedIn = false;

  void _toggleLoginStatus() {
    setState(() {
      _isLoggedIn = !_isLoggedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Column(
          children: [
            Text('共用X轴'),
            Text(
              '“继续”和“返回”按钮',
              style: Theme.of(context)
                  .textTheme
                  .subtitle2
                  .copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageTransitionSwitcher(
                duration: Duration(milliseconds: 500),
                reverse: !_isLoggedIn,
                transitionBuilder: (
                    child,
                    animation,
                    secondaryAnimation,
                    ) {
                  return SharedAxisTransition(
                    child: child,
                    animation: animation,
                    secondaryAnimation: secondaryAnimation,
                    transitionType: SharedAxisTransitionType.horizontal,
                  );
                },
                child: _isLoggedIn ? const _CoursePage() : const _SignInPage(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: _isLoggedIn ? _toggleLoginStatus : null,
                    child: Text('返回'),
                  ),
                  ElevatedButton(
                    onPressed: _isLoggedIn ? null : _toggleLoginStatus,
                    child: Text('继续'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CoursePage extends StatelessWidget {
  const _CoursePage();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 16),
        Text(
          '将课程化繁为简',
          style: Theme.of(context).textTheme.headline5,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            '在您的Feed中，捆绑式类别会显示未群组。您以后可随时进行更改',
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        _CourseSwitch(course: '艺术与手工艺'),
        _CourseSwitch(course: '商务'),
        _CourseSwitch(course: '插图'),
        _CourseSwitch(course: '设计'),
        _CourseSwitch(course: '烹饪'),
      ],
    );
  }
}

class _CourseSwitch extends StatefulWidget {
  const _CourseSwitch({
    this.course,
  });

  final String course;

  @override
  _CourseSwitchState createState() => _CourseSwitchState();
}

class _CourseSwitchState extends State<_CourseSwitch> {
  bool _isCourseBundled = true;

  @override
  Widget build(BuildContext context) {
    final subtitle = _isCourseBundled
        ? '捆绑课程'
        : '单独显示课程';

    return SwitchListTile(
      title: Text(widget.course),
      subtitle: Text(subtitle),
      value: _isCourseBundled,
      onChanged: (newValue) {
        setState(() {
          _isCourseBundled = newValue;
        });
      },
    );
  }
}

class _SignInPage extends StatelessWidget {
  const _SignInPage();

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      builder: (context, constraints) {
        final maxHeight = constraints.maxHeight;
        final spacing = SizedBox(height: maxHeight / 25);

        return Column(
          children: [
            SizedBox(height: maxHeight / 10),
            Icon(Icons.account_circle_rounded,size: 80,color: Colors.grey,),
            spacing,
            Text(
              'Master，您好',
              style: Theme.of(context).textTheme.headline5,
            ),
            spacing,
            Text(
              '使用您的的账号登录',
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    top: 40,
                    start: 15,
                    end: 15,
                    bottom: 10,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      suffixIcon: const Icon(
                        Icons.visibility,
                        size: 20,
                        color: Colors.black54,
                      ),
                      isDense: true,
                      labelText: '电子邮件地址或电话号码',
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 10),
                  child: TextButton(
                    onPressed: () {},
                    child: Text('忘记了电子邮件地址'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 10),
                  child: TextButton(
                    onPressed: () {},
                    child: Text('创建账号'),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

