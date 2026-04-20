import '../models/task_model.dart';
import '../services/api_service.dart';

class TaskRepository {
  final ApiService apiService;

  TaskRepository({required this.apiService});

  Future<List<TaskModel>> fetchTasks() async {
    final data = await apiService.getTasks();
    return data.map((e) => TaskModel.fromJson(e)).toList();
  }

  Future<void> deleteTask(int id) async {
    await apiService.deleteTask(id);
  }
}