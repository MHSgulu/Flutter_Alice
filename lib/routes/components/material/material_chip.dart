import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';

///材料设计芯片。
///
///筹码是表示属性，文本，实体或动作的紧凑元素。
///
///提供非null [onDeleted]回调将使芯片包括用于删除芯片的按钮。
///
///它的祖先必须包括[Material]，[MediaQuery]，[Directionality]和[MaterialLocalizations]。通常，所有这些小部件都由[MaterialApp]和[Scaffold]提供。 [label]和[clipBehavior]参数不能为null。
///
/// 也可以看看：
///
/// * [InputChip]，一种以紧凑形式表示复杂信息的芯片，例如实体（人，地方或事物）或对话文本。
/// * [ChoiceChip]，允许从一组选项中进行单个选择。选择筹码包含相关的描述性文字或类别。
/// * [FilterChip]，使用标签或描述性词作为过滤内容的方法。
/// * [ActionChip]，代表与主要内容相关的动作。
/// * [CircleAvatar]，它显示实体的图像或首字母。
/// * [Wrap]，一个以多个水平或垂直方向显示其子级的小部件垂直运行。
/// * <https://material.io/design/components/chips.html>

class MaterialChip extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'chip',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(16, 20, 0, 20),
        child: Column(
          children: [
            Text('芯片'),
             Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.grey.shade800,
                 child: Text('AB'),
              ),
               label: Text('Aaron Burr'),
            ),
            SizedBox(height: 20),
            Text('输入芯片'),
            Center(
              child: Column(
                children: [
                  InputChip(
                    avatar: Icon(Icons.remove),
                    label: Text('Input 1'),
                    onSelected: (bool value) {},
                  ),
                  InputChip(
                    avatar: Icon(Icons.remove),
                    label: Text('Input 2'),
                    onSelected: (bool value) {},
                  ),
                  InputChip(
                    avatar: Icon(Icons.remove),
                    label: Text('Input 3'),
                    onSelected: (bool value) {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text('选择芯片'),
            Center(
              child: Column(
                children: [
                  ChoiceChip(
                    label: Text('Choice 1'),
                    selected: true,
                  ),
                  ChoiceChip(
                    label: Text('Choice 2'),
                    selected: false,
                  ),
                  ChoiceChip(
                    label: Text('Choice 3'),
                    selected: false,
                  ),
                  ChoiceChip(
                    label: Text('Choice 4'),
                    selected: false,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text('过滤芯片'),
            Center(
              child: Column(
                children: [
                  FilterChip(
                    label: Text('Filter 1'),
                    selected: true,
                    onSelected: (bool value) {},
                  ),
                  FilterChip(
                    label: Text('Filter 2'),
                    onSelected: (bool value) {},
                  ),
                  FilterChip(
                    label: Text('Filter 3'),
                    selected: true,
                    onSelected: (bool value) {},
                  ),
                  FilterChip(
                    label: Text('Filter 4'),
                    onSelected: (bool value) {},
                  ),
                  FilterChip(
                    label: Text('Filter 5'),
                    onSelected: (bool value) {},
                  ),
                  FilterChip(
                    label: Text('Filter 6'),
                    onSelected: (bool value) {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text('动作芯片'),
            Center(
              child: Column(
                children: [
                  ActionChip(
                    avatar: Icon(Icons.favorite),
                    label: Text('Action 1'),
                    onPressed: () {},
                  ),
                  ActionChip(
                    avatar: Icon(Icons.delete),
                    label: Text('Action 2'),
                    onPressed: () {},
                  ),
                  ActionChip(
                    avatar: Icon(Icons.alarm),
                    label: Text('Action 3'),
                    onPressed: () {},
                  ),
                  ActionChip(
                    avatar: Icon(Icons.location_on),
                    label: Text('Action 4'),
                    onPressed: () {},
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