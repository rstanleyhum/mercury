import 'package:flutter/material.dart';

class ExtendedTabController extends TabController {
  final int initialIndex;
  final int length;
  final TickerProvider vsync;
  final Function(int) callback;

  ExtendedTabController({
    Key key,
    @required this.initialIndex,
    @required this.length,
    @required this.vsync,
    @required this.callback,
  }) : super(vsync: vsync, length: length, initialIndex: initialIndex) {
    this.addListener(() {
      this.callback(this.index);
    });
  }
}
