import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';

//在您最终确定它的外观之前，LayoutBuilder可以帮助您了解小部件的大小。
// 它的构建器函数具有构建上下文和传入框约束的参数。
// {@youtube 560 315 https://www.youtube.com/watch?v=IYDVcriKjsw}

///构建一个取决于父窗口小部件大小的窗口小部件树。
///
///与[Builder]小部件类似，除了框架在布局时调用[builder]函数并提供父小部件的约束。当父母限制孩子的大小并且不依赖于孩子的内在大小时，这很有用。 [LayoutBuilder]的最终大小将与其子代的大小匹配。
///
///如果子项小于父项，请考虑将子项包装在[Align]小部件中。如果孩子可能想要更大，请考虑将其包装在[SingleChildScrollView]或[OverflowBox]中。
///
/// 也可以看看：
///
/// * [SliverLayoutBuilder]，此小部件的银色部分。
/// * [Builder]，在构建时调用`builder`函数。
/// * [StatefulBuilder]，它将其builder函数传递给setState回调。
/// * [CustomSingleChildLayout]，用于在布局过程中定位其子项。
/// * [布局小部件目录]（https://flutter.dev/widgets/layout/）。


///此示例根据可用宽度使用[LayoutBuilder]构建不同的小部件。调整DartPad窗口的大小以查看[LayoutBuilder]的效果！
class LayoutBuilderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'LayoutBuilder',
        onPressedBack: () => Navigator.pop(context),
      ),
      //创建一个将其构建推迟到布局的窗口小部件。[builder]参数不能为null。
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if(constraints.maxWidth > 600){
            return _buildWideContainers();
          }else{
            return _buildNormalContainer();
          }
        },
      ),
    );
  }

 Widget _buildNormalContainer() {
   return Center(
     child: Container(
       height: 300.0,
       width: 300.0,
       color: Colors.red,
     ),
   );
 }

  Widget _buildWideContainers() {
      return Center(
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: <Widget>[
             Container(
               height: 300.0,
              width: 300.0,
              color: Colors.red,
            ),
            Container(
              height: 300.0,
              width: 300.0,
              color: Colors.yellow,
            ),
           ],
        ),
      );
    }

}
