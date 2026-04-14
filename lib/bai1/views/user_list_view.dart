import 'package:flutter/material.dart';
import '../common/widget/user_tile.dart';
import '../controllers/user_controller.dart';
import '../data/models/user_model.dart';

class UserListView extends StatelessWidget {
  const UserListView({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController controller = UserController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách User 6451071045'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<UserModel>>(
        future: controller.getUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Lỗi: ${snapshot.error}'),
            );
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('Không có dữ liệu'),
            );
          }

          final users = snapshot.data!;

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              return UserTile(user: users[index]);
            },
          );
        },
      ),
    );
  }
}