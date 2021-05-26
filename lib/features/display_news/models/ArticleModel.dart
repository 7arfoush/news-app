class ArticleModel {
  late String title;
  late String description;
  late String url;
  late String imageUrl;
  late DateTime datePublished;

  ArticleModel.fromMap(Map<String, dynamic> snapshot) {
    this.title = snapshot['title'];
    this.description = snapshot['description'];
    this.url = snapshot['url'];
    this.imageUrl = snapshot['urlToImage'];
    this.datePublished = DateTime.parse(snapshot['publishedAt']);
  }
}
