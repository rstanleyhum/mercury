class Article {
  String key;
  String mdcontent;

  Article({this.key, this.mdcontent});

  @override
  int get hashCode => key.hashCode ^ mdcontent.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Article &&
          runtimeType == other.runtimeType &&
          mdcontent == other.mdcontent &&
          key == other.key;

  @override
  String toString() => 'Article{key: $key}';
}
