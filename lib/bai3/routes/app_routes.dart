import 'package:flutter/material.dart';
import '../views/update_user_view.dart';

class AppRoutes {
  static const String updateUser = '/';

  static Map<String, WidgetBuilder> routes = {
    updateUser: (context) => const UpdateUserView(),
  };
}