import '../models/product_model.dart';
import '../services/api_service.dart';

class ProductRepository {
  final ApiService apiService;

  ProductRepository({required this.apiService});

  Future<ProductModel> fetchProductDetail() async {
    final data = await apiService.getProductDetail();
    return ProductModel.fromJson(data);
  }
}