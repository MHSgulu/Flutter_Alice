import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';

const red = Colors.red;
const green = Colors.green;
const blue = Colors.blue;
const big = const TextStyle(fontSize: 30);

//////////////////////////////////////////////////

/// 首先，上层 widget 向下层 widget 传递约束条件；
/// 然后，下层 widget 向上层 widget 传递大小信息。
/// 最后，上层 widget 决定下层 widget 的位置。

class FlutterLayoutConstraintsExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlutterLayoutArticle(<Example>[
      Example1(),
      Example2(),
      Example3(),
      Example4(),
      Example5(),
      Example6(),
      Example7(),
      Example8(),
      Example9(),
      Example10(),
      Example11(),
      Example12(),
      Example13(),
      Example14(),
      Example15(),
      Example16(),
      Example17(),
      Example18(),
      Example19(),
      Example20(),
      Example21(),
      Example22(),
      Example23(),
      Example24(),
      Example25(),
      Example26(),
      Example27(),
      Example28(),
      Example29(),
    ]);
  }
}

//////////////////////////////////////////////////

abstract class Example extends StatelessWidget {
  String get code;

  String get explanation;
}

//////////////////////////////////////////////////

class FlutterLayoutArticle extends StatefulWidget {
  final List<Example> examples;

  FlutterLayoutArticle(this.examples);

  @override
  _FlutterLayoutArticleState createState() => _FlutterLayoutArticleState();
}

//////////////////////////////////////////////////

class _FlutterLayoutArticleState extends State<FlutterLayoutArticle> {
  int count;
  Widget example;
  String code;
  String explanation;

  @override
  void initState() {
    count = 1;
    code = Example1().code;
    explanation = Example1().explanation;

    super.initState();
  }

