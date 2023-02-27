import 'package:flutter/material.dart';
import 'package:flutter_starter/utils/color_utils.dart';
import '../../shared/custom_widget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailTxt = TextEditingController();
  final TextEditingController passwordTxt = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            hexStringToColor("F5F5DC"),
            hexStringToColor("2E3033"),
            hexStringToColor("21201E"),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: Center(
            child: SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Column(children: <Widget>[
                      logoWidget("assets/logo.png"),
                      SizedBox(
                        height: 30,
                      ),
                      customTextField("Enter email", Icons.verified_user_sharp,
                          false, emailTxt),
                      SizedBox(
                        height: 30,
                      ),
                      customTextField(
                          "Enter password", Icons.lock, true, passwordTxt),
                      SizedBox(
                        height: 30,
                      ),
                      customButton(context, "Sign Up", signup),
                      signUpOption()
                    ]))),
          )),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Already have an account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignupScreen()));
          },
          child: const Text("Login",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        )
      ],
    );
  }

  signup(context, tr) {}
}
