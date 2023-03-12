import 'package:flutter/material.dart';
import '../data/session.dart';
import '../data/sp_helper.dart';
import '../shared/menu_drawer.dart';
import '../shared/menu_bottom.dart';


class SessionsScreen extends StatefulWidget {
  const SessionsScreen({super.key});

  @override
  State<SessionsScreen> createState() => _SessionsScreenState();
}

class _SessionsScreenState extends State<SessionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Training Sessions',
              style: TextStyle(color: Colors.white70)),
          backgroundColor: Colors.grey,
        ),
        drawer: const MenuDrawer(),
        bottomNavigationBar: const MenuBottom(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: [],
            ),
          ),
        ),
       floatingActionButton: FloatingActionButton(onPressed: () {
         
       },
       child: const Icon(Icons.add),
       backgroundColor: Colors.grey,
       ), 
        
        );
  }
}