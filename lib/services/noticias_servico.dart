import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sos_central/models/noticias_models.dart';

class NewsService {
  static const String _apiKey = '5059a525d72d7f551eaee4fbb2dfce22';
  static const String _baseUrl = 'https://gnews.io/api/v4';

  Future<List<Article>> fetchNews() async {
    final query = 'Porto Alegre OR "Rio Grande do Sul" OR RS';
    final response = await http.get(Uri.parse(
    '$_baseUrl/search?q=$query&lang=pt&country=br&apikey=$_apiKey'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List articles = data['articles'];
      return articles.map((json) => Article.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
}