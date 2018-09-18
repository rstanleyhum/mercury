import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../actions/actions.dart';
import 'package:redux/redux.dart';
import '../models/app_state.dart';

import '../constants.dart' as globals;

import '../async_actions/article_service_actions.dart';
import '../widgets/extended_tab_controller.dart';
import '../models/article.dart';

import '../assets.dart' as assets;

class MainDrawer extends StatefulWidget {
  final ExtendedTabController controller;
  final List<Article> articles;

  MainDrawer({
    Key key,
    @required this.controller,
    @required this.articles,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  ExtendedTabController _controller;
  List<Article> _articles;
  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
    _articles = widget.articles;
    print("${_articles.length}");
  }

  @override
  Widget build(BuildContext context) => StoreConnector<AppState, _ViewModel>(
        converter: _ViewModel.fromStore,
        builder: (context, vm) => Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[]
                  ..add(
                    DrawerHeader(
                      child: Center(
                        child: Text(
                          globals.mainDrawerHeaderTitle,
                          style: TextStyle(
                              fontSize: globals.mainDrawerHeaderFontSize),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: globals.themeColor,
                      ),
                    ),
                  )
                  ..add(
                    ListTile(
                        title: Text('ControllerIndex: ${_controller.index}')),
                  )
                  ..addAll(
                    _articles.map<Widget>((v) => ListTile(title: Text(v.key))),
                  )
                  ..addAll(
                    [
                      RaisedButton(
                          child: Text("Change newsArticles"),
                          onPressed: vm.changeNews),
                      RaisedButton(
                        child: Text("Change handbookArticles"),
                        onPressed: vm.changeHandbook,
                      ),
                      RaisedButton(
                        child: Text("Change PharmaArticles"),
                        onPressed: vm.changePharma,
                      ),
                    ],
                  ),
              ),
            ),
      );
}

class _ViewModel {
  final VoidCallback changeNews;
  final VoidCallback changeHandbook;
  final VoidCallback changePharma;

  _ViewModel({
    @required this.changeNews,
    @required this.changeHandbook,
    @required this.changePharma,
  });

  static _ViewModel fromStore(Store<AppState> store) => _ViewModel(
        changeNews: () {
          store.dispatch(loadArticles);
        },
        changeHandbook: () {
          store.dispatch(SetHandbookIndexAction(0));
          store.dispatch(SetHandbookArticlesAction(assets.handbook2List));
        },
        changePharma: () {
          store.dispatch(SetPharmaIndexAction(0));
          store.dispatch(SetPharmaArticlesAction(assets.pharma2List));
        },
      );
}
