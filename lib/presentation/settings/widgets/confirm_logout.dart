import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/application/settings/settings_bloc.dart';
import 'package:movie_app/domain/core/my_app_router/my_app_router.dart';
import 'package:movie_app/domain/core/my_app_router/my_app_router_constatnts.dart';

class ConfirmLogOutAlert extends StatelessWidget {
  const ConfirmLogOutAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Log out'),
      content: const Text('Are you sure ?'),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            MyAppRouter.router.pop();
          },
        ),
        TextButton(
            child: const Text('Yes'),
            onPressed: () {
              BlocProvider.of<SettingsBloc>(context)
                  .add(const SettingsEvent.logOut());
              MyAppRouter.router.go(MyAppRouterConstatnts.logInPath);
            })
      ],
    );
  }
}
