import '../data/models/news_model.dart';
import '../data/repository/news_repository.dart';
import '../data/services/api_service.dart';

class NewsController {
  final NewsRepository _repository = NewsRepository(
    apiService: ApiService(),
  );

  Future<List<NewsModel>> getNews() async {
    return await _repository.fetchNews();
  }
}