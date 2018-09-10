import '../assets.dart' as assets;

import 'tab_viewport.dart';

class PharmaViewport extends TabViewport {
  PharmaViewport()
      : super(
          articleList: assets.pharmaList,
        );
}
