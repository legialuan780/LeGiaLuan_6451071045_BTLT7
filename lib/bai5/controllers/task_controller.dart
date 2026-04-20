import '../data/models/task_model.dart';
import '../data/repository/task_repository.dart';
import '../data/services/api_service.dart';

class TaskController {
  final TaskRepository _repository = TaskRepository(
    apiService: ApiService(),
  );

  Future<List<TaskModel>> getTasks() async {
    return await _repository.fetchTasks();
  }

  Future<void> deleteTask(int id) async {
    await _repository.deleteTask(id);
  }
}