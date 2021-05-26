import 'package:news_app/features/display_news/models/ArticleModel.dart';

class NewsModel {
  late List<ArticleModel> articles;

  NewsModel.fromMap(Map<String, dynamic> snapshot) {
    articles = List<ArticleModel>.from(
        snapshot['articles'].map((e) => ArticleModel.fromMap(e)));
  }
}
