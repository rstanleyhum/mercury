import 'package:flutter/material.dart';

import '../constants.dart' as globals;

class PharmaViewport extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        child: Center(
          child: Text(
            globals.pharmaViewportMessage,
            style: TextStyle(fontSize: globals.viewportMessageFontSize),
          ),
        ),
      );
}
