import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'views/message/Index.dart' as Message;
import 'views/main/Index.dart' as Main;

void main() {
  runApp(App());

  SystemUiOverlayStyle systemUiOverlayStyle =
      SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      routes: {
        'login': (context) => Container(),
        'main': (context) => Main.Index(),
        'message': (context) => Message.Index(),
      },
      initialRoute: 'main',
    );
  }
}
