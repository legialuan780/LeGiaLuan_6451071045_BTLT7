import 'package:flutter/material.dart';
import '../views/task_list_view.dart';

class AppRoutes {
  static const String taskList = '/';

  static Map<String, WidgetBuilder> routes = {
    taskList: (context) => const TaskListView(),
  };
}