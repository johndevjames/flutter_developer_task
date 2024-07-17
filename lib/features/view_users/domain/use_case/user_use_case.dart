import '../../data/models/user_model.dart';
import '../../data/repository/user_repository.dart';

class UserUseCase {
  Future<UserModel> call(String userId) async {
    UserModel usersData = await UserRepository().getUser(userId);
    return usersData;
  }
}
