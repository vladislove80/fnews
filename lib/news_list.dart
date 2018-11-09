import 'package:flutter/material.dart';
import 'package:fnews/news_item.dart';
import 'package:fnews/repository/news_list_model.dart';
import 'package:scoped_model/scoped_model.dart';

class NewsList extends StatelessWidget {
  NewsList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<NewsListModel>(
      builder: (context, child, model) {
        return Container(
          child: model.isLoading ? _buildLoading : _buildList(model),
        );
      },
    );
  }

  Center get _buildLoading {
    return Center(
      child: new CircularProgressIndicator(),
    );
  }

  ListView _buildList(NewsListModel newsListModel) {
    final news = newsListModel.news;

    return ListView.builder(
        itemCount: news.length,
        itemBuilder: (BuildContext context, int index) {
          final newsItem = news[index];

          return NewsItem(
            newsItem: newsItem,
            onTap: () {
              //todo implement NewsDescriptionScreen
            },
          );
        });
  }
}
