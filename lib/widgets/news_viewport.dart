import 'package:flutter/material.dart';

import '../constants.dart' as globals;

class NewsViewport extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        child: Center(
          child: Text(globals.newsViewportMessage,
              style: TextStyle(fontSize: globals.viewportMessageFontSize)),
        ),
      );
}
