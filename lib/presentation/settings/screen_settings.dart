import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/application/settings/settings_bloc.dart';
import 'package:movie_app/core/colors.dart';
import 'package:movie_app/core/constants.dart';
import 'package:movie_app/presentation/edit_profile/edit_profile_bottom_sheet.dart';
import 'package:movie_app/presentation/settings/widgets/confirm_logout.dart';
import 'package:movie_app/presentation/widgets/grey_outlined_button.dart';

class ScreenSettings extends StatelessWidget {
  const ScreenSettings({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _refresh(context);
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        actions: [
          // Log out button
          TextButton(
            onPressed: () {
              showAdaptiveDialog(
                context: context,
                builder: (_) => const ConfirmLogOutAlert(),
              );
            },
            child: const Text('Log out'),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: kPadding10,
          child: BlocBuilder<SettingsBloc, SettingsState>(
            builder: (context, state) {
              return ListView(
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Profile Picture
                          Image.asset(
                            'assets/profile.png',
                            width: 80,
                            height: 80,
                          ),
                          // Name
                          GreyOutlinedButtonWidget(
                            label: state.name,
                            icon: const Icon(Icons.edit_rounded),
                            onPressed: () async {
                              await _editName(context);
                            },
                          )
                        ]),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Allow Explicit Contents'),
                      Switch(
                        inactiveTrackColor: kGreyColor,
                        value: state.isExplicitAllowed,
                        onChanged: (newValue) {
                          BlocProvider.of<SettingsBloc>(context).add(
                              SettingsEvent.saveSettings(
                                  isExplicitAllowed: newValue));
                        },
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void _refresh(BuildContext context) {
    BlocProvider.of<SettingsBloc>(context)
        .add(const SettingsEvent.getSettings());
  }

  Future<void> _editName(BuildContext context) async {
    await showModalBottomSheet<bool>(
      backgroundColor: kBottomSheetBackgroundColor,
      context: context,
      builder: (context) {
        return const EditProfileBottomSheet(mode: ProfileEditMode.edit);
      },
    ).then((isChnaged) {
      if (isChnaged == true) {
        _refresh(context);
      }
    });
  }
}
