import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class MyApp5 extends StatelessWidget {
  const MyApp5({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Delete Task App',
      initialRoute: AppRoutes.taskList,
      routes: AppRoutes.routes,
    );
  }
}