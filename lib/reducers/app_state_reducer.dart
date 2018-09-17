import 'package:redux/redux.dart';

import '../actions/actions.dart';
import '../models/app_state.dart';

final appStateReducer = combineReducers<AppState>([
  TypedReducer<AppState, SetTabIndexAction>(_setTabIndex),
  TypedReducer<AppState, SetNewsIndexAction>(_setNewsIndex),
  TypedReducer<AppState, SetHandbookIndexAction>(_setHandbookIndex),
  TypedReducer<AppState, SetPharmaIndexAction>(_setPharmaIndex),
]);

AppState _setTabIndex(AppState state, SetTabIndexAction action) {
  return state.copyWith(tabIndex: action.index);
}

AppState _setNewsIndex(AppState state, SetNewsIndexAction action) {
  return state.copyWith(newsIndex: action.index);
}

AppState _setHandbookIndex(AppState state, SetHandbookIndexAction action) {
  return state.copyWith(handbookIndex: action.index);
}

AppState _setPharmaIndex(AppState state, SetPharmaIndexAction action) {
  return state.copyWith(pharmaIndex: action.index);
}
