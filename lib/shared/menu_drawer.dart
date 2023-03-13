import 'package:flutter/material.dart';
import 'package:flutter_starter/screens/sessions_screen.dart';
import 'package:flutter_starter/screens/weather_screen.dart';
import '../repository/auth_repository.dart';
import '../screens/bmi_screen.dart';
import '../screens/intro_screen.dart';
import '../screens/todo_screen.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey,
      child: ListView(
        children: buildMenuItems(context),
      ),
    );
  }

  List<Widget> buildMenuItems(BuildContext context) {
    final List<String> muenuTitles = [
      'Home',
      'BMI Calculator',
      'Weather',
      'Training',
      'Workouts Todo',
      'Sessions',
      'Log Out'
    ];
    List<Widget> menuItems = [];
    menuItems.add(const DrawerHeader(
        decoration: BoxDecoration(color: Colors.white30),
        child: Text('MyMacho',
            style: TextStyle(color: Colors.black, fontSize: 20))));
    // ignore: avoid_function_literals_in_foreach_calls
    muenuTitles.forEach((element) {
      Widget screen = Container();
      menuItems.add(ListTile(
        title: Text(element, style: const TextStyle(fontSize: 15)),
        onTap: () {
          switch (element) {
            case 'Home':
              screen = const IntroScreen();
              break;
            case 'BMI Calculator':
              screen = const BmiScreen();
              break;
            case 'Weather':
              screen = const WeatherScreen();
              break;
            case 'Sessions':
              screen = const SessionsScreen();
              break;
            case 'Workouts Todo':
              screen = const TodoScreen();
              break;
            case 'Log Out':
             // screen = const LoginScreen();
              AuthRepository.instance.logout();
              break;
          }
          Navigator.of(context).pop();
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => screen));
        },
      ));
    });
    return menuItems;
  }
}
