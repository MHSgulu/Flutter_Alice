import 'package:alice/routes/other/zego/config/zego_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:zego_express_engine/zego_express_engine.dart';
import 'package:zego_permission/zego_permission.dart';

import 'play_stream_page.dart';
import 'publish_stream_page.dart';



class Authorization {
  final bool camera;
  final bool microphone;

  Authorization(this.camera, this.microphone);
}

class LoginRoomPage extends StatefulWidget {

  final bool isPublish;

  LoginRoomPage(this.isPublish);

  @override
  _LoginRoomPageState createState() => new _LoginRoomPageState();
}

class _LoginRoomPageState extends State<LoginRoomPage> {

  final TextEditingController _controller = new TextEditingController();

  @override
  void initState() {
    super.initState();

    if(ZegoConfig.instance.roomID.isNotEmpty) {
      _controller.text = ZegoConfig.instance.roomID;
    }
  }

  @override
  void dispose() {
    super.dispose();
    // 当你不需要音频和视频通话时会破坏引擎
    // 销毁引擎将自动注销房间并停止发布/播放流。
    ZegoExpressEngine.destroyEngine();
  }

  void onButtonPressed() async {

    if (widget.isPublish) {
      Fluttertoast.showToast(msg: '到这个步骤因为缺少检查权限相关的代码，请手动打开相机和麦克风等权限');
      _loginRoom();

      // 发布流需要权限
      // 登录房间前检查权限

      Authorization authorization = await checkAuthorization();

      //如果permission对象为null，则表示在当前操作系统（如Android 6.0或更低版本的系统）下不需要动态检查权限
      if (authorization == null) {
        _loginRoom();
        return;
      }

      if (!authorization.camera || !authorization.microphone) {
        // 不允许授权，弹出窗口提示用户打开权限
        showSettingsLink();
      } else {
        // 授权完成，允许登录空间
        _loginRoom();
      }

    } else {
      // 播放流不需要申请许可
      _loginRoom();
    }


  }

  void _loginRoom() {
    String roomID = _controller.text.trim();

    ZegoUser user = ZegoUser(ZegoConfig.instance.userID, ZegoConfig.instance.userName);

    // Step2 LoginRoom
    ZegoExpressEngine.instance.loginRoom(roomID, user);

    ZegoConfig.instance.roomID = roomID;
    ZegoConfig.instance.saveConfig();

    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {

      int screenWidthPx = MediaQuery.of(context).size.width.toInt() * MediaQuery.of(context).devicePixelRatio.toInt();
      int screenHeightPx = (MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - 56.0).toInt() * MediaQuery.of(context).devicePixelRatio.toInt();

      if (widget.isPublish) {

        return PublishStreamPage(screenWidthPx, screenHeightPx);

      } else {

        return PlayStreamPage(screenWidthPx, screenHeightPx);

      }
    }));

  }

  // 申请权限
  Future<Authorization> checkAuthorization() async {
    List<Permission> statusList = await ZegoPermission.getPermissions(
        <PermissionType>[PermissionType.Camera, PermissionType.MicroPhone]);

    if(statusList == null)
      return null;

    PermissionStatus cameraStatus, micStatus;
    for (var permission in statusList) {
      if (permission.permissionType == PermissionType.Camera)
        cameraStatus = permission.permissionStatus;
      if (permission.permissionType == PermissionType.MicroPhone)
        micStatus = permission.permissionStatus;
    }

    bool camReqResult = true, micReqResult = true;
    if (cameraStatus != PermissionStatus.granted ||
        micStatus != PermissionStatus.granted) {

      if (cameraStatus != PermissionStatus.granted) {
        camReqResult = await ZegoPermission.requestPermission(
            PermissionType.Camera);
      }

      if (micStatus != PermissionStatus.granted) {
        micReqResult = await ZegoPermission.requestPermission(
            PermissionType.MicroPhone);
      }
    }

    return Authorization(camReqResult, micReqResult);
  }

  void showSettingsLink() {
    showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Tips'),
        content: Text('Please go to the settings page to open the camera/microphone permissions'),
        actions: <Widget>[
          FlatButton(
            child: Text('Settings'),
            onPressed: () {
              Navigator.of(context).pop();
              ZegoPermission.openAppSettings();
            },
          ),
          FlatButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('步骤2 登录房间'),
      ),
      body: GestureDetector(

        behavior: HitTestBehavior.translucent,
        onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),

        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
              ),
              Row(
                children: <Widget>[
                  Text('RoomID: '),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
              ),
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 10.0, top: 12.0, bottom: 12.0),
                  hintText: '请输入RoomID:',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      )
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff0e88eb),
                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
              ),
              Text('RoomID代表一个房间的标识，它需要确保RoomID是全局唯一的，并且不超过255个字节',
                style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.black45
                ),
                maxLines: 2,
                softWrap: true,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
              ),
              Container(
                padding: const EdgeInsets.all(0.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Color(0xff0e88eb),
                ),
                width: 240.0,
                height: 60.0,
                child: CupertinoButton(
                  child: Text('Login Room',
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                  onPressed: onButtonPressed,
                ),
              )
            ],
          ),
        )
      ),
    );
  }

}



