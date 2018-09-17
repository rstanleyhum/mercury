import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../actions/actions.dart';
import '../models/app_state.dart';
import '../models/article.dart';

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

  List<MainViewport> _createViewports({
    ExtendedTabController newsController,
    ExtendedTabController handbookController,
    ExtendedTabController pharmaController,
    List<Article> newsArticles,
    List<Article> handbookArticles,
    List<Article> pharmaArticles,
  }) {
    return [
      MainViewport(
        key: MercuryKeys.newsViewport,
        controller: newsController,
        articles: newsArticles,
      ),
      MainViewport(
        key: MercuryKeys.handbookViewport,
        controller: handbookController,
        articles: handbookArticles,
      ),
      MainViewport(
        key: MercuryKeys.pharmaViewport,
        controller: pharmaController,
        articles: pharmaArticles,
      ),
    ];
  }

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
            length: store.state.newsArticles.length,
            initialIndex: store.state.newsIndex,
            callback: (i) => store.dispatch(SetNewsIndexAction(i)),
          );
          _handbookController = ExtendedTabController(
            key: MercuryKeys.handbookController,
            vsync: this,
            length: store.state.handbookArticles.length,
            initialIndex: store.state.handbookIndex,
            callback: (i) => store.dispatch(SetHandbookIndexAction(i)),
          );
          _pharmaController = ExtendedTabController(
            key: MercuryKeys.pharmaController,
            vsync: this,
            length: store.state.pharmaArticles.length,
            initialIndex: store.state.pharmaIndex + 1,
            callback: (i) => store.dispatch(SetPharmaIndexAction(i)),
          );
          store.dispatch(SetInitialTabAction());
        },
        onWillChange: (vm) {},
        builder: (context, vm) => Scaffold(
              appBar: PrimaryTopBar(
                index: vm.activeIndex,
              ),
              body: _createViewports(
                newsController: _newsController,
                handbookController: _handbookController,
                pharmaController: _pharmaController,
                newsArticles: vm.newsArticles,
                handbookArticles: vm.handbookArticles,
                pharmaArticles: vm.pharmaArticles,
              )[vm.activeIndex],
              bottomNavigationBar: PrimaryBottomBar(
                currentIndex: vm.activeIndex,
                onTabSelected: vm.onTabSelected,
              ),
              drawer: [
                MainDrawer(
                  key: MercuryKeys.newsDrawer,
                  controller: _newsController,
                  articles: vm.newsArticles,
                ),
                MainDrawer(
                  key: MercuryKeys.handbookDrawer,
                  controller: _handbookController,
                  articles: vm.handbookArticles,
                ),
                MainDrawer(
                  key: MercuryKeys.pharmaDrawer,
                  controller: _pharmaController,
                  articles: vm.pharmaArticles,
                ),
              ][vm.activeIndex],
            ),
      );
}

class _ViewModel {
  final int activeIndex;
  final List<Article> newsArticles;
  final List<Article> handbookArticles;
  final List<Article> pharmaArticles;
  final Function(int) onTabSelected;

  _ViewModel({
    @required this.activeIndex,
    @required this.newsArticles,
    @required this.handbookArticles,
    @required this.pharmaArticles,
    @required this.onTabSelected,
  });

  static _ViewModel fromStore(Store<AppState> store) => _ViewModel(
        activeIndex: store.state.tabIndex,
        newsArticles: store.state.newsArticles,
        handbookArticles: store.state.handbookArticles,
        pharmaArticles: store.state.pharmaArticles,
        onTabSelected: (index) {
          store.dispatch(SetTabIndexAction(index));
        },
      );

  @override
  int get hashCode =>
      activeIndex.hashCode ^
      newsArticles.hashCode ^
      handbookArticles.hashCode ^
      pharmaArticles.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _ViewModel &&
          runtimeType == other.runtimeType &&
          newsArticles == other.newsArticles &&
          handbookArticles == other.handbookArticles &&
          pharmaArticles == other.pharmaArticles &&
          activeIndex == other.activeIndex;
}
