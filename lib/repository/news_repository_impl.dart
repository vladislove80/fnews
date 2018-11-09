import 'package:fnews/web_client.dart';
import 'package:fnews/news_entity.dart';
import 'package:fnews/repository/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  final WebClient webClient;

  const NewsRepositoryImpl({
    this.webClient = const WebClient(),
  });

  @override
  Future<List<NewsEntity>> loadNewsList() async {
    final news = await webClient.fetchNewsList();
//  todo implement fileStorage.saveNews()
    return news;
  }

  @override
  Future saveNews() {
    // TODO: implement saveNews
  }

}