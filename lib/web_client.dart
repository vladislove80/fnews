import 'package:fnews/news_entity.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;

class WebClient {

  const WebClient();

  Future<String> _fetchNews() async {
    final response = await http.get('https://www.cbc.ca/cmlink/rss-technology');
    return response.body;
  }

  Future<List<NewsEntity>> _getNewsList(String response) async {
    var xmlDocument = xml.parse(response);
    var findElements = xmlDocument
        .findElements('rss')
        .elementAt(0)
        .findElements('channel')
        .elementAt(0)
        .findElements('item');
    var map = findElements.map((item) => _mapNews(item));
    return map.toList();
  }

  NewsEntity _mapNews(xml.XmlElement item) {
    return NewsEntity(
        _getText('title', item),
        _getText('link', item),
        _getText('pubDate', item),
        _getText('author', item),
        _getText('category', item),
        _getText('description', item));
  }

  String _getText(String key, xml.XmlElement item) => item.findElements(key).single.text;

  Future<List<NewsEntity>> fetchNewsList() {
    return _fetchNews().then((response) =>_getNewsList(response));
  }
}