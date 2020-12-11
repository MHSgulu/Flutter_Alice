import 'dart:async';

import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';

class ExampleLocalAuth extends StatefulWidget {
  @override
  _ExampleLocalAuthState createState() => _ExampleLocalAuthState();
}

class _ExampleLocalAuthState extends State<ExampleLocalAuth> {
  final LocalAuthentication auth = LocalAuthentication();
  bool _canCheckBiometrics;
  List<BiometricType> _availableBiometrics;
  String _authorized = '非授权';
  bool _isAuthenticating = false;

  Future<void> _checkBiometrics() async {
    bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
    });
  }

  Future<void> _getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _availableBiometrics = availableBiometrics;
    });
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = '验证中';
      });
      ///使用设备上可用的生物特征认证用户。
      ///返回一个[Future]，如果用户成功通过身份验证，则为true，否则为false。
      authenticated = await auth.authenticateWithBiometrics(
        ///[localizedReason]是提示用户进行身份验证时显示给用户的消息。
        ///通常是这样的：“请扫描手指以访问MyApp。”
        localizedReason: '扫描指纹以进行身份验证',
        ///[useErrorDialogs] = true表示系统将尝试处理认证时遇到的用户可修复问题。
        /// 例如，如果手机上有指纹读取器，但没有注册指纹，则插件会尝试将用户带到设置中以添加一个。
        /// 用户无法修复的所有内容（例如设备上没有生物识别传感器）都将作为[PlatformException]返回。
        useErrorDialogs: true,
        ///当验证正在进行时，由于任何原因使应用程序进入后台时，都会使用[stickyAuth]。
        ///由于安全原因，必须在此时停止身份验证。 如果stickyAuth设置为true，则在恢复应用程序时恢复身份验证。
        ///如果将其设置为false（默认值），则一旦应用程序暂停，就会将失败消息发送回Dart，并由客户端应用程序重新启动身份验证或执行其他操作。
        stickyAuth: true,
        ///如果要自定义对话框中的消息，请构造[AndroidAuthStrings]和[IOSAuthStrings]。
        androidAuthStrings: AndroidAuthMessages(
          fingerprintHint: '触控感应器',
          fingerprintNotRecognized: '无法识别指纹,请再次尝试',
          fingerprintSuccess: '指纹识别',
          cancelButton: '取消',
          signInTitle: '指纹认证',
          fingerprintRequiredTitle: '需要指纹',
          goToSettingsButton: '前往设置',
          goToSettingsDescription: '您的设备上未设置指纹.转到\'Settings > Security\' 添加指纹',
        ),
        iOSAuthStrings: IOSAuthMessages(
          lockOut: '生物特征认证被禁用,请锁定并解锁屏幕以启用它',
          goToSettingsButton: '前往设置',
          goToSettingsDescription: '未在您的设备上设置生物特征认证,请在手机上启用Touch ID或Face ID',
          cancelButton: '好',
        ),
        ///将[sensitiveTransaction]设置为true可启用特定于平台的预防措施。
        ///例如，在面部解锁时，Android在识别出面部后会打开一个确认对话框，以确保用户打算解锁手机。
        sensitiveTransaction: true,
      );
      setState(() {
        _isAuthenticating = false;
        _authorized = '验证中';
      });
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    final String message = authenticated ? '已授权' : '非授权';
    setState(() {
      _authorized = message;
    });
  }

  void _cancelAuthentication() {
    auth.stopAuthentication();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: 'local_auth',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text('可以检查生物特征: $_canCheckBiometrics\n'),
                RaisedButton(
                  child: const Text('检查生物特征'),
                  onPressed: _checkBiometrics,
                ),
                Text('可用的生物识别: $_availableBiometrics\n'),
                RaisedButton(
                  child: const Text('获取可用的生物识别'),
                  onPressed: _getAvailableBiometrics,
                ),
                Text('当前状态: $_authorized\n'),
                RaisedButton(
                  child: Text(_isAuthenticating ? '取消' : '认证'),
                  onPressed:
                      _isAuthenticating ? _cancelAuthentication : _authenticate,
                )
              ])),
    );
  }
}
