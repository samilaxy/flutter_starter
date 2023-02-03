import 'package:flutter/material.dart';
import '../shared/menu_drawer.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('MyMancho', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white30,
        ),
        drawer: const MenuDrawer(),
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
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white70,
                ),
                child: const Text(
                  'No Pain, No Gain.',
                  style: TextStyle(fontSize: 15, shadows: [
                    Shadow(
                        offset: Offset(1.0, 1.0),
                        blurRadius: 2.0,
                        color: Colors.grey)
                  ]),
                )),
          ),
        ));
  }
}
