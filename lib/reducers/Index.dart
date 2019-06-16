import 'package:liveapp/store/AppState.dart';
import 'package:redux/redux.dart';

import 'delayLoad.dart';

final appReducer = combineReducers<AppState>([
  TypedReducer<AppState, DelayLoadAction>(delayLoad),
]);
