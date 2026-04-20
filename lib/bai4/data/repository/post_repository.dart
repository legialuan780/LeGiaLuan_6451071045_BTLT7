import '../models/post_model.dart';
import '../services/api_service.dart';

class PostRepository {
  final ApiService apiService;

  PostRepository({required this.apiService});

  Future<PostModel> createPost(PostModel post) async {
    final data = await apiService.createPost(post);
    return PostModel.fromJson(data);
  }
}