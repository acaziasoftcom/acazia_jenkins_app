import 'package:acazia_jenkins/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 42, horizontal: 50),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AJColors.DARK_BLUE, AJColors.ALMOST_BLACK])),
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(30, 46, 30, 38),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: AJColors.DARK_BLUE,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 5.0,
                    spreadRadius: 7.0)
              ], shape: BoxShape.circle),
              child: Icon(
                FontAwesomeIcons.jenkins,
                color: Colors.white,
                size: 86,
              ),
            ),
            SizedBox(
                child: Column(
              children: <Widget>[
                TextField(
                  style: TextStyle(color: Colors.white60),
                  decoration: InputDecoration(
                      counterText: '',
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AJColors.GUNMETAL)),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: AJColors.GUNMETAL)),
                      hintText: 'Username',
                      hintStyle: TextStyle(color: AJColors.GUNMETAL)),
                  maxLength: 32,
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                TextField(
                  obscureText: true,
                  style: TextStyle(color: Colors.white60),
                  decoration: InputDecoration(
                      counterText: '',
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AJColors.GUNMETAL)),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: AJColors.GUNMETAL)),
                      hintText: 'Password',
                      hintStyle: TextStyle(color: AJColors.GUNMETAL)),
                  maxLength: 32,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 120, maxWidth: 230),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsetsDirectional.only(top: 62)),
                      FlatButton(
                        color: AJColors.DARK_BLUE_GREY,
                        onPressed: () {},
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white54),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
