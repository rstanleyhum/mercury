import 'package:flutter/material.dart';

class ArticleView extends StatelessWidget {
  final String txt;

  ArticleView({
    Key key,
    this.txt
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        child: Center(
          child: Text(this.txt),
        ),
      );
}
