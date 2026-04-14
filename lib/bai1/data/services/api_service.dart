import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../utils/constants.dart';

class ApiService {
  Future<List<dynamic>> getUsers() async {
    final url = Uri.parse(
      'https://jsonplaceholder.typicode.com/users',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as List<dynamic>;
    } else {
      throw Exception('Không thể tải danh sách user');
    }
  }
}