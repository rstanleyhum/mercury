import '../models/article.dart';


class SetTabIndexAction {
  final int index;

  SetTabIndexAction(this.index);

  @override
  String toString() => 'SetTabIndexAction{index: $index}';
}

class SetNewsIndexAction {
  final int index;

  SetNewsIndexAction(this.index);

  @override
  String toString() => 'SetNewsIndexAction{index: $index}';
}

class SetHandbookIndexAction {
  final int index;

  SetHandbookIndexAction(this.index);

  @override
  String toString() => 'SetHandbookIndexAction{index: $index}';
}

class SetPharmaIndexAction {
  final int index;

  SetPharmaIndexAction(this.index);

  @override
  String toString() => 'SetPharmaIndexAction{index: $index}';
}

class SetInitialTabAction {

  SetInitialTabAction();

  @override
  String toString() => 'SetInitialTabAction{}}';
}

class SetNewsArticlesAction {
  final List<Article> list;

  SetNewsArticlesAction(this.list);

  @override
  String toString() => 'SetNewsArticlesAction{list.length: ${list.length}}';
}

class SetHandbookArticlesAction {
  final List<Article> list;

  SetHandbookArticlesAction(this.list);

  @override
  String toString() => 'SetHandbookArticlesAction{list.length: ${list.length}}';
}

class SetPharmaArticlesAction {
  final List<Article> list;

  SetPharmaArticlesAction(this.list);

  @override
  String toString() => 'SetPharmaArticlesAction{list.length: ${list.length}}';
}