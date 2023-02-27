import 'package:flutter/material.dart';
import 'package:flutter_starter/utils/color_utils.dart';

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
            hexStringToColor("CB2B93"),
            hexStringToColor("9546C4"),
            hexStringToColor("5E61F4"),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      20, MediaQuery.of(context).size.height * 0.2, 20, 0),
                  child: Column(children: <Widget>[
                    logoWidget("imageName")
                  ])))),
    );
  }
}

Image logoWidget(String imageName) {
  return Image.asset(imageName,
      fit: BoxFit.fitWidth, 
      width: 240, height: 240, 
      color: Colors.white);
}