  @override
  void didUpdateWidget(FlutterLayoutArticle oldWidget) {
    super.didUpdateWidget(oldWidget);
    var example = widget.examples[count - 1];
    code = example.code;
    explanation = example.explanation;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: '布局约束',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: Material(
          color: Colors.black,
          child: FittedBox(
            child: Container(
              width: 400,
              height: 650,
              color: Color(0xFFCCCCCC),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ConstrainedBox(
                        constraints: BoxConstraints.tightFor(
                          width: double.infinity,
                          height: double.infinity,
                        ),
                        child: widget.examples[count - 1]),
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    color: Colors.black,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          for (int i = 0; i < widget.examples.length; i++)
                            Container(
                                width: 58,
                                padding: const EdgeInsets.only(
                                    left: 4.0, right: 4.0),
                                child: button(i + 1)),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Scrollbar(
                      child: SingleChildScrollView(
                          key: ValueKey(count),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: <Widget>[
                                Center(child: Text(code)),
                                SizedBox(height: 15),
                                Text(
                                  explanation,
                                  style: TextStyle(
                                    color: Colors.blue[900],
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                    height: 270,
                    color: Colors.grey[50],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget button(int exampleNumber) => Button(
        key: ValueKey('button$exampleNumber'),
        isSelected: this.count == exampleNumber,
        exampleNumber: exampleNumber,
        onPressed: () {
          showExample(
            exampleNumber,
            widget.examples[exampleNumber - 1].code,
            widget.examples[exampleNumber - 1].explanation,
          );
        },
      );

  void showExample(int exampleNumber, String code, String explanation) =>
      setState(() {
        this.count = exampleNumber;
        this.code = code;
        this.explanation = explanation;
      });
}

//////////////////////////////////////////////////

class Button extends StatelessWidget {
  final Key key;
  final bool isSelected;
  final int exampleNumber;
  final VoidCallback onPressed;

  Button({
    this.key,
    this.isSelected,
    this.exampleNumber,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: isSelected ? Colors.grey : Colors.grey[800],
        ),
        child: Text(exampleNumber.toString()),
        onPressed: () {
          Scrollable.ensureVisible(
            context,
            duration: Duration(milliseconds: 350),
            curve: Curves.easeOut,
            alignment: 0.5,
          );
          onPressed();
        });
  }
}
//////////////////////////////////////////////////

class Example1 extends Example {
  final String code = 'Container(color: red)';
  final String explanation = '整个屏幕作为 Container 的父级，并且强制 Container 变成和屏幕一样的大小。'
      '所以这个 Container 充满了整个屏幕，并绘制成红色。';

  @override
  Widget build(BuildContext context) {
    return Container(color: red);
  }
}

//////////////////////////////////////////////////

class Example2 extends Example {
  final String code = 'Container(width: 100, height: 100, color: red)';
  final String explanation =
      '红色的 Container 想要变成 100 x 100 的大小，但是它无法变成，因为屏幕强制它变成和屏幕一样的大小。'
      '所以 Container 充满了整个屏幕。';

  @override
  Widget build(BuildContext context) {
    return Container(width: 100, height: 100, color: red);
  }
}

//////////////////////////////////////////////////

class Example3 extends Example {
  final String code = 'Center(\n'
      '   child: Container(width: 100, height: 100, color: red))';
  final String explanation = '屏幕强制 Center 变得和屏幕一样大，所以 Center 充满了屏幕。\n'
      '然后 Center 告诉 Container 可以变成任意大小，但是不能超出屏幕。现在，Container 可以真正变成 100 × 100 大小了。';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(width: 100, height: 100, color: red),
    );
  }
}

//////////////////////////////////////////////////

class Example4 extends Example {
  final String code = 'Align(\n'
      '   alignment: Alignment.bottomRight,\n'
      '   child: Container(width: 100, height: 100, color: red))';
  final String explanation = '与上一个样例不同的是，我们使用了 Align 而不是 Center。\n '
      'Align 同样也告诉 Container，你可以变成任意大小。但是，如果还留有空白空间的话，它不会居中 Container。相反，它将会在允许的空间内，把 Container 放在右下角（bottomRight）。';

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(width: 100, height: 100, color: red),
    );
  }
}

//////////////////////////////////////////////////

class Example5 extends Example {
  final String code = 'Center(\n'
      '   child: Container(\n'
      '              color: red,\n'
      '              width: double.infinity,\n'
      '              height: double.infinity))';
  final String explanation = '屏幕强制 Center 变得和屏幕一样大，所以 Center 充满屏幕。'
      '\n\n'
      '然后 Center 告诉 Container 可以变成任意大小，但是不能超出屏幕。现在，Container 想要无限的大小，但是由于它不能比屏幕更大，所以就仅充满屏幕。';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: double.infinity, height: double.infinity, color: red),
    );
  }
}

//////////////////////////////////////////////////

class Example6 extends Example {
  final String code = 'Center(child: Container(color: red))';
  final String explanation = '屏幕强制 Center 变得和屏幕一样大，所以 Center 充满屏幕。'
      '\n\n'
      '然后 Center 告诉 Container 可以变成任意大小，但是不能超出屏幕。由于 Container 没有子级而且没有固定大小，所以它决定能有多大就有多大，所以它充满了整个屏幕。'
      '\n\n'
      'Since the Container has no child and no fixed size, it decides it wants to be as big as possible, so it fills the whole screen.'
      '\n\n'
      '但是，为什么 Container 做出了这个决定？非常简单，因为这个决定是由 Container widget 的创建者决定的。可能会因创造者而异，而且你还得阅读 Container 文档 来理解不同场景下它的行为。';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(color: red),
    );
  }
}

//////////////////////////////////////////////////

