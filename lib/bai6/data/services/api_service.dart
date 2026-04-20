import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../utils/constants.dart';

class ApiService {
  Future<List<dynamic>> searchProducts(String keyword) async {
    final url = Uri.parse(
      '${AppConstants.searchProductUrl}?q=$keyword',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['products'] as List<dynamic>;
    } else {
      throw Exception('Tìm kiếm sản phẩm thất bại');
    }
  }
}