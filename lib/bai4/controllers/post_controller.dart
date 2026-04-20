import '../data/models/post_model.dart';
import '../data/repository/post_repository.dart';
import '../data/services/api_service.dart';

class PostController {
  final PostRepository _repository = PostRepository(
    apiService: ApiService(),
  );

  Future<PostModel> createPost(String title, String body) async {
    final post = PostModel(
      title: title,
      body: body,
      userId: 1,
    );

    return await _repository.createPost(post);
  }
}