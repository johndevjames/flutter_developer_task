part of 'view_users_bloc.dart';

@immutable
abstract class ViewUsersEvent {}

class GetViewUsers extends ViewUsersEvent {
  final String pageNo;
  GetViewUsers(this.pageNo);
}
