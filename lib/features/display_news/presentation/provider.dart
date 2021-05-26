import 'package:flutter/material.dart';
import 'package:news_app/features/display_news/data/api.dart';

class DisplayNewsProvider extends ChangeNotifier {
  NewsAPI newsAPI;

  DisplayNewsProvider() {
    newsAPI = NewsAPI();
  }
}
