import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class MyApp3 extends StatelessWidget {
  const MyApp3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Update User Info',
      initialRoute: AppRoutes.updateUser,
      routes: AppRoutes.routes,
    );
  }
}