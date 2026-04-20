import '../data/models/user_model.dart';
import '../data/repository/user_repository.dart';
import '../data/services/api_service.dart';

class UserController {
  final UserRepository _repository = UserRepository(
    apiService: ApiService(),
  );

  Future<UserModel> getUser() async {
    return await _repository.fetchUser();
  }

  Future<UserModel> updateUser({
    required int id,
    required String name,
    required String email,
    required String phone,
  }) async {
    final user = UserModel(
      id: id,
      name: name,
      email: email,
      phone: phone,
    );

    return await _repository.updateUser(user);
  }
}