import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../utils/constants.dart';
import '../models/post_model.dart';

class ApiService {
  Future<Map<String, dynamic>> createPost(PostModel post) async {
    final response = await http.post(
      Uri.parse(AppConstants.createPostUrl),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(post.toJson()),
    );

    if (response.statusCode == 201) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Tạo bài viết thất bại');
    }
  }
}