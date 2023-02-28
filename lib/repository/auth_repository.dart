import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_starter/screens/auth/login_screen.dart';
import 'package:flutter_starter/screens/intro_screen.dart';
import 'package:get/get.dart';

class AuthRepository extends GetxController {
  static AuthRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitilaState);
  }
}

_setInitilaState(User? user) {
  user == null
      ? Get.offAll(() => const LoginScreen())
      : Get.offAll(() => const IntroScreen());
}
