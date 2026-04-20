import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../utils/constants.dart';

class ApiService {
  Future<List<dynamic>> getNews() async {
    final response = await http.get(
      Uri.parse(AppConstants.newsUrl),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as List<dynamic>;
    } else {
      throw Exception('Không thể tải danh sách tin tức');
    }
  }
}