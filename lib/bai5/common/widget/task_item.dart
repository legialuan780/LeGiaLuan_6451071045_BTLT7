import 'package:flutter/material.dart';
import '../../data/models/task_model.dart';
import '../style/app_text_style.dart';

class TaskItem extends StatelessWidget {
  final TaskModel task;
  final VoidCallback onDelete;

  const TaskItem({
    super.key,
    required this.task,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        leading: Icon(
          task.completed ? Icons.check_circle : Icons.radio_button_unchecked,
          color: task.completed ? Colors.green : Colors.grey,
        ),
        title: Text(
          task.title,
          style: AppTextStyle.title,
        ),
        subtitle: Text(
          task.completed ? 'Đã hoàn thành' : 'Chưa hoàn thành',
          style: AppTextStyle.subtitle,
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: onDelete,
        ),
      ),
    );
  }
}