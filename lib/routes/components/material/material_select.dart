import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';

class MaterialSelect extends StatefulWidget {
  @override
  _MaterialSelectState createState() => _MaterialSelectState();
}

class _MaterialSelectState extends State<MaterialSelect> {
  int _value = 1;
  List<bool> checked = [true, true, false, false, true];
  bool valued = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: '选择控件',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(8, 20, 0, 20),
        child: Column(
          children: [
            Text('单选按钮'),
            ///以下示例显示了禁用最后一行的列表中使用的单选按钮。
            Column(
              children: <Widget>[
                for (int i = 1; i <= 5; i++)
                  ListTile(
                    title: Text(
                      'Radio $i',
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                          color: i == 5 ? Colors.black38 : Colors.black),
                    ),
                    leading: Radio(
                      value: i,
                      groupValue: _value,
                      activeColor: Color(0xFF6200EE),
                      onChanged: i == 5
                          ? null
                          : (int value) {
                              setState(() {
                                _value = value;
                              });
                            },
                    ),
                  ),
              ],
            ),
            SizedBox(height: 20),
            Text('复选框'),
            Column(
              children: [
                for (var i = 0; i < 5; i += 1)
                  Row(
                    children: [
                      Checkbox(
                        onChanged: i == 4
                            ? null
                            : (bool value) {
                                setState(() {
                                  checked[i] = value;
                                });
                              },
                        tristate: i == 1,
                        value: checked[i],
                        activeColor: Color(0xFF6200EE),
                      ),
                      Text(
                        'Checkbox ${i + 1}',
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                            color: i == 4 ? Colors.black38 : Colors.black),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
              ],
            ),
            SizedBox(height: 20),
            Text('开关'),
            ///材料设计开关。
            ///
            ///用于切换单个设置的开/关状态。
            ///
            ///开关本身不保持任何状态。相反，当开关的状态更改时，小部件将调用[onChanged]回调。
            ///大多数使用开关的小部件将侦听[onChanged]回调，并使用新的[value]重建开关以更新开关的外观。
            ///
            ///如果[onChanged]回调为null，则该开关将被禁用（它将不响应输入）。
            ///默认情况下，禁用的开关的拇指和轨迹显示为灰色阴影。
            ///禁用开关的默认外观可以用[inactiveThumbColor]和[inactiveTrackColor]覆盖。
            ///
            ///要求其祖先之一是[Material]小部件。
            ///
            /// 也可以看看：
            ///
            /// * [SwitchListTile]，它将此小部件与[ListTile]组合在一起，以便您可以给交换机添加标签。
            /// * [Checkbox]，另一个具有类似语义的小部件。
            /// * [Radio]，用于在一组显式值之间进行选择。
            /// * [Slider]，用于选择范围内的值。
            /// * <https://material.io/design/components/selection-controls.html#switches>
            Switch(
              value: valued,
              onChanged: (value) {
                setState(() {
                  valued = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
