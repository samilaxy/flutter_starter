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
  final signUpcontroller = Get.put(SignupController());
  final _formKey = GlobalKey<FormState>();

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
                        child: Column(children: <Widget>[
                          customTextField(
                              "Enter Full name",
                              Icons.supervised_user_circle,
                              false,
                              signUpcontroller.username),
                          const SizedBox(
                            height: 30,
                          ),
                          customTextField(
                              "Enter email",
                              Icons.verified_user_sharp,
                              false,
                              signUpcontroller.email),
                          const SizedBox(
                            height: 30,
                          ),
                          customTextField("Enter password", Icons.lock, true,
                              signUpcontroller.password),
                          const SizedBox(
                            height: 30,
                          ),
                          customTextField("Enter password", Icons.lock, true,
                              signUpcontroller.comfirmPassword),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                            child: ElevatedButton(
                                onPressed: signup,
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateColor.resolveWith(
                                            (states) {
                                      if (states
                                          .contains(MaterialState.pressed)) {
                                        return Colors.black87;
                                      }
                                      return Colors.black87;
                                    }),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)))),
                                child: const Text('Sign Up',
                                    style: TextStyle(
                                        color: Colors.white60,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16))),
                          ),
                        ]),
                      ),
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
    if (_formKey.currentState!.validate()) {
     
      signUpcontroller.registerUser(signUpcontroller.email.text.trim(),
          signUpcontroller.password.text.trim());
        
            print("hereeeeee: ${signUpcontroller.errorMessage}");
       
           
    }
  }
}
