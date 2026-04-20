import 'package:flutter/material.dart';
import '../views/news_list_view.dart';

class AppRoutes {
  static const String newsList = '/';

  static Map<String, WidgetBuilder> routes = {
    newsList: (context) => const NewsListView(),
  };
}