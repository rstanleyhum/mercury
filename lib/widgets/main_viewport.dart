import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../models/app_state.dart';
import '../models/article.dart';

import 'article_view.dart';
import 'extended_tab_controller.dart';

class MainViewport extends StatefulWidget {
  final ExtendedTabController controller;

  MainViewport({
    Key key,
    this.controller,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainViewportState();
}

class _MainViewportState extends State<MainViewport>
    with TickerProviderStateMixin {
  ExtendedTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return TabBarView(
          children: vm.articleList
              .map((v) => ArticleView(
                    key: PageStorageKey<String>(v.key),
                    txt: v.mdcontent,
                  ))
              .toList(),
          controller: this._controller,
        );
      },
    );
  }
}

class _ViewModel {
  final List<Article> articleList;

  _ViewModel({
    @required this.articleList,
  });


  static _ViewModel fromStore(Store<AppState> store) => _ViewModel(
        articleList: store.state.articleList,
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
