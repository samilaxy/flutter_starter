import 'package:flutter/material.dart';
import 'package:flutter_starter/utils/color_utils.dart';
import '../../shared/custom_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            hexStringToColor("F5F5DC"),
            hexStringToColor("808080"),
            hexStringToColor("21201E"),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      20, MediaQuery.of(context).size.height * 0.2, 20, 0),
                  child: Column(children: <Widget>[
                  //  logoWidget("assets/cloud.jpeg")
                  ])))),
    );
  }
}


