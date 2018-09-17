import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'models/app_state.dart';
import 'reducers/app_state_reducer.dart';
import 'main_app.dart';

import 'assets.dart' as assets;

void main() {
  final store = new Store<AppState>(
    appStateReducer,
    initialState: AppState(
      tabIndex: 0,
      newsIndex: 0,
      handbookIndex: 0,
      pharmaIndex: 0,
      newsArticles: assets.newsList,
      handbookArticles: assets.handbookList,
      pharmaArticles: assets.pharmaList,
    ),
    middleware: [
      LoggingMiddleware.printer(),
      thunkMiddleware,
    ],
  );

  runApp(MainApp(
    store: store,
  ));
}
