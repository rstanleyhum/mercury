import 'package:flutter/material.dart';

import '../models/article.dart';

import 'article_view.dart';
import 'extended_tab_controller.dart';

class MainViewport extends StatefulWidget {
  final ExtendedTabController controller;
  final List<Article> articles;

  MainViewport({
    Key key,
    this.controller,
    this.articles,
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
    return TabBarView(
      key: Key("TabBarView - ${widget.key}"),
      children: widget.articles
          .map((v) => ArticleView(
                key: PageStorageKey<String>(v.key),
                article: v,
              ))
          .toList(),
      controller: this._controller,
    );
  }
}