class Example7 extends Example {
  final String code = 'Center(\n'
      '   child: Container(color: red\n'
      '      child: Container(color: green, width: 30, height: 30)))';
  final String explanation = '屏幕强制 Center 变得和屏幕一样大，所以 Center 充满屏幕。'
      '\n\n'
      '然后 Center 告诉红色的 Container 可以变成任意大小，但是不能超出屏幕。由于 Container 没有固定大小但是有子级，所以它决定变成它 child 的大小。'
      '\n\n'
      '然后红色的 Container 告诉它的 child 可以变成任意大小，但是不能超出屏幕。'
      '\n\n'
      '而它的 child 是一个想要 30 × 30 大小绿色的 Container。由于红色的 Container 和其子级一样大，所以也变为 30 × 30。由于绿色的 Container 完全覆盖了红色 Container，所以你看不见它了。';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: red,
        child: Container(color: green, width: 30, height: 30),
      ),
    );
  }
}

//////////////////////////////////////////////////

class Example8 extends Example {
  final String code = 'Center(\n'
      '   child: Container(color: red\n'
      '      padding: const EdgeInsets.all(20.0),\n'
      '      child: Container(color: green, width: 30, height: 30)))';
  final String explanation = '红色 Container 变为其子级的大小，但是它将其 padding 带入了约束的计算中。'
      '所以它有一个 30 x 30 的外边距。由于这个外边距，所以现在你能看见红色了。而绿色的 Container 则还是和之前一样。';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        color: red,
        child: Container(color: green, width: 30, height: 30),
      ),
    );
  }
}

//////////////////////////////////////////////////

class Example9 extends Example {
  final String code = 'ConstrainedBox(\n'
      '   constraints: BoxConstraints(\n'
      '              minWidth: 70, minHeight: 70,\n'
      '              maxWidth: 150, maxHeight: 150),\n'
      '      child: Container(color: red, width: 10, height: 10)))';
  final String explanation =
      '你可能会猜想 Container 的尺寸会在 70 到 150 像素之间，但并不是这样。 ConstrainedBox 仅对其从其父级接收到的约束下施加其他约束。'
      '\n\n'
      '在这里，屏幕迫使 ConstrainedBox 与屏幕大小完全相同，因此它告诉其子 Widget 也以屏幕大小作为约束，从而忽略了其 constraints 参数带来的影响。';

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          minWidth: 70, minHeight: 70, maxWidth: 150, maxHeight: 150),
      child: Container(color: red, width: 10, height: 10),
    );
  }
}

//////////////////////////////////////////////////

class Example10 extends Example {
  final String code = 'Center(\n'
      '   child: ConstrainedBox(\n'
      '      constraints: BoxConstraints(\n'
      '                 minWidth: 70, minHeight: 70,\n'
      '                 maxWidth: 150, maxHeight: 150),\n'
      '        child: Container(color: red, width: 10, height: 10))))';
  final String explanation = '现在，Center 允许 ConstrainedBox 达到屏幕可允许的任意大小。'
      '\n\n'
      'ConstrainedBox 将 constraints 参数带来的约束附加到其子对象上。'
      '\n\n'
      'Container 必须介于 70 到 150 像素之间。虽然它希望自己有 10 个像素大小，但最终获得了 70 个像素（最小为 70）。';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
            minWidth: 70, minHeight: 70, maxWidth: 150, maxHeight: 150),
        child: Container(color: red, width: 10, height: 10),
      ),
    );
  }
}

//////////////////////////////////////////////////

class Example11 extends Example {
  final String code = 'Center(\n'
      '   child: ConstrainedBox(\n'
      '      constraints: BoxConstraints(\n'
      '                 minWidth: 70, minHeight: 70,\n'
      '                 maxWidth: 150, maxHeight: 150),\n'
      '        child: Container(color: red, width: 1000, height: 1000))))';
  final String explanation =
      '现在，Center 允许 ConstrainedBox 达到屏幕可允许的任意大小。 ConstrainedBox 将 constraints 参数带来的约束附加到其子对象上。'
      '\n\n'
      'Container 必须介于 70 到 150 像素之间。虽然它希望自己有 1000 个像素大小，但最终获得了 150 个像素（最大为 150）。';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
            minWidth: 70, minHeight: 70, maxWidth: 150, maxHeight: 150),
        child: Container(color: red, width: 1000, height: 1000),
      ),
    );
  }
}

