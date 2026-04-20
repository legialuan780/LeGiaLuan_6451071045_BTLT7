import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../utils/constants.dart';

class ApiService {
  Future<List<dynamic>> getTasks() async {
    final response = await http.get(
      Uri.parse(AppConstants.taskUrl),
    );

    print('GET status: ${response.statusCode}');
    print('GET body: ${response.body.substring(0, 100)}');

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as List<dynamic>;
    } else {
      throw Exception('Không thể tải danh sách task');
    }
  }

  Future<void> deleteTask(int id) async {
    final response = await http.delete(
      Uri.parse('${AppConstants.taskUrl}/$id'),
    );

    print('DELETE status: ${response.statusCode}');

    if (response.statusCode != 200) {
      throw Exception('Xóa task thất bại');
    }
  }
}