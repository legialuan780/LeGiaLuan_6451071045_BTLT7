import '../models/user_model.dart';
import '../services/api_service.dart';

class UserRepository {
  final ApiService apiService;

  UserRepository({required this.apiService});

  Future<UserModel> fetchUser() async {
    final data = await apiService.getUser();
    return UserModel.fromJson(data);
  }

  Future<UserModel> updateUser(UserModel user) async {
    final data = await apiService.updateUser(user);
    return UserModel.fromJson(data);
  }
}