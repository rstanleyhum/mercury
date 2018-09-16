import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';

import '../constants.dart' as globals;

import '../widgets/primary_top_bar.dart';
import '../widgets/news_viewport.dart';
import '../widgets/handbook_viewport.dart';
import '../widgets/pharma_viewport.dart';
import '../widgets/primary_bottom_bar.dart';
import '../widgets/main_drawer.dart';

class BaseView extends StatefulWidget {
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  BaseView({
    this.analytics,
    this.observer,
  }) : super();

  @override
  State<StatefulWidget> createState() => _BaseViewState(
        analytics: analytics,
        observer: observer,
      );
}

class _BaseViewState extends State<BaseView> {
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  int _currentIndex;
  final List<Widget> children = [
    NewsViewport(),
    HandbookViewport(),
    PharmaViewport()
  ];

  _BaseViewState({
    this.analytics,
    this.observer,
  }) : super();

  @override
  void initState() {
    super.initState();
    setState(() {
      _currentIndex = globals.initialTabIndex;
      _sendCurrentScreen().catchError((e) {
        print("InitState: $e");
      });
    });
  }

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
      _sendCurrentScreen().catchError((e) {
        print(e);
      });
    });
  }

  Future<Null> _sendCurrentScreen() async {
    print("_sendCurrentScreen: $_currentIndex");
    await analytics.setCurrentScreen(
      screenName: "Index $_currentIndex",
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: PrimaryTopBar(
          index: _currentIndex,
        ),
        body: children[_currentIndex],
        bottomNavigationBar: PrimaryBottomBar(
          currentIndex: _currentIndex,
          onTabSelected: _onTabSelected,
        ),
        drawer: MainDrawer(),
      );
}
