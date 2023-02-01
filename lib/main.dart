import 'package:flutter/material.dart';
import 'screens/intro_screen.dart';

void main() {
  runApp(const MyMancho());
}

class MyMancho extends StatelessWidget {
  const MyMancho({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.green,
        )),
        home: const IntroScreen());
  }
}
