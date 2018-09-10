import 'package:flutter/material.dart';

import '../constants.dart' as globals;

class PrimaryTopBar extends AppBar {
  final int index;
  PrimaryTopBar({this.index})
      : super(
          title: [
            Text(globals.newsTabTitle),
            Text(globals.handbookTabTitle),
            Text(globals.pharmaTabTitle),
          ][index],
          centerTitle: true,
        );
}
