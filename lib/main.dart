import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new HomePage());

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      theme: new ThemeData(
        primaryColor: Colors.amberAccent,
      ),
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
// 构建
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ListView Flutter Conan'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestins(),
    );
  }
  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute(
          builder: (context){
            final tiles = _saved.map(
                (pair){
                  return new ListTile(
                    title: new Text(
                      pair.asPascalCase,
                      style: _biggerFont,
                    ),
                  );
                });

            final divided = ListTile.divideTiles(tiles: tiles,
            context: context).toList();

            return new Scaffold(
              appBar: new AppBar(
                title: new Text('Saved Suggestions'),
              ),
              body: new ListView(children: divided,),
            );
          }
          )
    );
  }

  //建议单词列表
  final _suggestions = <WordPair>[];
  //字体大小
  final _biggerFont = const TextStyle(fontSize: 18.0);
//构建建议单词
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

  // 构建展示单词
  Widget _buildRow(WordPair pair) {
    final alreadSaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadSaved ? Icons.favorite : Icons.favorite_border,
        color: alreadSaved ? Colors.red : Colors.orangeAccent,
      ),
      onTap: () {
        //在Flutter的响应式风格的框架中，调用setState()会为State对象触发build()方法，从而导致对UI的更新
        setState(() {
          if (alreadSaved) {
            _saved.remove(pair);
          }else{
            _saved.add(pair);
          }
        });
      },
    );
  }

  //数据集合 Set比list更好，因为set数据不允许重复
  final _saved = new Set<WordPair>();

}
