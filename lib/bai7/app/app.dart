import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class MyApp7 extends StatelessWidget {
  const MyApp7({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pull To Refresh',
      initialRoute: AppRoutes.newsList,
      routes: AppRoutes.routes,
    );
  }
}