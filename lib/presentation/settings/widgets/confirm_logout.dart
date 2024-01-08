import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/application/settings/settings_bloc.dart';
import 'package:movie_app/core/routes/router.dart';
import 'package:movie_app/core/routes/routes.dart';

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
            router.pop();
          },
        ),
        TextButton(
            child: const Text('Yes'),
            onPressed: () {
              BlocProvider.of<SettingsBloc>(context)
                  .add(const SettingsEvent.logOut());
              router.go(Routes.logInPath);
            })
      ],
    );
  }
}
