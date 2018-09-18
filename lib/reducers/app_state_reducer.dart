import 'package:redux/redux.dart';

import '../actions/actions.dart';
import '../models/app_state.dart';

final appStateReducer = combineReducers<AppState>([
  TypedReducer<AppState, SetTabIndexAction>(_setTabIndex),
  TypedReducer<AppState, SetNewsIndexAction>(_setNewsIndex),
  TypedReducer<AppState, SetHandbookIndexAction>(_setHandbookIndex),
  TypedReducer<AppState, SetPharmaIndexAction>(_setPharmaIndex),
  TypedReducer<AppState, SetInitialTabAction>(_setInitialTab),
  TypedReducer<AppState, SetNewsArticlesAction>(_setNewsArticles),
  TypedReducer<AppState, SetHandbookArticlesAction>(_setHandbookArticles),
  TypedReducer<AppState, SetPharmaArticlesAction>(_setPharmaArticles),
  TypedReducer<AppState, SetAllArticlesAction>(_setAllArticles),
  TypedReducer<AppState, SetHandbookIDAction>(_setHandbookID),
  TypedReducer<AppState, SetHandbookParentIDAction>(_setHandbookParentID),
]);

AppState _setTabIndex(AppState state, SetTabIndexAction action) {
  int initialIndex;
  switch (action.index) {
    case 0:
      initialIndex = state.newsIndex;
      break;
    case 1:
      initialIndex = state.handbookIndex;
      break;
    case 2:
      initialIndex = state.pharmaIndex;
      break;
    default:
      initialIndex = 0;
  }
  return state.copyWith(
    tabIndex: action.index,
    initialIndex: initialIndex,
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
    initialIndex: 0,
  );
}

AppState _setNewsArticles(AppState state, SetNewsArticlesAction action) {
  return state.copyWith(
    newsArticles: action.list,
  );
}

AppState _setHandbookArticles(
    AppState state, SetHandbookArticlesAction action) {
  return state.copyWith(
    handbookArticles: action.list,
  );
}

AppState _setPharmaArticles(AppState state, SetPharmaArticlesAction action) {
  return state.copyWith(
    pharmaArticles: action.list,
  );
}

AppState _setAllArticles(AppState state, SetAllArticlesAction action) {
  return state.copyWith(
    allArticles: action.articles,
  );
}

AppState _setHandbookID(AppState state, SetHandbookIDAction action) {
  return state.copyWith(
    handbookID: action.id,
  );
}

AppState _setHandbookParentID(
    AppState state, SetHandbookParentIDAction action) {
  return state.copyWith(
    handbookParentID: action.id,
  );
}
