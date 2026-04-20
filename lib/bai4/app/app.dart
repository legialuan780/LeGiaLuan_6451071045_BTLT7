import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class PostApp extends StatelessWidget {
  const PostApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Create Post App',
      initialRoute: AppRoutes.createPost,
      routes: AppRoutes.routes,
    );
  }
}