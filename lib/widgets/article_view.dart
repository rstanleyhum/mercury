import 'package:flutter/material.dart';

import '../models/article.dart';

class ArticleView extends StatelessWidget {
  final Article article;

  ArticleView({
    Key key,
    this.article
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        child: ListView(
          padding: const EdgeInsets.all(5.0),
          children: <Widget>[]
            ..add(Text("Title ${article.title}"))
            ..add(Text("Byline ${article.byline} (${article.date})"))
            ..add(Text(this.article.mdcontent))
            ..addAll(this.article.related.map((t) {
              return Text(t);
            })),
        ),
      );
}
