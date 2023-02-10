import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import '../shared/menu_bottom.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final randomWordPair = <WordPair>[];
  final savedWordPairs = Set<WordPair>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('WordPair Generator',
              style: TextStyle(color: Colors.white70)),
          backgroundColor: Colors.grey,
          actions: <Widget>[
            IconButton(onPressed: _pushSaved, icon: Icon(Icons.list))
          ]),
      body: _buildList(),
      bottomNavigationBar: const MenuBottom(),
    );
  }

  Widget _buildList() {
    return ListView.builder(
        padding: const EdgeInsets.all(10.0),
        itemBuilder: (context, item) {
          if (item.isOdd) return Divider();
          final index = item ~/ 2;
          if (index >= randomWordPair.length) {
            randomWordPair.addAll(generateWordPairs().take(10));
          }
          return _buildRow(randomWordPair[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final savedAlready = savedWordPairs.contains(pair);
    return ListTile(
        title: Text(pair.asPascalCase, style: TextStyle(fontSize: 18.0)),
        trailing: Icon(savedAlready ? Icons.favorite : Icons.favorite_border,
            color: savedAlready ? Colors.red : null),
        onTap: () {
          setState(() {
            if (savedAlready) {
              savedWordPairs.remove(pair);
            } else {
              savedWordPairs.add(pair);
            }
          });
        });
  }

  void _pushSaved() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      final Iterable<ListTile> tiles = savedWordPairs.map((WordPair pair) {
        return ListTile(
          title: Text(pair.asPascalCase, style: TextStyle(fontSize: 16.0)),
        );
      });
      final List<Widget> divided =
          ListTile.divideTiles(context: context, tiles: tiles).toList();
      return Scaffold(
          appBar: AppBar(
              title: Text('Done Workouts',
                  style: TextStyle(color: Colors.white70))),
          backgroundColor: Colors.grey,
          body: ListView(children: divided));
    }));
  }
}
