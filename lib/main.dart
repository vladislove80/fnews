import 'package:flutter/material.dart';
import 'package:fnews/app.dart';
import 'package:fnews/repository/news_repository_impl.dart';

void main() {
  var newsRepo = const NewsRepositoryImpl();

  runApp(ScopeModelApp(
    repository: newsRepo,
  ));
}