//////////////////////////////////////////////////

class Example12 extends Example {
  final String code = 'Center(\n'
      '   child: ConstrainedBox(\n'
      '      constraints: BoxConstraints(\n'
      '                 minWidth: 70, minHeight: 70,\n'
      '                 maxWidth: 150, maxHeight: 150),\n'
      '        child: Container(color: red, width: 100, height: 100))))';
  final String explanation =
      '现在，Center 允许 ConstrainedBox 达到屏幕可允许的任意大小。 ConstrainedBox 将 constraints 参数带来的约束附加到其子对象上。'
      '\n\n'
      'Container 必须介于 70 到 150 像素之间。虽然它希望自己有 100 个像素大小，因为 100 介于 70 至 150 的范围内，所以最终获得了 100 个像素。';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
            minWidth: 70, minHeight: 70, maxWidth: 150, maxHeight: 150),
        child: Container(color: red, width: 100, height: 100),
      ),
    );
  }
}

//////////////////////////////////////////////////

class Example13 extends Example {
  final String code = 'UnconstrainedBox(\n'
      '   child: Container(color: red, width: 20, height: 50));';
  final String explanation =
      '屏幕强制 UnconstrainedBox 变得和屏幕一样大，而 UnconstrainedBox 允许其子级的 Container 可以变为任意大小。';

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(color: red, width: 20, height: 50),
    );
  }
}

//////////////////////////////////////////////////

class Example14 extends Example {
  final String code = 'UnconstrainedBox(\n'
      '   child: Container(color: red, width: 4000, height: 50));';
  final String explanation =
      '屏幕强制 UnconstrainedBox 变得和屏幕一样大，而 UnconstrainedBox 允许其子级的 Container 可以变为任意大小。'
      '\n\n'
      '不幸的是，在这种情况下，容器的宽度为 4000 像素，这实在是太大，以至于无法容纳在 UnconstrainedBox 中，因此 UnconstrainedBox 将显示溢出警告（overflow warning）。';

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(color: red, width: 4000, height: 50),
    );
  }
}

//////////////////////////////////////////////////

class Example15 extends Example {
  final String code = 'OverflowBox(\n'
      '   minWidth: 0.0,'
      '   minHeight: 0.0,'
      '   maxWidth: double.infinity,'
      '   maxHeight: double.infinity,'
      '   child: Container(color: red, width: 4000, height: 50));';
  final String explanation =
      '屏幕强制 OverflowBox 变得和屏幕一样大，并且 OverflowBox 允许其子容器设置为任意大小。'
      '\n\n'
      'OverflowBox 与 UnconstrainedBox 类似，但不同的是，如果其子级超出该空间，它将不会显示任何警告。.'
      '\n\n'
      '在这种情况下，容器的宽度为 4000 像素，并且太大而无法容纳在 OverflowBox 中，但是 OverflowBox 会全部显示，而不会发出警告。';

  @override
  Widget build(BuildContext context) {
    return OverflowBox(
      minWidth: 0.0,
      minHeight: 0.0,
      maxWidth: double.infinity,
      maxHeight: double.infinity,
      child: Container(color: red, width: 4000, height: 50),
    );
  }
}

//////////////////////////////////////////////////

class Example16 extends Example {
  final String code = 'UnconstrainedBox(\n'
      '   child: Container(color: Colors.red, width: double.infinity, height: 100));';
  final String explanation = '这将不会渲染任何东西，而且你能在控制台看到错误信息。'
      '\n\n'
      'UnconstrainedBox 让它的子级决定成为任何大小，但是其子级是一个具有无限大小的 Container。'
      '\n\n'
      'Flutter 无法渲染无限大的东西，所以它抛出以下错误： BoxConstraints forces an infinite width.（盒子约束强制使用了无限的宽度）';

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(color: Colors.red, width: double.infinity, height: 100),
    );
  }
}

