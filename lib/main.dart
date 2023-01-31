import 'package:flutter/material.dart';

void main() {
  runApp(const MyMancho());
}

class MyMancho extends StatelessWidget {
  const MyMancho({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: Text('MyManchodfd')),
        ));
  }
}
