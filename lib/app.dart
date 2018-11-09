import 'package:flutter/material.dart';
import 'package:fnews/repository/news_repository.dart';
import 'package:fnews/screens/news_list_screen.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:fnews/repository/news_list_model.dart';

class ScopeModelApp extends StatelessWidget {
  final NewsRepository repository;

  ScopeModelApp({@required this.repository});

  @override
  Widget build(BuildContext context) {
    var app = MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      /*home: new HomePage(title: 'Flutter Demo Home Page'),*/
      routes: {
        "/" : (context) => HomePage(title: 'CBC news',),
      },
      debugShowCheckedModeBanner: false,
    );

    return ScopedModel<NewsListModel>(
      model: NewsListModel(
        repository: repository,
      ),
      child: app,
    );
  }
}