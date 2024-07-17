import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/core/presentation/view/routes.dart';

import '../../../features/view_users/presentation/bloc/view_single_user/view_single_user_bloc.dart';
import '../../../features/view_users/presentation/bloc/view_users_list/view_users_bloc.dart';
import '../../../features/view_users/presentation/view/user_details.dart';
import '../../../features/view_users/presentation/view/user_list_view.dart';

class Navigation {
  void pushNavigate(BuildContext context, String route, dynamic arguments) {
    Navigator.push(
        context,
        generateRoute(RouteSettings(name: route, arguments: arguments),
            context: context));
  }

  void pop(BuildContext context) {
    Navigator.pop(context);
  }

  Route<dynamic> generateRoute(RouteSettings settings,
      {BuildContext? context}) {
    switch (settings.name) {
      case ScreenRoutes.homePage:
        return MaterialPageRoute<dynamic>(
          settings: const RouteSettings(name: ScreenRoutes.homePage),
          builder: (BuildContext context) {
            return MultiBlocProvider(
              providers: [
                BlocProvider<ViewUsersBloc>(
                  create: (context) => ViewUsersBloc(),
                ),
                BlocProvider<ViewSingleUserBloc>(
                  create: (context) => ViewSingleUserBloc(),
                )
              ],
              child: const UserListView(),
            );
          },
        );
      case ScreenRoutes.userPage:
        return MaterialPageRoute<dynamic>(
          settings: const RouteSettings(name: ScreenRoutes.userPage),
          builder: (BuildContext context) {
            return BlocProvider<ViewSingleUserBloc>(
              create: (context) => ViewSingleUserBloc(),
              child: UserDetails(settings.arguments),
            );
          },
        );
    }
    return defaultPageRoute(settings);
  }

  MaterialPageRoute<dynamic> defaultPageRoute(RouteSettings settings) {
    return MaterialPageRoute<dynamic>(
      settings: const RouteSettings(name: ScreenRoutes.homePage),
      builder: (BuildContext context) {
        return BlocProvider(
          create: (context) => ViewUsersBloc(),
          child: const UserListView(),
        );
      },
    );
  }
}
