import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/view_single_user/view_single_user_bloc.dart';
import '../bloc/view_users_list/view_users_bloc.dart';

class UserDetails extends StatefulWidget {
  final dynamic userDetails;

  const UserDetails(this.userDetails, {Key? key}) : super(key: key);

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  late dynamic _userDetails;
  late ViewSingleUserBloc _singleUserBloc;

  @override
  void initState() {
    super.initState();
    _singleUserBloc = BlocProvider.of<ViewSingleUserBloc>(context)
      ..add(GetViewSingleUserEvent(widget.userDetails['userId'].toString()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: BlocBuilder<ViewSingleUserBloc, ViewSingleUserState>(
          builder: (context, state) {
            if (state is GetViewSingleUserState) {
              _userDetails = state.userModel.data;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(_userDetails.avatar),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '${_userDetails.firstName} ${_userDetails.lastName}',
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Email: ${_userDetails.email}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'User ID: ${_userDetails.id}',
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
