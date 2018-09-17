import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../actions/actions.dart';
import '../models/app_state.dart';

import '../widgets/primary_top_bar.dart';
import '../widgets/news_viewport.dart';
import '../widgets/handbook_viewport.dart';
import '../widgets/pharma_viewport.dart';
import '../widgets/primary_bottom_bar.dart';
import '../widgets/main_drawer.dart';

class BaseView extends StatelessWidget {
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  final List<Widget> children = [
    NewsViewport(),
    HandbookViewport(),
    PharmaViewport()
  ];

  BaseView({
    Key key,
    this.analytics,
    this.observer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => StoreConnector<AppState, _ViewModel>(
        distinct: true,
        converter: _ViewModel.fromStore,
        onInit: (store) {
          print("onInit: ${store.state.tabIndex}");
        },
        onWillChange: (vm) {
          print("onWillChange: ${vm.activeIndex}");
        },
        builder: (context, vm) => Scaffold(
              appBar: PrimaryTopBar(
                index: vm.activeIndex,
              ),
              body: children[vm.activeIndex],
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
