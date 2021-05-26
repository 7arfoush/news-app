import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/features/display_news/models/ArticleModel.dart';
import 'package:news_app/features/display_news/models/NewsModel.dart';

class NewsAPI {
  Future<NewsModel> fetchNews({required String query}) async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/everything?q=$query&sortBy=popularity&apiKey=e371856a211e49c1a38c92a276e2ae81'));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      Map<String, dynamic> articles = jsonDecode(response.body);
      return NewsModel.fromMap(articles);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load the news article');
    }
  }
}
