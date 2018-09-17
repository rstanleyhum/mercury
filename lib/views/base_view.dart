import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../actions/actions.dart';
import '../models/app_state.dart';

import '../widgets/primary_top_bar.dart';
import '../widgets/primary_bottom_bar.dart';
import '../widgets/main_drawer.dart';
import '../widgets/main_viewport.dart';

import '../widgets/extended_tab_controller.dart';

import '../keys.dart';

class BaseView extends StatefulWidget {
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  BaseView({
    Key key,
    this.analytics,
    this.observer,
  }) : super(key: key);

  @override
  _BaseViewState createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> with TickerProviderStateMixin {
  _BaseViewState({Key key});

  ExtendedTabController _newsController;
  ExtendedTabController _handbookController;
  ExtendedTabController _pharmaController;

  @override
  void dispose() {
    _newsController.dispose();
    _handbookController.dispose();
    _pharmaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => StoreConnector<AppState, _ViewModel>(
        distinct: true,
        converter: _ViewModel.fromStore,
        onInit: (store) {
          _newsController = ExtendedTabController(
            key: MercuryKeys.newsController,
            vsync: this,
            length: 3,
            initialIndex: 0,
            callback: (i) => store.dispatch(SetNewsIndexAction(i)),
          );
          _handbookController = ExtendedTabController(
            key: MercuryKeys.handbookController,
            vsync: this,
            length: 4,
            initialIndex: 0,
            callback: (i) => store.dispatch(SetHandbookIndexAction(i)),
          );
          _pharmaController = ExtendedTabController(
            key: MercuryKeys.pharmaController,
            vsync: this,
            length: 5,
            initialIndex: 0,
            callback: (i) => store.dispatch(SetPharmaIndexAction(i)),
          );
          store.dispatch(SetInitialTabAction());
        },
        onWillChange: (vm) {},
        builder: (context, vm) => Scaffold(
              appBar: PrimaryTopBar(
                index: vm.activeIndex,
              ),
              body: <Widget>[
                MainViewport(
                    key: MercuryKeys.newsViewport, controller: _newsController),
                MainViewport(
                  key: MercuryKeys.handbookViewport,
                  controller: _handbookController,
                ),
                MainViewport(
                  key: MercuryKeys.pharmaViewport,
                  controller: _pharmaController,
                ),
              ][vm.activeIndex],
              bottomNavigationBar: PrimaryBottomBar(
                currentIndex: vm.activeIndex,
                onTabSelected: vm.onTabSelected,
              ),
              drawer: MainDrawer(),
            ),
      );
}

class _ViewModel {
  final int activeIndex;
  final Function(int) onTabSelected;

  _ViewModel({
    @required this.activeIndex,
    @required this.onTabSelected,
  });

  static _ViewModel fromStore(Store<AppState> store) => _ViewModel(
        activeIndex: store.state.tabIndex,
        onTabSelected: (index) {
          store.dispatch(SetTabIndexAction(index));
        },
      );

  @override
  int get hashCode => activeIndex.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _ViewModel &&
          runtimeType == other.runtimeType &&
          activeIndex == other.activeIndex;
}
