import 'package:flutter/material.dart';

import 'news_tab.dart';
import 'handbook_tab.dart';
import 'pharma_tab.dart';

class PrimaryBottomBar extends StatelessWidget {
  final currentIndex;
  final Function(int) onTabSelected;

  PrimaryBottomBar({
    this.currentIndex,
    this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) => BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          NewsTab(),
          HandbookTab(),
          PharmaTab(),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: onTabSelected,
      );
}
