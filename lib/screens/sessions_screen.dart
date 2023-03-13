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
  final TextEditingController txtdescription = TextEditingController();
  final TextEditingController txtduration = TextEditingController();
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.grey,
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<dynamic> showMessageDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Insert Training Sessions'),
            content: SingleChildScrollView(
                child: Column(children: [
              TextField(
                  controller: txtdescription,
                  decoration: const InputDecoration(hintText: 'description')),
              TextField(
                controller: txtduration,
                decoration: const InputDecoration(hintText: 'Duration'),
              )
            ])),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    txtdescription.text = '';
                    txtduration.text = '';
                  },
                  child: const Text('Cancel')),
                  ElevatedButton(
                  onPressed:saveSession,
                  child: const Text('Save'))
            ],
          );
        });
  }

  Future saveSession()  async{
  }
}
