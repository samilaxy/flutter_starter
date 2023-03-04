import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/repository/auth_repository.dart';
import 'package:get/get.dart';

import '../repository/exceptions/exceptions_class.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();
  final authRepository = Get.put(AuthRepository());
//get data from textfields
  final username = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final comfirmPassword = TextEditingController();
  String _errMessage = "";
  String get errorMessage => _errMessage;
  var isvalidated = false;
  //register user
  void registerUser(String email, String password) async {
    // if (validation()) {
    try {
      await AuthRepository.instance
          .createUserWithEmailAndPassword(email, password);
      //  }
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      _errMessage = ex.message;
      print('errorMessage - ${ex.message}');
       throw ex;
    } catch (_) {
       const ex = SignUpWithEmailAndPasswordFailure();
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      _errMessage = ex.message;
    }
  }

  // void validation() {
  //   if (email.text.isEmpty || password.text.isEmpty) {
  //     errorMessage = "*complete all fields";
  //     isvalidated = false;
  //   } else if (comfirmPassword.text != password.text) {
  //     errorMessage = "*passwords mismatch";
  //     isvalidated = false;
  //   } else {
  //     isvalidated = true;
  //   }
  // }

  bool validation() {
    if (email.text.isEmpty || password.text.isEmpty) {
      _errMessage = "*complete all fields";
      return false;
    } else if (comfirmPassword.text != password.text) {
      _errMessage = "*passwords mismatch";
      return false;
    } else {
      return true;
    }
    print("message$errorMessage");
  }
}
