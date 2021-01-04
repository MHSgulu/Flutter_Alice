import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

//如果你喜欢在 Flutter 上拥有好看的屏幕，想像一下拥有可滑动的屏幕会有多棒！
// 使用 PageView 和 PageController 能更容易创建一系列使用者可以自由垂直向与水平向滑动的屏幕。现在就试一试！
/// {@youtube 560 315 https://www.youtube.com/watch?v=J1gE9xvph-A}

///一个可滚动的列表，逐页工作。
///
///页面视图的每个子视图都必须与视口具有相同的大小。
///
///您可以使用[PageController]控制哪个页面在视图中可见。
///除了可以控制[PageView]内部内容的像素偏移量之外，[PageController]还可以让您控制页面偏移量，即页面视口大小的增量。
///
/// [PageController]也可以用于控制[PageController.initialPage]和[PageController.viewportFraction]，
/// 该页面确定首次构造[PageView]时显示哪个页面，该页面确定页面的大小视口大小的一部分。
///
/// 也可以看看：
///
/// * [PageController]，它控制在视图中可见的页面。
/// * [SingleChildScrollView]，当您需要使单个孩子可滚动时。
/// * [ListView]，用于可滚动的框列表。
/// * [GridView]，用于框的可滚动网格。
/// * [ScrollNotification]和[NotificationListener]，可用于查看滚动位置，而无需使用[ScrollController]。

class PageViewDemo extends StatefulWidget {
  @override
  _PageViewDemoState createState() => _PageViewDemoState();
}

class _PageViewDemoState extends State<PageViewDemo> {
  PageController _pageController;

  @override
  void initState() {
    /// [PageView]的控制器。
    ///
    ///使用页面控制器，您可以操纵哪个页面在[PageView]中可见。
    ///
    ///除了可以控制[PageView]内部内容的像素偏移量之外，[PageController]还可以让您控制页面偏移量，即页面视口大小的增量。
    ///
    /// 也可以看看：
    ///
    /// * [PageView]，它是此对象控制的小部件。

    ///创建一个页面控制器。
    /// [initialPage]，[keepPage]和[viewportFraction]参数不能为null。
    _pageController = PageController(
      initialPage: 0,
      keepPage: true,
      viewportFraction: 1.0,
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'PageView',
        onPressedBack: () => Navigator.pop(context),
      ),

      ///创建一个可滚动的列表，该列表从显式的[List]小部件中逐页工作。
      ///此构造函数适用于具有少量子级的页面视图，因为构造[List]要求对可能在页面视图中显示的每个子级进行工作，而不是仅实际可见的那些子级。
      /// [allowImplicitScrolling]参数不能为null。 如果为true，则[PageView]将更像[ListView]一样参与可访问性滚动，其中隐式滚动动作将移至下一页而不是[PageView]的内容。
      body: PageView(
        ///页面视图沿其滚动的轴。
        ///默认为[Axis.horizontal]。
        scrollDirection: Axis.horizontal,
        ///页面视图是否沿阅读方向滚动。
        ///例如，如果读取方向是从左到右，并且[scrollDirection]是[Axis.horizontal]，则当[reverse]为false时，页面视图从左向右滚动；当[reverse]为true时，页面视图从右向左滚动 。
        ///同样，如果[scrollDirection]为[Axis.vertical]，则当[reverse]为false时，页面视图从顶部滚动到底部，而当[reverse]为true时，页面视图从底部滚动到顶部。
        ///默认为false。
        reverse: false,
        controller: _pageController,
        ///页面视图应如何响应用户输入。
        ///例如，确定用户停止拖动页面视图后页面视图如何继续进行动画处理。
        ///在使用之前，已使用[PageScrollPhysics]修改了物理特性以捕捉到页面边界。
        ///默认为匹配的平台约定。
        physics: PageScrollPhysics(),
        ///设置为false以禁用页面捕捉，这对于自定义滚动行为很有用。
        pageSnapping: true,
        onPageChanged: (value){
          Fluttertoast.showToast(msg: '当前page: ${value + 1}');
        },
        children: [
          Container(
            color: Colors.cyan,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  ///是否有任何[ScrollPosition]对象已使用[attach]方法将自身附加到[ScrollController]。
                  ///如果为假，则不得调用与[ScrollPosition]交互的成员，例如[position]，[offset]，[animateTo]和[jumpTo]。
                  if (_pageController.hasClients) {
                    _pageController.animateToPage(
                      1,
                      duration: Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                child: Text('下一页'),
              ),
            ),
          ),
          Container(
            color: Colors.teal,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_pageController.hasClients) {
                    ///使从当前页面到给定页面的[PageView]受控动画。
                    ///动画持续给定的持续时间，并遵循给定的曲线。
                    ///返回的[Future]在动画完成时解析。
                    ///`duration`和`curve`参数不能为null。
                    _pageController.animateToPage(
                      0,
                      duration: Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                child: Text('上一页'),
              ),
            ),
          ),
          Container(
            color: Colors.lime,
            child: Center(
              child: Text('view 3'),
            ),
          ),
        ],

        ///控制小部件的页面是否响应[RenderObject.showOnScreen]，这将允许隐式可访问性滚动。
        ///将此标志设置为false时，当可访问性焦点到达当前页面的末尾并且用户尝试将其移动到下一个元素时，焦点将遍历页面视图之外的下一个小部件。
        ///将此标志设置为true时，当可访问性焦点到达当前页面的末尾并且用户尝试将其移动到下一个元素时，焦点将遍历页面视图中的下一页。
        allowImplicitScrolling: false,
      ),
    );
  }
}
