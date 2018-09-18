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
      return _loadAsset(n);
    }));
    
    List<Article> articles = new List<Article>();
    for (var i = 0; i < filenames.length; i++) {
      print(filenames[i]);
      articles.add(Article.fromContents(filenames[i], articlesContent[i]));
    }

    store.dispatch(SetHandbookArticlesAction(articles));
  } catch (e) {
    print(e);
  }
};
