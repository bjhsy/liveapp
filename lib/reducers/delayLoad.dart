import 'package:liveapp/store/AppState.dart';

class DelayLoadAction {
  String text;
  DelayLoadAction({this.text});
}

AppState delayLoad(AppState state, DelayLoadAction action) {
  var newstate = AppState();
  newstate.announcement = action.text;
  return newstate;
}
