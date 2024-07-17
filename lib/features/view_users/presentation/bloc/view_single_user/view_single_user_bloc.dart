import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/user_model.dart';
import '../../../domain/use_case/user_use_case.dart';

part 'view_single_user_event.dart';
part 'view_single_user_state.dart';

class ViewSingleUserBloc
    extends Bloc<ViewSingleUserEvent, ViewSingleUserState> {
  ViewSingleUserBloc() : super(ViewSingleUserInitial()) {
    on<ViewSingleUserEvent>((event, emit) async {
      if (event is GetViewSingleUserEvent) {
        UserModel userModel = await UserUseCase().call(event.userId);
        emit(GetViewSingleUserState(userModel));
      }
    });
  }
}
