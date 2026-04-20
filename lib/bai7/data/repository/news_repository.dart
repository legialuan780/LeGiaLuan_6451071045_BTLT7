import '../models/news_model.dart';
import '../services/api_service.dart';

class NewsRepository {
  final ApiService apiService;

  NewsRepository({required this.apiService});

  Future<List<NewsModel>> fetchNews() async {
    final data = await apiService.getNews();
    return data.map((e) => NewsModel.fromJson(e)).toList();
  }
}