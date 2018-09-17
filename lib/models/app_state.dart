import 'package:meta/meta.dart';

import 'article.dart';

@immutable
class AppState {
  final int tabIndex;
  
  final int initialIndex;
  final List<Article> newsArticles;
  final List<Article> handbookArticles;
  final List<Article> pharmaArticles;

  final int newsIndex;
  final int handbookIndex;
  final int pharmaIndex;
  

  AppState({
    this.tabIndex = 0,
    this.initialIndex = 1,
    this.newsArticles = const [],
    this.handbookArticles = const[],
    this.pharmaArticles = const[],
    this.newsIndex = 0,
    this.handbookIndex = 0,
    this.pharmaIndex = 0,
  });

  AppState copyWith({
    int tabIndex,
    int initialIndex,
    List<Article> newsArticles,
    List<Article> handbookArticles,
    List<Article> pharmaArticles,
    int newsIndex,
    int handbookIndex,
    int pharmaIndex,
  }) {
    return AppState(
      tabIndex: tabIndex ?? this.tabIndex,
      initialIndex: initialIndex ?? this.initialIndex,
      newsArticles: newsArticles ?? this.newsArticles,
      handbookArticles: handbookArticles ?? this.handbookArticles,
      pharmaArticles: pharmaArticles ?? this.pharmaArticles,
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
      newsArticles.hashCode ^
      handbookArticles.hashCode ^
      pharmaArticles.hashCode ^
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
          newsArticles == other.newsArticles &&
          handbookArticles == other.handbookArticles &&
          pharmaArticles == other.pharmaArticles &&
          initialIndex == other.initialIndex &&
          tabIndex == other.tabIndex;

  @override
  String toString() =>
      'AppState{tabIndex: $tabIndex, initialIndex: $initialIndex, articles: ${newsArticles.length}, ${handbookArticles.length}, ${pharmaArticles.length}, newsIndex: $newsIndex, handbookIndex: $handbookIndex, pharmaIndex: $pharmaIndex}';
}
