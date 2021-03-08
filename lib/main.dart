import 'package:flutter/material.dart';

void main() => runApp(new HomePage1());

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Flutter'),
        ),
        body: new Center(
          child: new Text('Hello World Flutter!'),
        ),
      ),
    );
  }
}

class HomePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Flutter1'),
        ),
        body: new Center(
          child: new Text('1 Hello World Flutter!'),
        ),
      ),
    );
  }
}