import 'package:flutter/material.dart';
import '../common/widget/product_item.dart';
import '../controllers/product_controller.dart';
import '../data/models/product_model.dart';

class SearchProductView extends StatefulWidget {
  const SearchProductView({super.key});

  @override
  State<SearchProductView> createState() => _SearchProductViewState();
}

class _SearchProductViewState extends State<SearchProductView> {
  final TextEditingController _searchController = TextEditingController();
  final ProductController _controller = ProductController();

  bool _isLoading = false;
  List<ProductModel> _products = [];

  Future<void> _searchProducts() async {
    final keyword = _searchController.text.trim();

    if (keyword.isEmpty) {
      setState(() {
        _products = [];
      });
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final results = await _controller.searchProducts(keyword);

      setState(() {
        _products = results;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Lỗi tìm kiếm: $e'),
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tìm kiếm sản phẩm'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Nhập từ khóa, ví dụ: phone',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: _searchProducts,
                ),
              ),
              onSubmitted: (_) => _searchProducts(),
            ),
            const SizedBox(height: 12),
            if (_isLoading)
              const Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            else if (_products.isEmpty)
              const Expanded(
                child: Center(
                  child: Text('Không có dữ liệu'),
                ),
              )
            else
              Expanded(
                child: ListView.builder(
                  itemCount: _products.length,
                  itemBuilder: (context, index) {
                    return ProductItem(product: _products[index]);
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}