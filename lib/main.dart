import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'models/app_state.dart';
import 'reducers/app_state_reducer.dart';
import 'main_app.dart';

void main() {
  final store = new Store<AppState>(
    appStateReducer,
    initialState: AppState(
      tabIndex: 0,
      newsIndex: 0,
      handbookIndex: 0,
      pharmaIndex: 0,
    ),
  );

  runApp(MainApp(
    store: store,
  ));
}
