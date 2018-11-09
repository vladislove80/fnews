import 'package:flutter/material.dart';
import 'package:fnews/news.dart';
import 'package:fnews/repository/news_repository.dart';
import 'package:meta/meta.dart';
import 'package:scoped_model/scoped_model.dart';

class NewsListModel extends Model {
  final NewsRepository repository;

  List<News> _news = [];

  List<News> get news => _news.toList();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  NewsListModel({@required this.repository});

  static NewsListModel of(BuildContext context) =>
      ScopedModel.of<NewsListModel>(context);

  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);
    loadNews();
  }

  Future loadNews() {
    _isLoading = true;
    notifyListeners();

    return repository.loadNewsList().then((loadedNews) {
      _news = loadedNews.map(News.fromEntity).toList();

      for (var news in _news) {
        print(news.toString());
      }
      _isLoading = false;
      notifyListeners();
    }).catchError((err) {
      _isLoading = false;
      _news = [];
      notifyListeners();
    });
  }
}
