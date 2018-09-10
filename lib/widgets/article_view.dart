import 'package:flutter/material.dart';

class ArticleView extends StatelessWidget {
  final String txt;

  ArticleView({this.txt}) : super();

  @override
  Widget build(BuildContext context) => Container(
        child: Center(
          child: Text(this.txt),
        ),
      );
}
