import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new HomePage());

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new RandomWords(),
    );
  }
}

//单词生成类
class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  @override

  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ListView Flutter Conan'),
      ),
      body: _buildSuggestins(),
    );
  }

  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildSuggestins() {
    return new ListView.builder(itemBuilder: (context, i) {
      if (i.isOdd) return new Divider();

      final index = i ~/ 2;
      if (index >= _suggestions.length) {
        _suggestions.addAll(generateWordPairs().take(10));
      }
      return _buildRow(_suggestions[index]);
    },
    padding: const EdgeInsets.all(16.0),
    );
  }


  Widget _buildRow(WordPair pair) {
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}
