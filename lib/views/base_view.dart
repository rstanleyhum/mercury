import 'package:flutter/material.dart';

import '../constants.dart' as globals;

import '../widgets/primary_top_bar.dart';
import '../widgets/news_viewport.dart';
import '../widgets/handbook_viewport.dart';
import '../widgets/pharma_viewport.dart';
import '../widgets/primary_bottom_bar.dart';
import '../widgets/main_drawer.dart';

class BaseView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  int _currentIndex;
  final List<Widget> children = [
    NewsViewport(),
    HandbookViewport(),
    PharmaViewport()
  ];

  @override
  void initState() {
    super.initState();
    setState(() {
      _currentIndex = globals.initialTabIndex;
    });
  }

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
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
