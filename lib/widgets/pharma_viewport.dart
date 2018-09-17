import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../assets.dart' as assets;

import '../actions/actions.dart';
import '../models/app_state.dart';

import 'article_view.dart';

class PharmaViewport extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PharmaViewportState();
}

class _PharmaViewportState extends State<PharmaViewport>
    with TickerProviderStateMixin {
  TabController _tabController;

  @override
  Widget build(BuildContext context) => StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: _ViewModel.fromStore,
      onInit: (store) {
        this._tabController = TabController(
          vsync: this,
          length: assets.pharmaList.length,
          initialIndex: store.state.pharmaIndex,
        );
        this._tabController.addListener(() {
          store.dispatch(SetPharmaIndexAction(_tabController.index));
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
  final List<String> articleList;

  _ViewModel({
    @required this.articleList,
  });

  static _ViewModel fromStore(Store<AppState> store) => _ViewModel(
        articleList: assets.pharmaList,
      );

  @override
  int get hashCode => articleList.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _ViewModel &&
          runtimeType == other.runtimeType &&
          articleList == other.articleList;
}
