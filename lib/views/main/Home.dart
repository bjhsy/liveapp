import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('社区app'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.mail),
            onPressed: () {
              Navigator.pushNamed(context, 'message');
            },
          )
        ],
      ),
      body: Container(),
    );
  }
}
