import 'package:meta/meta.dart';

@immutable
class AppState {
  final int tabIndex;
  final int newsIndex;
  final int handbookIndex;
  final int pharmaIndex;

  AppState({
    this.tabIndex = 0,
    this.newsIndex = 0,
    this.handbookIndex = 0,
    this.pharmaIndex = 0,
  });

  AppState copyWith({
    int tabIndex,
    int newsIndex,
    int handbookIndex,
    int pharmaIndex,
  }) {
    return AppState(
      tabIndex: tabIndex ?? this.tabIndex,
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
      tabIndex.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          pharmaIndex == other.pharmaIndex &&
          handbookIndex == other.handbookIndex &&
          newsIndex == other.newsIndex &&
          tabIndex == other.tabIndex;

  @override
  String toString() =>
      'AppState{tabIndex: $tabIndex, newsIndex: $newsIndex, handbookIndex: $handbookIndex, pharmaIndex: $pharmaIndex}';
}
