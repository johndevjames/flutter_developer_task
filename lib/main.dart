import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/presentation/view/navigation.dart';
import 'core/presentation/view/routes.dart';
import 'features/view_users/presentation/bloc/view_users_list/view_users_bloc.dart';
import 'features/view_users/presentation/view/user_list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<ViewUsersBloc>(
        create: (context) => ViewUsersBloc(),
        child: const UserListView(),
      ),
      initialRoute: ScreenRoutes.homePage,
      onGenerateRoute: Navigation().generateRoute,
    );
  }
}
