import 'package:flutter/material.dart';


///假定一个购物应用显示各种出售的产品，并在购物车中维护想购买的物品。首先定义一个用于展示的类，ShoppingListItem：
class Product {
  const Product({this.name});
  final String name;
}

typedef void CartChangedCallback(Product product, bool inCart);

class ShoppingListItem extends StatelessWidget {
  ShoppingListItem({this.product, this.inCart, this.onCartChanged})
      : super(key: ObjectKey(product));

  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  Color _getColor(BuildContext context) {
    // The theme depends on the BuildContext because different parts
    // of the tree can have different themes.
    // The BuildContext indicates where the build is
    // taking place and therefore which theme to use.

    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context) {
    if (!inCart) return null;

    return TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onCartChanged(product, inCart);
      },
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(product.name[0]),
      ),
      title: Text(product.name, style: _getTextStyle(context)),
    );
  }
}

///ShoppingListItem widget 遵循无状态 widget 的通用模式。
///它将构造函数中接受到的值存储在 final 成员变量中，然后在 build() 函数中使用它们。
///例如，inCart 布尔值使两种样式进行切换：一个使用当前主题的主要颜色，另一个使用灰色。
///
/// 当用户点击列表中的一项，widget 不会直接改变 inCart 的值，而是通过调用从父 widget 接收到的 onCartChanged 函数。
/// 这种方式可以在组件的生命周期中存储状态更长久，从而使状态持久化。甚至，widget 传给 runApp() 的状态可以持久到整个应用的生命周期。
///
/// 当父级接收到 onCartChanged 回调时，父级会更新其内部状态，从而触发父级重建并使用新的 inCart 值来创建新的 ShoppingListItem 实例。
/// 尽管父级在重建时会创建 ShoppingListItem 的新实例，但是由于框架会将新构建的 widget 与先前构建的 widget 进行比较，仅将差异应用于底层的 RenderObject，这种代价是很小的。


///这里有一个示例展示父组件是如何存储可变状态：
class ShoppingList extends StatefulWidget {
  ShoppingList({Key key, this.products}) : super(key: key);

  final List<Product> products;

  // The framework calls createState the first time a widget
  // appears at a given location in the tree.
  // If the parent rebuilds and uses the same type of
  // widget (with the same key), the framework re-uses the State object
  // instead of creating a new State object.

  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  Set<Product> _shoppingCart = Set<Product>();

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      // When a user changes what's in the cart, you need to change
      // _shoppingCart inside a setState call to trigger a rebuild.
      // The framework then calls build, below,
      // which updates the visual appearance of the app.

      if (!inCart)
        _shoppingCart.add(product);
      else
        _shoppingCart.remove(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        children: widget.products.map((Product product) {
          return ShoppingListItem(
            product: product,
            inCart: _shoppingCart.contains(product),
            onCartChanged: _handleCartChanged,
          );
        }).toList(),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Shopping App',
    home: ShoppingList(
      products: <Product>[
        Product(name: 'Eggs'),
        Product(name: 'Flour'),
        Product(name: 'Chocolate chips'),
      ],
    ),
  ));
}

///ShoppingList 类继承自 StatefulWidget，这意味着这个 widget 存储着可变状态。
///当 ShoppingList 首次插入到 widget 树中时，框架调用 createState() 函数来创建 _ShoppingListState 的新实例，以与树中的该位置相关联。
///（注意，State 的子类通常以下划线开头进行命名，表示它们的实现细节是私有的）
///当该 widget 的父 widget 重建时，父 widget 首先会创建一个 ShoppingList 的实例，但是框架会复用之前创建的 _ShoppingListState，而不会重新调用 createState。
///
/// 为了访问当前 ShoppingList 的属性，_ShoppingListState 可以使用它的 widget 属性。
/// 当父组件重建一个新的 ShoppingList 时，_ShoppingListState 会使用新的 widget 值来创建。
/// 如果希望在 widget 属性更改时收到通知，则可以重写 didUpdateWidget() 函数，该函数将 oldWidget 作为参数传递，以便将 oldWidget 与当前 widget 进行比较。
///
/// 当处理 onCartChanged 回调时，_ShoppingListState 通过增加或删除 _shoppingCart 中的产品来改变其内部状态。
/// 为了通知框架它改变了它的内部状态，需要调用 setState()。调用 setState() 会将该 widget 标记为“dirty”（脏的），并且计划在下次应用需要更新屏幕时重新构建它。
/// 如果在修改 widget 的内部状态后忘记调用 setState，框架将不知道这个 widget 是“dirty”(脏的)，并且可能不会调用 widget 的 build() 方法，这意味着用户界面可能不会更新以展示新的状态。
/// 通过以这种方式管理状态，你不需要编写用于创建和更新子 widget 的单独代码。相反，你只需实现 build 函数，它可以处理这两种情况。