//////////////////////////////////////////////////

class Example17 extends Example {
  final String code = 'UnconstrainedBox(\n'
      '   child: LimitedBox(maxWidth: 100,\n'
      '      child: Container(color: Colors.red,\n'
      '                       width: double.infinity, height: 100));';
  final String explanation = 'Here you won\'t get an error anymore, '
      '这次你就不会遇到报错了。 UnconstrainedBox 给 LimitedBox 一个无限的大小；但它向其子级传递了最大为 100 的约束。'
      '\n\n'
      '如果你将 UnconstrainedBox 替换为 Center，则LimitedBox 将不再应用其限制（因为其限制仅在获得无限约束时才适用），并且容器的宽度允许超过 100。'
      '\n\n'
      '上面的样例解释了 LimitedBox 和 ConstrainedBox 之间的区别。';

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: LimitedBox(
        maxWidth: 100,
        child:
            Container(color: Colors.red, width: double.infinity, height: 100),
      ),
    );
  }
}

//////////////////////////////////////////////////

class Example18 extends Example {
  final String code = 'FittedBox(\n'
      '   child: Text(\'Some Example Text.\'));';
  final String explanation =
      '屏幕强制 FittedBox 变得和屏幕一样大，而 Text 则是有一个自然宽度（也被称作 intrinsic 宽度），它取决于文本数量，字体大小等因素。'
      '\n\n'
      'FittedBox 让 Text 可以变为任意大小。但是在 Text 告诉 FittedBox 其大小后， FittedBox 缩放文本直到填满所有可用宽度。';

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Text('Some Example Text.'),
    );
  }
}

//////////////////////////////////////////////////

class Example19 extends Example {
  final String code = 'Center(\n'
      '   child: FittedBox(\n'
      '      child: Text(\'Some Example Text.\')));';
  final String explanation =
      '但如果你将 FittedBox 放进 Center widget 中会发生什么？ Center 将会让 FittedBox 能够变为任意大小，取决于屏幕大小。'
      '\n\n'
      'FittedBox 然后会根据 Text 调整自己的大小，然后让 Text 可以变为所需的任意大小'
      '\n\n'
      '由于二者具有同一大小，因此不会发生缩放。';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FittedBox(
        child: Text('Some Example Text.'),
      ),
    );
  }
}

////////////////////////////////////////////////////

class Example20 extends Example {
  final String code = 'Center(\n'
      '   child: FittedBox(\n'
      '      child: Text(\'…\')));';
  final String explanation = '然而，如果 FittedBox 位于 Center 中，但 Text 太大而超出屏幕，会发生什么？'
      '\n\n'
      'FittedBox 会尝试根据 Text 大小调整大小，但不能大于屏幕大小。然后假定屏幕大小，并调整 Text 的大小以使其也适合屏幕。';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FittedBox(
        child: Text(
            'This is some very very very large text that is too big to fit a regular screen in a single line.'),
      ),
    );
  }
}

//////////////////////////////////////////////////

class Example21 extends Example {
  final String code = 'Center(\n'
      '   child: Text(\'…\'));';
  final String explanation =
      '然而，如果你删除了 FittedBox， Text 则会从屏幕上获取其最大宽度，并在合适的地方换行。';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
          'This is some very very very large text that is too big to fit a regular screen in a single line.'),
    );
  }
}

//////////////////////////////////////////////////

class Example22 extends Example {
  final String code = 'FittedBox(\n'
      '   child: Container(\n'
      '      height: 20.0, width: double.infinity));';
  final String explanation =
      'FittedBox 只能在有限制的宽高中对子 widget 进行缩放（宽度和高度不会变得无限大）。否则，它将无法渲染任何内容，并且你会在控制台中看到错误。';

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        height: 20.0,
        width: double.infinity,
        color: Colors.red,
      ),
    );
  }
}

