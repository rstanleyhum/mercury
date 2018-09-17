import 'package:flutter/material.dart';

import '../constants.dart' as globals;

import '../widgets/extended_tab_controller.dart';
import '../models/article.dart';

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
  Widget build(BuildContext context) => Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[]
            ..add(
              DrawerHeader(
                child: Center(
                  child: Text(
                    globals.mainDrawerHeaderTitle,
                    style:
                        TextStyle(fontSize: globals.mainDrawerHeaderFontSize),
                  ),
                ),
                decoration: BoxDecoration(
                  color: globals.themeColor,
                ),
              ),
            )
            ..add(
              ListTile(title: Text('ControllerIndex: ${_controller.index}')),
            )
            ..addAll(
                _articles.map<Widget>((v) => ListTile(title: Text(v.key)))),
        ),
      );
}
