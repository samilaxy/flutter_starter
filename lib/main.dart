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
            appBar: AppBar(title: const Text('MyManchodfd')),
            body: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/macho.jpg'),
                fit: BoxFit.cover,
              )),
              child: Center(
                child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                      color: Colors.white60,
                    ),
                    child: const Text('No Pain, No Gain.')),
              ),
            )));
  }
}
