import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MaterialButtonRoute extends StatefulWidget {
  @override
  _MaterialButtonRouteState createState() => _MaterialButtonRouteState();
}

class _MaterialButtonRouteState extends State<MaterialButtonRoute> {
  final isSelected = <bool>[false, false, false];
  var isIconSelected = false;
  bool isShowFB = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: '按钮',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('悬浮操作按钮'),
            SizedBox(height: 10),
            FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                setState(() {
                  isShowFB = ! isShowFB;
                });
              },
              tooltip: '创建',
            ),
            SizedBox(height: 20),
            isShowFB ? FloatingActionButton.extended(
              icon: const Icon(Icons.add),
              label: Text('创建',),
              onPressed: () {},
            ) : Container(),
            SizedBox(height: 20),
            Text('切换按钮'),
            SizedBox(height: 10),
            ToggleButtons(
              isSelected: isSelected,
              onPressed: (index) {
                // Respond to button selection
                setState(() {
                  isSelected[index] = !isSelected[index];
                });
              },
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('BUTTON 1'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('BUTTON 2'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('BUTTON 3'),
                ),
              ],
            ),
            SizedBox(height: 10),
            ToggleButtons(
              color: Colors.black.withOpacity(0.60),
              selectedColor: Color(0xFF6200EE),
              selectedBorderColor: Color(0xFF6200EE),
              fillColor: Color(0xFF6200EE).withOpacity(0.08),
              splashColor: Color(0xFF6200EE).withOpacity(0.12),
              hoverColor: Color(0xFF6200EE).withOpacity(0.04),
              borderRadius: BorderRadius.circular(4.0),
              constraints: BoxConstraints(minHeight: 36.0),
              isSelected: isSelected,
              onPressed: (index) {
                // Respond to button selection
                setState(() {
                  isSelected[index] = !isSelected[index];
                });
              },
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('BUTTON 1'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('BUTTON 2'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('BUTTON 3'),
                ),
              ],
            ),
            SizedBox(height: 10),
            ToggleButtons(
              color: Colors.black.withOpacity(0.60),
              selectedColor: Color(0xFF6200EE),
              selectedBorderColor: Color(0xFF6200EE),
              fillColor: Color(0xFF6200EE).withOpacity(0.08),
              splashColor: Color(0xFF6200EE).withOpacity(0.12),
              hoverColor: Color(0xFF6200EE).withOpacity(0.04),
              borderRadius: BorderRadius.circular(4.0),
              isSelected: isSelected,
              onPressed: (index) {
                // Respond to button selection
                setState(() {
                  isSelected[index] = !isSelected[index];
                });
              },
              children: [
                Icon(Icons.favorite),
                Icon(Icons.visibility),
                Icon(Icons.notifications),
              ],
            ),
            SizedBox(height: 20),
            Text('图标按钮'),
            SizedBox(height: 10),
            IconButton(
              icon: Icon(isIconSelected ? Icons.favorite : Icons.favorite_border,color: isIconSelected ? Colors.redAccent : Colors.black26,),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  isIconSelected = !isIconSelected;
                });
              },
            ),
            SizedBox(height: 20),
            Text('文字、轮廓、包含按钮'),
            SizedBox(height: 10),
            SizedBox(
              height: 20,
            ),
            Text('Flutter1.22 新版 MD按钮'),
            SizedBox(
              height: 20,
            ),
            Center(
              child: TextButton(
                onPressed: () {},
                child: Text('TextButton'),
              ),
            ),
            Center(
              child: TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.add),
                label: Text('TextButton'),
              ),
            ),
            Center(
              child: OutlinedButton(
                onPressed: () {},
                child: Text('OutlinedButton'),
              ),
            ),
            Center(
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.add),
                label: Text('OutlinedButton'),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: Text('ElevatedButton'),
              ),
            ),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.add),
                label: Text('ElevatedButton'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
