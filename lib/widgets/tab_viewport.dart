import 'package:flutter/material.dart';

import 'article_view.dart';

class TabViewport extends StatefulWidget {
  final List<String> articleList;
  final int startIndex;
  final Function(int) onChanging;

  TabViewport({
    this.articleList,
    this.startIndex,
    this.onChanging,
  }) : super();

  @override
  State<StatefulWidget> createState() => _TabViewportState(
        articleList: this.articleList,
        startIndex: this.startIndex,
        onChanging: this.onChanging,
      );
}

class _TabViewportState extends State<TabViewport>
    with SingleTickerProviderStateMixin {
  final List<String> articleList;
  final int startIndex;
  final Function(int) onChanging;

  TabController _tabController;
  
  _TabViewportState({
    this.articleList,
    this.startIndex,
    this.onChanging,
  }) : super();

  @override
  void initState() {
    super.initState();
    setState(() {
      _tabController = TabController(
        vsync: this,
        length: this.articleList.length,
        initialIndex: this.startIndex,
      );
      _tabController.addListener(() {
        this.onChanging(_tabController.index);
      });
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
