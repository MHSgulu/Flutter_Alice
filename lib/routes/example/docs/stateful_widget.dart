import 'package:flutter/material.dart';

///具有可变状态的小部件。
///
/// 状态是在构建窗口小部件时可以同步读取的信息，并且在窗口小部件的生存期内可能会发生变化。
/// 小部件实现者有责任使用State.setState确保在状态改变时及时通知该状态。
///
/// 有状态窗口小部件是通过构建其他更具体描述用户界面的窗口小部件的星座来描述用户界面的一部分的窗口小部件。
/// 构建过程将以递归方式继续进行，直到用户界面的描述完全具体为止（例如，完全由描述具体RenderObject的RenderObjectWidget组成）。
///
/// 当您要描述的用户界面部分可以动态更改时，
/// 例如，状态控件将很有用。由于具有内部时钟驱动状态，或取决于某些系统状态。对于仅依赖于对象本身中的配置信息以及使小部件膨胀的BuildContext的合成，请考虑使用StatelessWidget。
///
/// StatefulWidget实例本身是不可变的，并将其可变状态存储在由createState方法创建的单独的State对象中，或存储在该State所预订的对象中，
/// 例如Stream或ChangeNotifier对象，引用存储在StatefulWidget的最终字段中本身。
///
/// 该框架在每次充气StatefulWidget时都会调用createState，这意味着如果该StatefulWidget已在多个位置插入到树中，则可能会将多个State对象与同一个StatefulWidget关联。
/// 同样，如果将StatefulWidget从树中删除并随后再次插入到树中，则框架将再次调用createState来创建新的State对象，从而简化State对象的生命周期。
///
/// 如果StatefulWidget的创建者使用GlobalKey作为键，则从树中的一个位置移动到另一个位置时，StatefulWidget会保留相同的State对象。
/// 因为具有GlobalKey的窗口小部件最多可以在树中的一个位置使用，所以使用GlobalKey的窗口小部件最多具有一个关联的元素。
/// 当将具有全局键的小部件从树中的一个位置移动到另一位置时， 该框架通过将与该小部件关联的（唯一）子树从旧位置移植到新位置（而不是在该位置重新创建子树），来利用此属性。新位置）。
/// 与StatefulWidget关联的State对象将与子树的其余部分一起移植，这意味着State对象在新位置中被重用（而不是重新创建）。
/// 但是，为了有资格进行嫁接，必须将小部件插入从原来位置移除的同一动画帧中的新位置。
///
/// 性能考量
/// StatefulWidgets有两个主要类别。
///
/// 第一个是在State.initState中分配资源并将其在State.dispose中处置的资源，但是它不依赖于InheritedWidgets或调用State.setState。
/// 此类小部件通常在应用程序或页面的根部使用，并通过ChangeNotifiers，Streams或其他此类对象与子小部件通信。
/// 遵循这种模式的有状态的小部件相对便宜（就CPU和GPU周期而言），因为它们一旦构建就永远不会更新。因此，它们可能具有一些复杂且深入的构建方法。
///
/// 第二类是使用State.setState或依赖于InheritedWidgets的小部件。
/// 这些通常会在应用程序的生命周期内多次重建，因此，将重建此类小部件的影响降至最低至关重要。
/// （它们也可以使用State.initState或State.didChangeDependencies并分配资源，但重要的是它们可以重建。）
///
/// 可以使用几种技术来最大程度地减少重建有状态的小部件的影响：
///
/// 1、把状态推到叶子上。
/// 例如，如果您的页面上有一个滴答时钟，而不是每次在时钟滴答时都将状态置于页面顶部并重新构建整个页面，则创建一个专用的时钟小部件，该小部件仅自我更新。
///
/// 2、最小化由build方法及其创建的任何小部件临时创建的节点数。
/// 理想情况下，有状态小部件将仅创建一个小部件，而该小部件将是RenderObjectWidget。
/// （显然，这并不总是可行的，但是小部件越接近于这种理想状态，效率就越高。）
///
/// 3、如果子树没有更改，请缓存代表该子树的小部件，并在每次可使用时重新使用它。
/// 与重新创建新的（但配置相同）的窗口小部件相比，重新使用窗口小部件的效率要高得多。
/// 将有状态部分分解为带有子参数的小部件是执行此操作的一种常用方法。
///
/// 4、尽可能使用const小部件。 （这等效于缓存小部件并重新使用它。）
///
/// 5、避免更改任何创建的子树的深度或更改子树中任何小部件的类型。
/// 例如，不要返回子项或包裹在IgnorePointer中的子项，而应始终将子窗口小部件包装在IgnorePointer中并控制IgnorePointer.ignoring属性。
/// 这是因为更改子树的深度需要重建，布局和绘制整个子树，而仅更改属性将要求对渲染树的更改最少
/// （例如，在IgnorePointer的情况下，不进行布局或重新绘制） 是完全必要的）。
///
/// 6、如果由于某种原因必须更改深度，请考虑将子树的公共部分包装在具有GlobalKey且在有状态小部件的生命周期中保持一致的小部件中。
/// （如果无法方便地为其他小部件分配键，则KeyedSubtree小部件可能对此有用。）

//Sample
class YellowBird extends StatefulWidget {
  const YellowBird({ Key key }) : super(key: key);

  @override
  _YellowBirdState createState() => _YellowBirdState();
}

class _YellowBirdState extends State<YellowBird> {
  @override
  Widget build(BuildContext context) {
    return Container(color: const Color(0xFFFFE306));
  }
}

//Sample
class Bird extends StatefulWidget {
  const Bird({
    Key key,
    this.color = const Color(0xFFFFE306),
    this.child,
  }) : super(key: key);

  final Color color;
  final Widget child;

  _BirdState createState() => _BirdState();
}

class _BirdState extends State<Bird> {
  double _size = 1.0;

  void grow() {
    setState(() { _size += 0.1; });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.color,
      transform: Matrix4.diagonal3Values(_size, _size, 1.0),
      child: widget.child,
    );
  }
}


///setState方法
/**
 * 通知框架该对象的内部状态已更改。

    每当您更改State对象的内部状态时，请在传递给setState的函数中进行更改：

    setState(() { _myState = newValue; });
    提供的回调将立即被同步调用。它一定不能返回Future（回调不能为async），因为从那时起，实际上何时设置状态还不清楚。

    调用setState会通知框架此对象的内部状态已更改，该方式可能会影响此子树中的用户界面，这会导致框架为该State 对象安排构建。

    如果仅在不调用setState的情况下直接更改状态，则框架可能不会安排构建，并且该子树的用户界面可能不会更新以反映新状态。

    通常，建议setState仅将该方法用于包装对状态的实际更改，而不是用于可能与更改相关联的任何计算。
    例如，在这里，构建 函数使用的值将递增，然后将更改写入磁盘，但仅将增量包装在setState：中：

    Future<void> _incrementCounter() async {
    setState(() {
    _counter++;
    });
    Directory directory = await getApplicationDocumentsDirectory();
    final String dirName = directory.path;
    await File('$dir/counter.txt').writeAsString('$_counter');
    }
    在框架调用dispose之后调用此方法是错误的。您可以通过检查mounted属性是否为true来确定调用此方法是否合法。
 */

