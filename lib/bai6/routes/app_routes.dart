import 'package:flutter/material.dart';
import '../views/search_product_view.dart';

class AppRoutes {
  static const String searchProduct = '/';

  static Map<String, WidgetBuilder> routes = {
    searchProduct: (context) => const SearchProductView(),
  };
}