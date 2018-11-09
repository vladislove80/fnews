import 'package:flutter/material.dart';
import 'package:fnews/news.dart';

class NewsItem extends StatelessWidget {
  final News newsItem;
  final GestureTapCallback onTap;

  NewsItem({@required this.newsItem, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Container(
        child: Column(
          children: <Widget>[
            Text(
              newsItem.title,
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
            Padding(
              padding: EdgeInsets.only(top: 24.0),
              child: Text(
                newsItem.author,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Text(
                newsItem.date,
              ),
            ),
          ],
        ),
      ),
      subtitle: Container(
        child: Column(
          children: <Widget>[
            Image.network(
              newsItem.imageLink,
              fit: BoxFit.fitWidth,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                newsItem.description,
                textAlign: TextAlign.justify,
              ),
            );
          ],
        ),
      ),
    );
  }
}

