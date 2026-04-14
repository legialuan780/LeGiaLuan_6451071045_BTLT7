import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../utils/constants.dart';

class ApiService {
  Future<Map<String, dynamic>> getProductDetail() async {
    final url = Uri.parse(
      'https://fakestoreapi.com/products/2',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Không thể tải chi tiết sản phẩm');
    }
  }
}