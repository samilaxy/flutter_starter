import 'package:flutter/material.dart';
import 'package:flutter_starter/repository/auth_repository.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
//  AuthRepository authRepository = Get.put(AuthRepository());
//get data from textfields
  final email = TextEditingController();
  final password = TextEditingController();
  String errMessage = "";
  //register user
  void loginUser(String email, String password) {
    if (validation()) {
      AuthRepository.instance.logineUserWithEmailAndPassword(email, password);
    }
    update();
  }

  bool validation() {
    if (email.text.isEmpty || password.text.isEmpty) {
      errMessage = "*complete all fields";
      return false;
    } else {
      return true;
    }
  }
}
