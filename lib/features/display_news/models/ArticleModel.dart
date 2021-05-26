class ArticleModel {
  String title;
  String description;
  String url;
  DateTime datePublished;

  ArticleModel.fromMap(Map<String, dynamic> snapshot) {
    this.title = snapshot['title'];
    this.description = snapshot['description'];
    this.url = snapshot['url'];
    this.datePublished = snapshot['date_published'].toDate();
  }
}
