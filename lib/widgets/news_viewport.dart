import '../assets.dart' as assets;

import 'tab_viewport.dart';

class NewsViewport extends TabViewport {
  NewsViewport()
      : super(
          articleList: assets.newsList,
        );
}
