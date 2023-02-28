import 'package:flutter/material.dart';
import 'package:flutter_starter/controllers/signup_controller.dart';
import 'package:flutter_starter/utils/color_utils.dart';
import 'package:get/get.dart';
import '../../shared/custom_widget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final controller = Get.put(SignupController());
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailTxt = TextEditingController();
  final TextEditingController passwordTxt = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
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
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Column(children: <Widget>[
                      logoWidget("assets/logo.png"),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text("Sign Up",
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 30,
                      ),
                      Form(
                        key: _formKey,
                        child:  Column(children: <Widget>[
                        customTextField("Enter Fullname",
                          Icons.supervised_user_circle, false, emailTxt),
                      const SizedBox(
                        height: 30,
                      ),
                      customTextField("Enter email", Icons.verified_user_sharp,
                          false, emailTxt),
                      const SizedBox(
                        height: 30,
                      ),
                      customTextField("Enter password", Icons.lock, true,
                          controller.password),
                      const SizedBox(
                        height: 30,
                      ),
                      customTextField(
                          "Enter password", Icons.lock, true, passwordTxt),
                      const SizedBox(
                        height: 30,
                      ),
                       customButton(context, "Sign Up", signup)
                      ])),
                      signUpOption(),
                      const SizedBox(
                        height: 30,
                      )
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
            Navigator.pushNamed(context, "/");
          },
          child: const Text(" Login",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        )
      ],
    );
  }

  signup() {
    print("object");
    // Navigator.pushNamed(context,"/intro");
  }
}
