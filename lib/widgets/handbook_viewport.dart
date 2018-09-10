import '../assets.dart' as assets;

import 'tab_viewport.dart';

class HandbookViewport extends TabViewport {
  HandbookViewport()
      : super(
          articleList: assets.handbookList,
          startIndex: 0,
          onChanging: (int index) {
            print("Handbook index: $index");
          },
        );
}
