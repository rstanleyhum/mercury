import 'package:meta/meta.dart';

import 'article.dart';

@immutable
class AppState {
  final int tabIndex;
  
  final int initialIndex;
  final List<Article> newsArticles;
  final List<Article> handbookArticles;
  final List<Article> pharmaArticles;
  
  final Map<String, Article> allArticles;

  final int newsIndex;
  final int handbookIndex;
  final int pharmaIndex;
  
  final String handbookID;
  final String handbookParentID;

  final bool isAppLoading;

  AppState({
    this.tabIndex = 0,
    this.initialIndex = 1,
    this.newsArticles = const [],
    this.handbookArticles = const[],
    this.pharmaArticles = const[],
    this.allArticles = const{},
    this.newsIndex = 0,
    this.handbookIndex = 0,
    this.pharmaIndex = 0,
    this.handbookID = "",
    this.handbookParentID = "",
    this.isAppLoading = true,
  });

  AppState copyWith({
    int tabIndex,
    int initialIndex,
    List<Article> newsArticles,
    List<Article> handbookArticles,
    List<Article> pharmaArticles,
    Map<String, Article> allArticles,
    int newsIndex,
    int handbookIndex,
    int pharmaIndex,
    String handbookID,
    String handbookParentID,
    bool isAppLoading,
  }) {
    return AppState(
      tabIndex: tabIndex ?? this.tabIndex,
      initialIndex: initialIndex ?? this.initialIndex,
      newsArticles: newsArticles ?? this.newsArticles,
      handbookArticles: handbookArticles ?? this.handbookArticles,
      pharmaArticles: pharmaArticles ?? this.pharmaArticles,
      allArticles: allArticles ?? this.allArticles,
      newsIndex: newsIndex ?? this.newsIndex,
      handbookIndex: handbookIndex ?? this.handbookIndex,
      pharmaIndex: pharmaIndex ?? this.pharmaIndex,
      handbookID: handbookID ?? this.handbookID,
      handbookParentID: handbookParentID ?? this.handbookParentID,
      isAppLoading: isAppLoading ?? this.isAppLoading,
    );
  }

  @override
  int get hashCode =>
      handbookID.hashCode ^
      handbookParentID.hashCode ^
      pharmaIndex.hashCode ^
      handbookIndex.hashCode ^
      newsIndex.hashCode ^
      newsArticles.hashCode ^
      handbookArticles.hashCode ^
      pharmaArticles.hashCode ^
      allArticles.hashCode ^
      initialIndex.hashCode ^
      isAppLoading.hashCode ^
      tabIndex.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          handbookID == other.handbookID &&
          handbookParentID == other.handbookParentID &&
          pharmaIndex == other.pharmaIndex &&
          handbookIndex == other.handbookIndex &&
          newsIndex == other.newsIndex &&
          newsArticles == other.newsArticles &&
          handbookArticles == other.handbookArticles &&
          pharmaArticles == other.pharmaArticles &&
          allArticles == other.allArticles &&
          initialIndex == other.initialIndex &&
          isAppLoading == other.isAppLoading &&
          tabIndex == other.tabIndex;

  @override
  String toString() =>
      'AppState{$isAppLoading tabIndex: $tabIndex, initialIndex: $initialIndex, articles: ${newsArticles.length}, ${handbookArticles.length}, ${pharmaArticles.length}, ${allArticles.length}, newsIndex: $newsIndex, handbookIndex: $handbookIndex, pharmaIndex: $pharmaIndex, $handbookID, $handbookParentID}';
}
