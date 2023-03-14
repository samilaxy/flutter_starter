import 'package:flutter/material.dart';
import '../data/session.dart';
import '../data/sp_helper.dart';
import '../shared/menu_drawer.dart';
import '../shared/menu_bottom.dart';
import 'package:lil_auto_increment/lil_auto_increment.dart';

class SessionsScreen extends StatefulWidget {
  const SessionsScreen({super.key});

  @override
  State<SessionsScreen> createState() => _SessionsScreenState();
}

class _SessionsScreenState extends State<SessionsScreen> {
  List<Session> sessions = [];
  final TextEditingController txtdescription = TextEditingController();
  final TextEditingController txtduration = TextEditingController();
  final SPHelper helper = SPHelper();
  final Id nextId1 = autoIncrement();
  @override
  void initState() {
    helper.inti().then((value) => {updateScreen()});
    super.initState();
  }

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
      body: ListView(children: getContent()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showMessageDialog(context);
        },
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
              ElevatedButton(onPressed: saveSession, child: const Text('Save'))
            ],
          );
        });
  }

  Future saveSession() async {
    DateTime now = DateTime.now();
    String today = '${now.year}-${now.month}-${now.day}';
    Session newSession = Session(
       int.tryParse(nextId1.toString()) ?? 0, today, txtdescription.text, int.tryParse(txtduration.text) ?? 0);
    helper.writeSession(newSession);
    Navigator.pop(context);
    txtdescription.text = '';
    txtduration.text = '';
  }

  List<Widget> getContent() {
    List<Widget> tiles = [];
    sessions.forEach((session) {
      tiles.add(ListTile(
        title: Text(session.description),
        subtitle: Text('${session.date} - duration: ${session.duration} min'),
      ));
    });
    print('tiles: ${tiles}');
    return tiles;
  }

  void updateScreen() {
    sessions = helper.getSessions();
    setState(() {});
  }
}
