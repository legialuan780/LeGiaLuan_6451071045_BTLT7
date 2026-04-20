import '../data/models/product_model.dart';
import '../data/repository/product_repository.dart';
import '../data/services/api_service.dart';

class ProductController {
  final ProductRepository _repository = ProductRepository(
    apiService: ApiService(),
  );

  Future<List<ProductModel>> searchProducts(String keyword) async {
    return await _repository.searchProducts(keyword);
  }
}