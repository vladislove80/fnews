import 'package:fnews/news_entity.dart';

class News {
  final String title;
  final String author;
  final String date;
  final String imageLink;
  final String description;

  News(this.title, this.author, this.date, this.imageLink, this.description);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is News &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          author == other.author &&
          date == other.date &&
          imageLink == other.imageLink &&
          description == other.description;

  @override
  int get hashCode =>
      title.hashCode ^
      author.hashCode ^
      date.hashCode ^
      imageLink.hashCode ^
      description.hashCode;

  @override
  String toString() {
    return 'News{title: $title, author: $author, date: $date, imageLink: $imageLink, description: $description}';
  }

  static News fromEntity(NewsEntity entity) {
    //todo implement date format
    return News(
      entity.title,
      entity.author,
      entity.pubdate,
      _parseHtml(entity.description),
      _getNewsDescription(entity.description),
    );
  }

  static String _parseHtml(String html) {
    var imgLink = "";
    String imgTag =
        RegExp("<img[^>]*src=[\\\"']([^\\\"^']*)").firstMatch(html).group(0);
    imgLink = imgTag.substring(imgTag.indexOf("src") + 5, imgTag.length);
    return imgLink;
  }

  static String _getNewsDescription(String html) {
    return html.substring(html.indexOf("<p>") + 3, html.indexOf("</p>"));
  }
}