//////////////////////////////////////////////////

class Example23 extends Example {
  final String code = 'Row(children:[\n'
      '   Container(color: red, child: Text(\'Hello!\'))\n'
      '   Container(color: green, child: Text(\'Goodbye!\'))]';
  final String explanation = '屏幕强制 Row 变得和屏幕一样大，所以 Row 充满屏幕。'
      '\n\n'
      '和 UnconstrainedBox 一样， Row 也不会对其子代施加任何约束，而是让它们成为所需的任意大小。'
      '\n\n'
      'Row 然后将它们并排放置，任何多余的空间都将保持空白。';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(color: red, child: Text('Hello!', style: big)),
        Container(color: green, child: Text('Goodbye!', style: big)),
      ],
    );
  }
}

//////////////////////////////////////////////////

class Example24 extends Example {
  final String code = 'Row(children:[\n'
      '   Container(color: red, child: Text(\'…\'))\n'
      '   Container(color: green, child: Text(\'Goodbye!\'))]';
  final String explanation =
      '由于 Row 不会对其子级施加任何约束，因此它的 children 很有可能太大而超出 Row 的可用宽度。'
      '在这种情况下， Row 会和 UnconstrainedBox 一样显示溢出警告。';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            color: red,
            child: Text('This is a very long text that won\'t fit the line.',
                style: big)),
        Container(color: green, child: Text('Goodbye!', style: big)),
      ],
    );
  }
}

//////////////////////////////////////////////////

class Example25 extends Example {
  final String code = 'Row(children:[\n'
      '   Expanded(\n'
      '       child: Container(color: red, child: Text(\'…\')))\n'
      '   Container(color: green, child: Text(\'Goodbye!\'))]';
  final String explanation =
      '当 Row 的子级被包裹在了 Expanded widget 之后， Row 将不会再让其决定自身的宽度了。'
      '\n\n'
      '取而代之的是，Row 会根据所有 Expanded 的子级来计算其该有的宽度。'
      '\n\n'
      '换句话说，一旦你使用 Expanded，子级自身的宽度就变得无关紧要，直接会被忽略掉。';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Center(
          child: Container(
              color: red,
              child: Text('This is a very long text that won\'t fit the line.',
                  style: big)),
        )),
        Container(color: green, child: Text('Goodbye!', style: big)),
      ],
    );
  }
}

//////////////////////////////////////////////////

class Example26 extends Example {
  final String code = 'Row(children:[\n'
      '   Expanded(\n'
      '       child: Container(color: red, child: Text(\'…\')))\n'
      '   Expanded(\n'
      '       child: Container(color: green, child: Text(\'Goodbye!\'))]';
  final String explanation =
      '如果所有 Row 的子级都被包裹了 Expanded widget，每一个 Expanded 大小都会与其 flex 因子成比例，并且 Expanded widget 将会强制其子级具有与 Expanded 相同的宽度。'
      '\n\n'
      '换句话说，Expanded 忽略了其子 Widget 想要的宽度。';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
                color: red,
                child: Text(
                    'This is a very long text that won\'t fit the line.',
                    style: big))),
        Expanded(
            child:
                Container(color: green, child: Text('Goodbye!', style: big))),
      ],
    );
  }
}

//////////////////////////////////////////////////

