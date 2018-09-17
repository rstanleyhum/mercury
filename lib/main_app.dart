import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'models/app_state.dart';
import 'views/material_base.dart';

class MainApp extends StatelessWidget {
  final Store<AppState> store;

  MainApp({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) => StoreProvider<AppState>(
        store: store,
        child: MaterialBase(),
      );
}
