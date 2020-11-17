import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/rendering.dart';

import 'signin_button.dart';
import 'teddy_controller.dart';
import 'tracking_text_input.dart';



class ExampleTeddyPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ExampleTeddyPage> {
  TeddyController _teddyController;
  @override
  initState() {
    _teddyController = TeddyController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    EdgeInsets devicePadding = MediaQuery.of(context).padding;

    return Scaffold(
      backgroundColor: Color.fromRGBO(93, 142, 155, 1.0),
      body: Container(
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        // Add one stop for each color. Stops should increase from 0 to 1
                        stops: [0.0, 1.0],
                        colors: [
                          Color.fromRGBO(170, 207, 211, 1.0),
                          Color.fromRGBO(93, 142, 155, 1.0),
                        ],
                      ),
                    ),
                  )),
              Positioned.fill(
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        left: 20.0, right: 20.0, top: devicePadding.top + 50.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              height: 200,
                              padding: const EdgeInsets.only(left: 30.0, right:30.0),
                              child: FlareActor(
                                "assets/animations/teddy.flr",
                                shouldClip: false,
                                alignment: Alignment.bottomCenter,
                                fit: BoxFit.contain,
                                controller: _teddyController,
                              )),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(25.0))),
                              child: Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: Form(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        TrackingTextInput(
                                            label: "Email",
                                            hint: "What's your email address?",
                                            onCaretMoved: (Offset caret) {
                                              _teddyController.lookAt(caret);
                                            }),
                                        TrackingTextInput(
                                          label: "Password",
                                          hint: "Try 'bears'...",
                                          isObscured: true,
                                          onCaretMoved: (Offset caret) {
                                            _teddyController.coverEyes(caret != null);
                                            _teddyController.lookAt(null);
                                          },
                                          onTextChanged: (String value) {
                                            _teddyController.setPassword(value);
                                          },
                                        ),
                                        SigninButton(
                                            child: Text("Sign In",
                                                style: TextStyle(
                                                    fontFamily: "RobotoMedium",
                                                    fontSize: 16,
                                                    color: Colors.white)),
                                            onPressed: () {
                                              _teddyController.submitPassword();
                                            })
                                      ],
                                    )),
                              )),
                        ])),
              ),
            ],
          )),
    );
  }
}