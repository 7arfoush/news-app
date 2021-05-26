import 'package:flutter/material.dart';
import 'package:news_app/features/display_news/data/api.dart';
import 'package:news_app/features/display_news/models/NewsModel.dart';

class DisplayNewsProvider extends ChangeNotifier {
  NewsAPI newsAPI = NewsAPI();

  DisplayNewsProvider();

  Future<NewsModel> getNews() async {
    return newsAPI.fetchNews(query: 'Apple');
  }
}
