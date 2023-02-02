import 'package:flutter/material.dart';
import 'package:flutter_starter/shared/menu_bottom.dart';
import 'package:flutter_starter/shared/menu_drawer.dart';

class BmiScreen extends StatelessWidget {
  const BmiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('BMI Calculator', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white30,
      ),
      drawer: const MenuDrawer(),
      bottomNavigationBar: const MenuBottom(),
      body: const Center(child: FlutterLogo()),
    );
  }
}
