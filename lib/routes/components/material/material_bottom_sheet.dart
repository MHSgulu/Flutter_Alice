import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';

///显示模态材料设计底页。
///
///模态底页是菜单或对话框的替代方案，可防止用户与应用程序的其余部分进行交互。
///
///一个密切相关的小部件是一个持久的底部表，它显示了在不阻止用户与应用程序交互的情况下补充该应用程序主要内容的信息。
///可以使用[showBottomSheet]函数或[ScaffoldState.showBottomSheet]方法创建并显示持久的底部工作表。
///
///`context`参数用于查找底页的[Navigator]和[Theme]。仅在调用该方法时使用。在关闭底部工作表之前，可以将其相应的小部件安全地从树中删除。
///
///`isScrollControlled`参数指定这是否是使用[DraggableScrollableSheet]的底部工作表的路由。如果希望具有可滚动子级（例如[ListView]或[GridView]）的底页，并且底页是可拖动的，则应将此参数设置为true。
///
///`useRootNavigator`参数确保当设置为true时，根导航器用于显示[BottomSheet]。如果需要在所有其他内容上方显示模式[BottomSheet]，但调用者在另一个[Navigator]内部，则此功能很有用。
///
/// [isDismissible]参数指定当用户轻按稀松布时是否关闭底纸。
///
/// [enableDrag]参数指定是否可以上下滑动和向下滑动底部的面板。
///
///可以传入可选的[backgroundColor]，[elevation]，[shape]和[clipBehavior]参数，以自定义模态底板的外观和行为。
///
///可选的`routeSettings`参数设置模态底部工作表的[RouteSettings]。这在用户想要观察[NavigatorObserver]中的[PopupRoute]的情况下特别有用。
///
///返回一个“ Future”，它将解析为之前的值（如果有）
///当模式底部关闭时，传递给[Navigator.pop]。
///
/// 也可以看看：
///
/// * [BottomSheet]，它成为由作为“ builder”参数传递给 [showModalBottomSheet]。
/// * [showBottomSheet]和[ScaffoldState.showBottomSheet]，用于显示非模式底页。
/// * [DraggableScrollableSheet]，它允许您创建一个底部工作表，该工作表会逐渐增大，一旦达到最大大小便可以滚动。

class MaterialBottomSheet extends StatefulWidget {
  @override
  _MaterialBottomSheetState createState() => _MaterialBottomSheetState();
}

class _MaterialBottomSheetState extends State<MaterialBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: '底页',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () => show1(),
              child: Text('showModalBottomSheet(模态底页)'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () => show1(),
              child: Text('showBottomSheet(非模式底页)'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () => show3(),
              child: Text('showModalBottomSheet(DraggableScrollableSheet)'),
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        height: 50,
        color: Colors.lightBlueAccent,
        child: Center(
          child: Text('持久性底页(标准底页)'),
        ),
      ),
    );
  }

  void show0() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        ///[BottomSheet]小部件本身很少直接使用。
        ///相反，最好使用[ScaffoldState.showBottomSheet]或[Scaffold.bottomSheet]创建持久性底部工作表，并使用[showModalBottomSheet]创建模式底部工作表。
        ///
        ///创建一个底页。
        ///通常，对于持久性底部工作表，[ScaffoldState.showBottomSheet]会隐式创建底部工作表，对于模式底部工作表，则由[showModalBottomSheet]隐式创建。
        return BottomSheet(
          onClosing: () {},
          builder: (BuildContext context) {
            return Container(
              child: Text('BottomSheet'),
            );
          },
        );
      },
    );
  }

  ///这个例子演示了如何使用showModalBottomSheet来显示一个底部表，当用户点击一个按钮时，该底部表遮盖了其后面的内容。
  ///它还演示了当用户点击底部页面内部的按钮时如何使用[Navigator]关闭底部页面。
  void show1() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          color: Colors.amber,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Modal BottomSheet'),
                ElevatedButton(
                  child: Text('Close BottomSheet'),
                  onPressed: () => Navigator.pop(context),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void show2() {
    ///在最接近的[Scaffold]祖先中显示材料设计底页。如果希望显示持久的底页，请使用[Scaffold.bottomSheet]。
    ///
    ///返回一个控制器，该控制器可用于关闭和操作底页。
    ///
    ///可以传入可选的[backgroundColor]，[elevation]，[shape]和[clipBehavior]参数，以自定义持久性底板的外观和行为。
    ///
    ///要重建底部工作表（例如，如果它是有状态的），请在此方法返回的控制器上调用[PersistentBottomSheetController.setState]。
    ///
    ///新的底部工作表将成为用于封闭[ModalRoute]的[LocalHistoryEntry]，并且在[Scaffold]的应用栏中添加了一个后退按钮，用于关闭底部工作表。
    ///
    ///要创建不是[LocalHistoryEntry]的持久性底页，并且不向封闭的Scaffold的应用程序栏添加后退按钮，请使用[Scaffold.bottomSheet]构造函数参数。
    ///
    ///密切相关的小部件是模式底部，可以替代菜单或对话框，并防止用户与应用程序的其余部分进行交互。可以使用[showModalBottomSheet]函数创建并显示模态底部工作表。
    ///
    ///`context`参数用于查找底页的[Scaffold]。仅在调用该方法时使用。在关闭底部工作表之前，可以将其相应的小部件安全地从树中删除。
    ///
    /// 也可以看看：
    ///
    /// * [BottomSheet]，它将成为builder返回的小部件的父级。
    /// * [showModalBottomSheet]，可用于显示模式底板。
    /// * [Scaffold.of]，有关如何获取[BuildContext]的信息。
    showBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 200,
            color: Colors.amber,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('Modal BottomSheet'),
                  ElevatedButton(
                    child: Text('Close BottomSheet'),
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              ),
            ),
          );
        });
  }

  void show3() {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return DraggableScrollableSheet(
          //initialChildSize: 1.0,
          builder: (context, scrollController) {
            return Container(
              color: Colors.blue[100],
              child: ListView.builder(
                controller: scrollController,
                itemCount: 25,
                itemBuilder: (context,index) {
                  return ListTile(
                    title: Text('item $index'),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
