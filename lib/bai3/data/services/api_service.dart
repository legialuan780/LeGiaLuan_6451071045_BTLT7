import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../utils/constants.dart';
import '../models/user_model.dart';

class ApiService {
  Future<Map<String, dynamic>> getUser() async {
    final response = await http.get(
      Uri.parse(AppConstants.userUrl),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Không thể tải thông tin user');
    }
  }

  Future<Map<String, dynamic>> updateUser(UserModel user) async {
    final response = await http.put(
      Uri.parse(AppConstants.userUrl),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Cập nhật user thất bại');
    }
  }
}