import 'package:flutter/material.dart';

import 'article_view.dart';

class TabViewport extends StatefulWidget {
  final List<String> articleList;

  TabViewport({this.articleList}) : super();

  @override
  State<StatefulWidget> createState() => _TabViewportState(
        articleList: this.articleList,
      );
}

class _TabViewportState extends State<TabViewport>
    with SingleTickerProviderStateMixin {
  final List<String> articleList;
  TabController _tabController;

  _TabViewportState({
    this.articleList,
  }) : super();

  @override
  void initState() {
    super.initState();
    setState(() {
      _tabController =
          TabController(vsync: this, length: this.articleList.length);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => TabBarView(
        children: this.articleList.map((v) {
          return ArticleView(txt: v);
        }).toList(),
        controller: this._tabController,
      );
}
