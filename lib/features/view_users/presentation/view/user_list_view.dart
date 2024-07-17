import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/core/presentation/view/navigation.dart';

import '../../../../core/presentation/view/routes.dart';
import '../../data/models/user_list_model.dart';
import '../bloc/view_single_user/view_single_user_bloc.dart';
import '../bloc/view_users_list/view_users_bloc.dart';
import '../widgets/list_item.dart';

class UserListView extends StatefulWidget {
  const UserListView({Key? key}) : super(key: key);

  @override
  State<UserListView> createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  final ScrollController _scrollController = ScrollController();
  late ViewUsersBloc _viewUsersBloc;
  late ViewSingleUserBloc _singleUserBloc;

  int _initialPageNo = 1;
  List<Data> _data = [];
  @override
  void initState() {
    super.initState();
    _viewUsersBloc = BlocProvider.of<ViewUsersBloc>(context)
      ..add(GetViewUsers(_initialPageNo.toString()));
    _singleUserBloc = BlocProvider.of<ViewSingleUserBloc>(context);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _initialPageNo++;
        _viewUsersBloc.add(GetViewUsers(_initialPageNo.toString()));
      }
    });
  }

  @override
  void dispose() {
    _viewUsersBloc.close();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: 500,
        child: Center(
          child: BlocBuilder<ViewUsersBloc, ViewUsersState>(
            bloc: _viewUsersBloc,
            builder: (context, state) {
              if (state is GetUsersState) {
                UsersListModel usersListModel = state.usersListModel;
                late List<Data> listItems;
                if (_data.isEmpty) {
                  _data = usersListModel.data!;
                  listItems = _data;
                } else {
                  for (var data in usersListModel.data!) {
                    _data.add(data);
                  }
                  listItems = _data;
                }

                return ListView.builder(
                  controller: _scrollController,
                  itemCount: listItems.length,
                  itemBuilder: (context, index) {
                    return ListItem(listItems[index], onTap);
                  },
                );
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

  void onTap(int userId) {
    // _singleUserBloc.add(GetViewSingleUserEvent(userId.toString()));
    Navigation()
        .pushNavigate(context, ScreenRoutes.userPage, {'userId': userId});
  }
}
