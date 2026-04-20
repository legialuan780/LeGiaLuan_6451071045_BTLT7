import 'package:flutter/material.dart';
import '../views/create_post_view.dart';

class AppRoutes {
  static const String createPost = '/';

  static Map<String, WidgetBuilder> routes = {
    createPost: (context) => const CreatePostView(),
  };
}