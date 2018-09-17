import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../assets.dart' as assets;

import '../actions/actions.dart';
import '../models/app_state.dart';

import 'article_view.dart';

class HandbookViewport extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HandbookViewportState();
}

class _HandbookViewportState extends State<HandbookViewport>
    with TickerProviderStateMixin {
  TabController _tabController;

  @override
  Widget build(BuildContext context) => StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: _ViewModel.fromStore,
      onInit: (store) {
        this._tabController = TabController(
          vsync: this,
          length: assets.handbookList.length,
        );
        this._tabController.addListener(() {
          print("Handbook: onInit: Index: ${_tabController.index}");
        });
      },
      onInitialBuild: (vm) {
        print("Handbook: onInitialBuild!");
        this._tabController.addListener(() {
          vm.onChanging(_tabController.index);
        });
      },
      builder: (context, vm) {
        return TabBarView(
          children: vm.articleList.map((v) {
            return ArticleView(txt: v);
          }).toList(),
          controller: this._tabController,
        );
      });
}

class _ViewModel {
  final int activeIndex;
  final List<String> articleList;
  final Function(int) onChanging;

  _ViewModel({
    @required this.activeIndex,
    @required this.articleList,
    @required this.onChanging,
  });

  static _ViewModel fromStore(Store<AppState> store) => _ViewModel(
        activeIndex: store.state.handbookIndex,
        articleList: assets.handbookList,
        onChanging: (int index) {
          print("HandbookViewport ViewModel OnChanging: $index");
          store.dispatch(SetHandbookIndexAction(index));
        },
      );

  @override
  int get hashCode => activeIndex.hashCode ^ articleList.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _ViewModel &&
          runtimeType == other.runtimeType &&
          activeIndex == other.activeIndex &&
          articleList == other.articleList;
}
