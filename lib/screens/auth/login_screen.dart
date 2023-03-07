import 'package:flutter/material.dart';
import 'package:flutter_starter/controllers/login_controller.dart';
import 'package:flutter_starter/utils/color_utils.dart';
import 'package:get/get.dart';
import '../../shared/custom_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();

  final TextEditingController passwordTxt = TextEditingController();
  // final TextEditingController emailTxt = TextEditingController();
  // final TextEditingController passwordTxt = TextEditingController();
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
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Column(children: <Widget>[
                      logoWidget("assets/logo.png"),
                      const SizedBox(
                        height: 50,
                      ),
                      customTextField("Enter email", Icons.verified_user_sharp,
                          false, controller.email),
                      const SizedBox(
                        height: 30,
                      ),
                      customTextField("Enter password", Icons.lock, true,
                          controller.password),
                      const SizedBox(
                        height: 10,
                      ),
                      GetBuilder<LoginController>(
                        builder: (_) => Text(
                          controller.errMessage,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              fontSize: 12,
                              color: Colors.red,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                        child: ElevatedButton(
                            onPressed: login,
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateColor.resolveWith((states) {
                                  if (states.contains(MaterialState.pressed)) {
                                    return Colors.black87;
                                  }
                                  return Colors.black87;
                                }),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)))),
                            // color: Colors.black26,
                            child: const Text('Login',
                                style: TextStyle(
                                    color: Colors.white60,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16))),
                      ),
                      loginOption(),
                      const SizedBox(
                        height: 30,
                      )
                    ]))),
          )),
    );
  }

  Row loginOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an acoount?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "/signup");
          },
          child: const Text(" Sign Up",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        )
      ],
    );
  }

  login() {
    // Navigator.pushNamed(context,"/signup");
    print("object: " +
        controller.email.text.trim() +
        controller.password.text.trim());
    LoginController.instance.loginUser(
        controller.email.text.trim(), controller.password.text.trim());
  }
}
