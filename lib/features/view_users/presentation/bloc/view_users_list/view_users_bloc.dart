import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/user_list_model.dart';
import '../../../domain/use_case/user_list_use_case.dart';

part 'view_users_event.dart';
part 'view_users_state.dart';

class ViewUsersBloc extends Bloc<ViewUsersEvent, ViewUsersState> {
  ViewUsersBloc() : super(ViewUsersInitial()) {
    on<ViewUsersEvent>((event, emit) async {
      if (event is GetViewUsers) {
        UsersListModel? usersList = await UserListUseCase().call(event.pageNo);
        emit(GetUsersState(usersList));
      }
    });
  }
}
