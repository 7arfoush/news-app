import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/features/display_news/models/NewsModel.dart';
import 'package:news_app/notification_handler.dart';

class NewsAPI {
  Future<NewsModel> fetchNews({required String query}) async {
    final response = await http.get(
      Uri.parse(
        'https://newsapi.org/v2/everything?q=$query&sortBy=popularity&apiKey=e371856a211e49c1a38c92a276e2ae81',
      ),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> news = jsonDecode(response.body);
      NotificationHandler().sendNotification();
      return NewsModel.fromMap(news);
    } else {
      throw Exception('Failed to load the news article');
    }
  }
}
