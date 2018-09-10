import 'package:flutter/material.dart';

import '../constants.dart' as globals;

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Center(
                child: Text(
                  globals.mainDrawerHeaderTitle,
                  style: TextStyle(fontSize: globals.mainDrawerHeaderFontSize),
                ),
              ),
              decoration: BoxDecoration(
                color: globals.themeColor,
              ),
            ),
            ListTile(
              title: Text(globals.drawerItemOne),
            ),
            ListTile(
              title: Text(globals.drawerItemTwo),
            ),
          ],
        ),
      );
}
