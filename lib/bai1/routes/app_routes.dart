import 'package:flutter/material.dart';
import '../views/user_list_view.dart';

class AppRoutes {
  static const String userList = '/';

  static Map<String, WidgetBuilder> routes = {
    userList: (context) => const UserListView(),
  };
}