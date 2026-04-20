import '../models/product_model.dart';
import '../services/api_service.dart';

class ProductRepository {
  final ApiService apiService;

  ProductRepository({required this.apiService});

  Future<List<ProductModel>> searchProducts(String keyword) async {
    final data = await apiService.searchProducts(keyword);
    return data.map((e) => ProductModel.fromJson(e)).toList();
  }
}