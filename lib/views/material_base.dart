import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';

import '../constants.dart' as globals;

import 'base_view.dart';

class MaterialBase extends StatelessWidget {
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(
    analytics: analytics,
  );

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: globals.materialAppTitle,
        theme: ThemeData(
          primarySwatch: globals.themeColor,
        ),
        navigatorObservers: <NavigatorObserver>[observer],
        home: BaseView(
          analytics: analytics,
          observer: observer,
        ),
      );
}
