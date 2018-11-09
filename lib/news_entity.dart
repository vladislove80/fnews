class NewsEntity {
  final String title;
  final String link;
  final String pubdate;
  final String author;
  final String category;
  final String description;

  NewsEntity(this.title, this.link, this.pubdate, this.author, this.category, this.description);

  @override
  String toString() {
    return 'News{title: $title, link: $link, pubdate: $pubdate, author: $author, category: $category}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is NewsEntity &&
              runtimeType == other.runtimeType &&
              title == other.title &&
              link == other.link &&
              pubdate == other.pubdate &&
              author == other.author &&
              category == other.category &&
              description == other.description;

  @override
  int get hashCode =>
      title.hashCode ^
      link.hashCode ^
      pubdate.hashCode ^
      author.hashCode ^
      category.hashCode ^
      description.hashCode;
}