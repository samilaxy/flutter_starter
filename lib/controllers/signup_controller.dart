import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

//get data from textfields
  final username = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  //register user
  void registerUser(String email, String password){

  }
}
