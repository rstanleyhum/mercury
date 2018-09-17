import 'package:meta/meta.dart';

import 'article.dart';

@immutable
class AppState {
  final int tabIndex;
  
  final int initialIndex;
  final List<Article> articleList;

  final int newsIndex;
  final int handbookIndex;
  final int pharmaIndex;
  

  AppState({
    this.tabIndex = 0,
    this.initialIndex = 1,
    this.articleList = const [],
    this.newsIndex = 0,
    this.handbookIndex = 0,
    this.pharmaIndex = 0,
  });

  AppState copyWith({
    int tabIndex,
    int initialIndex,
    List<Article> articleList,
    int newsIndex,
    int handbookIndex,
    int pharmaIndex,
  }) {
    return AppState(
      tabIndex: tabIndex ?? this.tabIndex,
      initialIndex: initialIndex ?? this.initialIndex,
      articleList: articleList ?? this.articleList,
      newsIndex: newsIndex ?? this.newsIndex,
      handbookIndex: handbookIndex ?? this.handbookIndex,
      pharmaIndex: pharmaIndex ?? this.pharmaIndex,
    );
  }

  @override
  int get hashCode =>
      pharmaIndex.hashCode ^
      handbookIndex.hashCode ^
      newsIndex.hashCode ^
      articleList.hashCode ^
      initialIndex.hashCode ^
      tabIndex.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          pharmaIndex == other.pharmaIndex &&
          handbookIndex == other.handbookIndex &&
          newsIndex == other.newsIndex &&
          articleList == other.articleList &&
          initialIndex == other.initialIndex &&
          tabIndex == other.tabIndex;

  @override
  String toString() =>
      'AppState{tabIndex: $tabIndex, initialIndex: $initialIndex, articleList.length: ${articleList.length}, newsIndex: $newsIndex, handbookIndex: $handbookIndex, pharmaIndex: $pharmaIndex}';
}
