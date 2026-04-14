import 'package:flutter/material.dart';
import '../../data/models/user_model.dart';
import '../style/app_text_style.dart';

class UserTile extends StatelessWidget {
  final UserModel user;

  const UserTile({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(user.name.isNotEmpty ? user.name[0] : '?'),
        ),
        title: Text(
          user.name,
          style: AppTextStyle.title,
        ),
        subtitle: Text(
          user.email,
          style: AppTextStyle.subtitle,
        ),
      ),
    );
  }
}