import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class MyApp6 extends StatelessWidget {
  const MyApp6({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Search Product',
      initialRoute: AppRoutes.searchProduct,
      routes: AppRoutes.routes,
    );
  }
}