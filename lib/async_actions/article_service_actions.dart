import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux/redux.dart';

import '../actions/actions.dart';
import '../models/app_state.dart';
import '../models/article.dart';

Future<String> _loadAsset(String filename) async {
  return await rootBundle.loadString(filename);
}

ThunkAction<AppState> loadArticles = (Store<AppState> store) async {
  try {
    var s = await _loadAsset("assets/sensitive/files.json");
    var json = jsonDecode(s);
    var filenames = (json['filenames'] as List).cast<String>().toList();
    var articlesContent = await Future.wait(filenames.map((n) {
      return _loadAsset("assets/sensitive/$n");
    }));
    
    Map<String, Article> articles = new Map<String, Article>();
    for (var i = 0; i < filenames.length; i++) {
      print(filenames[i]);
      articles[filenames[i]] = Article.fromContents(filenames[i], articlesContent[i]);
    }


    String indexID = "nicu_section.md";
    
    Article indexArticle = articles[indexID];
    Article parentArticle = articles[indexArticle.parent];

    List<Article> handbookArticles = parentArticle.related.map((s) {
      return articles[s];
    }).toList();
    int handbookIndex = parentArticle.related.indexOf(indexID);
    
    if (handbookIndex == -1) {
      throw AssertionError("$indexID not found in parent ${parentArticle.key}");
    }

    store.dispatch(SetAllArticlesAction(articles));
    store.dispatch(SetHandbookIDAction(indexID));
    store.dispatch(SetHandbookParentIDAction(indexArticle.parent));
    store.dispatch(SetHandbookIndexAction(handbookIndex));
    store.dispatch(SetHandbookArticlesAction(handbookArticles));

  } catch (e) {
    print(e);
  }
};
