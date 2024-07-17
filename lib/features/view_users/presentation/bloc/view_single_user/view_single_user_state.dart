part of 'view_single_user_bloc.dart';

@immutable
abstract class ViewSingleUserState {}

class ViewSingleUserInitial extends ViewSingleUserState {}

class GetViewSingleUserState extends ViewSingleUserState {
  final UserModel userModel;
  GetViewSingleUserState(this.userModel);
}
