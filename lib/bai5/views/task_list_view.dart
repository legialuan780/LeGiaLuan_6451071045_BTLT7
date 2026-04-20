import 'package:flutter/material.dart';
import '../common/widget/task_item.dart';
import '../controllers/task_controller.dart';
import '../data/models/task_model.dart';

class TaskListView extends StatefulWidget {
  const TaskListView({super.key});

  @override
  State<TaskListView> createState() => _TaskListViewState();
}

class _TaskListViewState extends State<TaskListView> {
  final TaskController _controller = TaskController();

  bool _isLoading = true;
  List<TaskModel> _tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    try {
      final tasks = await _controller.getTasks();

      setState(() {
        _tasks = tasks.take(10).toList();
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Lỗi tải task: $e'),
        ),
      );
    }
  }

  Future<void> _deleteTask(TaskModel task) async {
    try {
      await _controller.deleteTask(task.id);

      setState(() {
        _tasks.removeWhere((item) => item.id == task.id);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Đã xóa task: ${task.title}'),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Lỗi xóa task: $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách Task'),
        centerTitle: true,
      ),
      body: _isLoading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : _tasks.isEmpty
          ? const Center(
        child: Text('Không còn task nào'),
      )
          : ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          final task = _tasks[index];

          return TaskItem(
            task: task,
            onDelete: () => _deleteTask(task),
          );
        },
      ),
    );
  }
}