import 'package:flutter/material.dart';

import '../constants.dart' as globals;

class HandbookViewport extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        child: Center(
          child: Text(
            globals.handbookViewportMessage,
            style: TextStyle(fontSize: globals.viewportMessageFontSize),
          ),
        ),
      );
}
