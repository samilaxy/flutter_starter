import 'package:flutter/material.dart';
import 'package:flutter_starter/repository/auth_repository.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
//  AuthRepository authRepository = Get.put(AuthRepository());
//get data from textfields
  final email = TextEditingController();
  final password = TextEditingController();

  //register user
  void loginUser(String email, String password) {
     AuthRepository.instance.logineUserWithEmailAndPassword(email, password);
   // authRepository.logineUserWithEmailAndPassword(email, password);
  }
}
