import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class ExampleSwitchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ExampleSwitchPageState();
}

class _ExampleSwitchPageState extends State<ExampleSwitchPage> {
  static final List<bool> options = [false, true, false, true, true];
  bool _snapToEnd = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: options
                  // 该映射使用此列表的索引作为键，并使用相应的对象作为值。Map.keys` [Iterable]以数字顺序迭代此列表的索引。
                  .asMap()
                  //返回一个新的map，其中此map的所有项都由给定的[f]函数转换。
                  .map((i, isOn) {
                    //用[键]和[值]创建一个条目。 *
                    return MapEntry(
                        i,
                        SmileySwitch(isOn,
                            snapToEnd: _snapToEnd,
                            onToggle: () => setState(
                                  () {
                                    _snapToEnd = false;
                                    options[i] = !isOn;
                                  },
                                )));
                  })
                  //这些值按照其相应键的顺序进行迭代。这意味着并行迭代[键]和[值]将提供匹配的键和值对。
                  .values
                  //创建一个包含此[Iterable]元素的[List]。元素按迭代顺序排列。如果[growable]为false，则列表为固定长度。
                  .toList()
                  //返回此列表的视图作为[R]实例的列表。
                  //如果此列表仅包含[R]的实例，则所有读取操作将正常运行。
                  // 如果任何操作尝试访问不是[R]实例的元素，则将抛出该访问。
                  // 添加到列表中的元素（例如，通过使用[add]或[addAll]）必须是[R]的实例才能是添加函数的有效参数
                  // 并且它们也必须是[E]的实例才能被此列表接受 也一样
                  // 通常实现为List.castFrom <E，R>（this）。
                  .cast<Widget>() +
              [
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: Colors.pinkAccent,
                  child: const Text('Back'),
                )
              ],
        ),
      ),
    );
  }
}

class SmileySwitch extends StatelessWidget {
  final bool isOn;
  final VoidCallback onToggle;
  final bool snapToEnd;

  SmileySwitch(this.isOn, {this.snapToEnd, this.onToggle});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onToggle,
        child: Container(
            width: 200,
            height: 100,
            child: FlareActor(
              "assets/animations/smiley_switch.flr",
              snapToEnd: snapToEnd,
              animation: isOn ? "On" : "Off",
            )));
  }
}