class Example27 extends Example {
  final String code = 'Row(children:[\n'
      '   Flexible(\n'
      '       child: Container(color: red, child: Text(\'…\')))\n'
      '   Flexible(\n'
      '       child: Container(color: green, child: Text(\'Goodbye!\'))]';
  final String explanation =
      '如果你使用 Flexible 而不是 Expanded 的话，唯一的区别是，Flexible 会让其子级具有与 Flexible 相同或者更小的宽度。而 Expanded 将会强制其子级具有和 Expanded 相同的宽度。'
      '\n\n'
      '但无论是 Expanded 还是 Flexible 在它们决定子级大小时都会忽略其宽度。'
      '\n\n'
      '这意味着，Row 要么使用子级的宽度，要么使用Expanded 和 Flexible 从而忽略子级的宽度。';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
            child: Container(
                color: red,
                child: Text(
                    'This is a very long text that won\'t fit the line.',
                    style: big))),
        Flexible(
            child:
                Container(color: green, child: Text('Goodbye!', style: big))),
      ],
    );
  }
}

//////////////////////////////////////////////////

class Example28 extends Example {
  final String code = 'Scaffold(\n'
      '   body: Container(color: blue,\n'
      '   child: Column(\n'
      '      children: [\n'
      '         Text(\'Hello!\'),\n'
      '         Text(\'Goodbye!\')])))';

  final String explanation = '屏幕强制 Scaffold 变得和屏幕一样大，所以 Scaffold 充满屏幕。'
      '\n\n'
      '然后 Scaffold 告诉 Container 可以变为任意大小，但不能超出屏幕。'
      '\n\n'
      '当一个 widget 告诉其子级可以比自身更小的话，我们通常称这个 widget 对其子级使用 宽松约束（loose）。';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: blue,
        child: Column(
          children: [
            Text('Hello!'),
            Text('Goodbye!'),
          ],
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////

class Example29 extends Example {
  final String code = 'Scaffold(\n'
      '   body: Container(color: blue,\n'
      '   child: SizedBox.expand(\n'
      '      child: Column(\n'
      '         children: [\n'
      '            Text(\'Hello!\'),\n'
      '            Text(\'Goodbye!\')]))))';

  final String explanation =
      '如果你想要 Scaffold 的子级变得和 Scaffold 本身一样大的话，你可以将这个子级外包裹一个 SizedBox.expand。'
      '\n\n'
      '当一个 widget 告诉它的子级必须变成某个大小的时候，我们通常称这个 widget 对其子级使用 严格约束（tight）。';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          color: blue,
          child: Column(
            children: [
              Text('Hello!'),
              Text('Goodbye!'),
            ],
          ),
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////

///   #### 严格约束（Tight） vs 宽松约束（loose） ####
///
/// 以后你经常会听到一些约束为严格约束或宽松约束，你花点时间来弄明白它们是值得的。
/// 严格约束给你了一种获得确切大小的选择。换句话来说就是，它的最大/最小宽度是一致的，高度也一样。
/// 如果你到 Flutter 的 box.dart 文件中搜索 BoxConstraints 构造器，你会发现以下内容：
///
/// BoxConstraints.tight(Size size)
/// : minWidth = size.width,
/// maxWidth = size.width,
/// minHeight = size.height,
/// maxHeight = size.height;
///
/// 如果你重新阅读 样例 2，它告诉我们屏幕强制 Container 变得和屏幕一样大。为何屏幕能够做到这一点，原因就是给 Container 传递了严格约束。
/// 一个宽松约束换句话来说就是设置了最大宽度/高度，但是让允许其子 widget 获得比它更小的任意大小。换句话来说，宽松约束的最小宽度/高度为 0。
///
/// BoxConstraints.loose(Size size)
///    : minWidth = 0.0,
///      maxWidth = size.width,
///      minHeight = 0.0,
///      maxHeight = size.height;
///
/// 如果你访问 样例 3，它将会告诉我们 Center 让红色的 Container 变得更小，但是不能超出屏幕。
/// Center 能够做到这一点的原因就在于给 Container 的是一个宽松约束。
/// 总的来说，Center 起的作用就是从其父级（屏幕）那里获得的严格约束，为其子级（Container）转换为宽松约束

///   #### 了解如何为特定 widget 制定布局规则 ####
