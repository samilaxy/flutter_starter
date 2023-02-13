import 'package:flutter/material.dart';

class MenuBottom extends StatelessWidget {
  const MenuBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey,
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/');
              break;
            case 1:
              Navigator.pushNamed(context, '/weather');
              break;
            case 2:
              Navigator.pushNamed(context, '/bmi');
              break;
          }
        },
        items: [
          // ignore: prefer_const_constructors
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.home_rounded,
                color: Colors.white54,
              ),
              icon: const Icon(Icons.home_rounded),
              label: 'Home'),

          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.home_rounded,
                color: Colors.white54,
              ),
              icon: Icon(Icons.cloud_circle),
              label:  'Weather'),
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.home_rounded,
                color: Colors.white54,
              ),
              icon: Icon(Icons.monitor_weight),
              label: 'BMI',
              )
        ]);
  }
}
