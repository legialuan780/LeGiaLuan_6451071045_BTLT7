import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class MyApp2 extends StatelessWidget {
  const MyApp2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product Detail App',
      initialRoute: AppRoutes.productDetail,
      routes: AppRoutes.routes,
    );
  }
}