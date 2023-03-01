import 'package:flutter/material.dart';
import 'package:flutter_starter/repository/auth_repository.dart';
import 'package:flutter_starter/screens/bmi_screen.dart';
import 'package:flutter_starter/screens/weather_screen.dart';
import 'package:get/get.dart';
import 'screens/intro_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).
  then((value) => Get.put(AuthRepository()));
  runApp(const MyMancho());
  
}

class MyMancho extends StatelessWidget {
  const MyMancho({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.white54,
        )),
        routes: {
          '/': (context) => const LoginScreen(),
          '/signup': (context) => const SignupScreen(),
          '/intro': (context) => const IntroScreen(),
          '/weather': (context) => const WeatherScreen(),
          '/bmi': (context) => const BmiScreen(),
        },
      //  initialRoute: '/'
        );
  }
}
