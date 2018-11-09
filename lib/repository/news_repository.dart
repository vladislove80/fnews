import 'dart:async';
import 'dart:core';
import 'package:fnews/news_entity.dart';

/// A class that Loads and Persists news. The data layer of the app.
///
abstract class NewsRepository {
  /// Loads news first from File storage. If they don't exist or encounter an
  /// error, it attempts to load news from a Web Client.
  Future<List<NewsEntity>> loadNewsList();

  Future saveNews();
}