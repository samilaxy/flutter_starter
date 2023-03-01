import 'package:flutter/material.dart';
import 'package:flutter_starter/repository/auth_repository.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();
 final authRepository = Get.put(AuthRepository());
//get data from textfields
  final username = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  //register user
  void registerUser(String email, String password) {
    AuthRepository.instance.createUserWithEmailAndPassword(email, password);
  }
}
