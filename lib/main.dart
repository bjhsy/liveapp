import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'reducers/Index.dart';
import 'store/AppState.dart';
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
    return StoreProvider(
      store: Store<AppState>(
        appReducer,
        initialState: AppState(),
        middleware: [thunkMiddleware],
      ),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        routes: {
          'login': (context) => Container(),
          'main': (context) => Main.Index(),
          'message': (context) => Message.Index(),
        },
        initialRoute: 'main',
      ),
    );
  }
}
