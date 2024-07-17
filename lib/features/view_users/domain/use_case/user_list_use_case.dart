import '../../data/models/user_list_model.dart';
import '../../data/repository/user_repository.dart';

class UserListUseCase {
  Future<UsersListModel> call(String page) async {
    UsersListModel usersData = await UserRepository().getUsers(page);
    return usersData;
  }
}
