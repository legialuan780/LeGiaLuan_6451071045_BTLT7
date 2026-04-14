import '../models/user_model.dart';
import '../services/api_service.dart';

class UserRepository {
  final ApiService apiService;

  UserRepository({required this.apiService});

  Future<List<UserModel>> fetchUsers() async {
    final data = await apiService.getUsers();
    return data.map((e) => UserModel.fromJson(e)).toList();
  }
}