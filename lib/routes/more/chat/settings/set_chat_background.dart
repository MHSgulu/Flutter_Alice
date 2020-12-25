import 'dart:io';

import 'package:alice/common/util/sp_util.dart';
import 'package:alice/widgets/custom/custom_simple_dialog_option.dart';
import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class SetChatBackgroundRoute extends StatefulWidget {
  @override
  _SetChatBackgroundRouteState createState() => _SetChatBackgroundRouteState();
}

class _SetChatBackgroundRouteState extends State<SetChatBackgroundRoute> {
  File _image;
  String _imagePath;
  final picker = ImagePicker();
  PickedFile pickedFile;

  @override
  void initState() {
    getChatBackgroundImage();
    super.initState();
  }

  void getChatBackgroundImage() async{
    _imagePath = await SharedPreferencesUtil.getInstance().fetchChatBackgroundImage();
    print('数据点位: _imagePath: $_imagePath');
    if(mounted){
      setState(() {
        _image = File(_imagePath);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: '聊天背景',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: _image == null
                ? AssetImage('assets/images/bg_alice.png')
                : FileImage(_image),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: GestureDetector(
            onTap: () => showSelectImageDialog(),
            child: ClipOval(
              child: Container(
                width: 80,
                height: 80,
                color: Colors.black26,
                child: Center(
                  child: Text(
                    '更换背景',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => saveChatBackground(),
        child: Text('保存'),
      ),
    );
  }

  void showSelectImageDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              '请选择图片来源',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 13,
              ),
            ),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CustomSimpleDialogOption(
                  optionText: '相机',
                  imagePath: 'assets/icons/icon_is_camera.png',
                  callback: () {
                    getImage(1);
                    Navigator.of(context).pop();
                  },
                ),
                CustomSimpleDialogOption(
                  optionText: '图库',
                  imagePath: 'assets/icons/icon_is_gallery.png',
                  callback: () {
                    getImage(2);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

  Future getImage(int type) async {
    if (type == 1) {
      pickedFile = await picker.getImage(source: ImageSource.camera);
    } else if (type == 2) {
      pickedFile = await picker.getImage(source: ImageSource.gallery);
    }
    if (pickedFile != null) {
      if (mounted) {
        setState(() {
          ///获取选择的文件的路径。
          ///仅应将其用作移动应用程序的向后兼容离合器，或仅出于美观目的（向用户显示他们选择的路径）。
          ///通过其路径访问所选择的文件中包含的数据是平台相关的（并且在Web上不起作用），因此请使用PickedFile实例中的字节获取器。
          _imagePath = pickedFile.path;
          _image = File(_imagePath);
          print('数据点位: pickedFile.path: $_imagePath');
        });
      }
    }
  }

  void saveChatBackground() {
    if (_imagePath != null) {
      SharedPreferencesUtil.getInstance().saveChatBackgroundImage(_imagePath);
      Navigator.pop(context,'updateBgImage');
    }else{
      Fluttertoast.showToast(msg: '请选取图片');
    }
  }
}
