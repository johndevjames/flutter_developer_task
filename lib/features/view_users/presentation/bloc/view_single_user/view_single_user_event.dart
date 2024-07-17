part of 'view_single_user_bloc.dart';

@immutable
abstract class ViewSingleUserEvent {}

class GetViewSingleUserEvent extends ViewSingleUserEvent {
  final String userId;
  GetViewSingleUserEvent(this.userId);
}
