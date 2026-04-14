import 'package:flutter/material.dart';
import '../common/style/app_text_style.dart';
import '../common/widget/info_row.dart';
import '../controllers/product_controller.dart';
import '../data/models/product_model.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController controller = ProductController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chi tiết sản phẩm 6451071045'),
        centerTitle: true,
      ),
      body: FutureBuilder<ProductModel>(
        future: controller.getProductDetail(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Lỗi: ${snapshot.error}'),
            );
          }

          if (!snapshot.hasData) {
            return const Center(
              child: Text('Không có dữ liệu sản phẩm'),
            );
          }

          final product = snapshot.data!;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: AppTextStyle.title,
                ),
                const SizedBox(height: 20),
                InfoRow(
                  label: 'Giá',
                  value: '\$${product.price}',
                ),
                const SizedBox(height: 8),
                Text(
                  'Mô tả:',
                  style: AppTextStyle.label,
                ),
                const SizedBox(height: 8),
                Text(
                  product.description,
                  style: AppTextStyle.description,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}