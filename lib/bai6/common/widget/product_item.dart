import 'package:flutter/material.dart';
import '../../data/models/product_model.dart';
import '../style/app_text_style.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;

  const ProductItem({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        leading: product.thumbnail.isNotEmpty
            ? Image.network(
          product.thumbnail,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        )
            : const Icon(Icons.image_not_supported),
        title: Text(
          product.title,
          style: AppTextStyle.title,
        ),
        subtitle: Text(
          product.description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyle.subtitle,
        ),
        trailing: Text(
          '\$${product.price}',
          style: AppTextStyle.price,
        ),
      ),
    );
  }
}