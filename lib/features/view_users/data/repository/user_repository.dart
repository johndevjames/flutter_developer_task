import 'package:sample/features/view_users/data/api/controller.dart';
import 'package:sample/features/view_users/data/models/user_model.dart';

import '../models/user_list_model.dart';

class UserRepository {
  Future<UsersListModel> getUsers(String page) async {
    final usersData = await ApiController().getUsers(page);
    return UsersListModel.fromJson(usersData!);
  }

  Future<UserModel> getUser(String userId) async {
    final userData = await ApiController().getUser(userId);
    return UserModel.fromJson(userData!);
  }
}
