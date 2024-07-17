part of 'view_users_bloc.dart';

@immutable
abstract class ViewUsersState {}

class ViewUsersInitial extends ViewUsersState {}

class GetUsersState extends ViewUsersState {
  final UsersListModel usersListModel;
  GetUsersState(this.usersListModel);
}
