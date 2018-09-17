import 'package:redux/redux.dart';

import '../assets.dart' as assets;

import '../actions/actions.dart';
import '../models/app_state.dart';
import '../models/article.dart';


final appStateReducer = combineReducers<AppState>([
  TypedReducer<AppState, SetTabIndexAction>(_setTabIndex),
  TypedReducer<AppState, SetNewsIndexAction>(_setNewsIndex),
  TypedReducer<AppState, SetHandbookIndexAction>(_setHandbookIndex),
  TypedReducer<AppState, SetPharmaIndexAction>(_setPharmaIndex),
  TypedReducer<AppState, SetInitialTabAction>(_setInitialTab),
]);

AppState _setTabIndex(AppState state, SetTabIndexAction action) {
  int initialIndex;
  List<Article> list; 
  switch (action.index) {
    case 0:
      initialIndex = state.newsIndex;
      list = assets.newsList;
      break;
    case 1:
      initialIndex = state.handbookIndex;
      list = assets.handbookList;
      break;
    case 2:
      initialIndex = state.pharmaIndex;
      list = assets.pharmaList;
      break;
    default:
      initialIndex = 0;
  }
  return state.copyWith(
    tabIndex: action.index,
    initialIndex: initialIndex,
    articleList: list,
  );
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

AppState _setInitialTab(AppState state, SetInitialTabAction action) {
  return state.copyWith(
    tabIndex: 0,
    articleList: assets.newsList,
    initialIndex: 0,
  );
}

