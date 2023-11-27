import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/application/who_is_watching/who_is_watching_bloc.dart';
import 'package:movie_app/core/colors.dart';
import 'package:movie_app/domain/core/di/injectable.dart';
import 'package:movie_app/domain/core/my_app_router/my_app_router_constatnts.dart';
import 'package:movie_app/domain/who_is_watching/models/profile/profile.dart';
import 'package:movie_app/domain/core/my_app_router/my_app_router.dart';
import 'package:movie_app/presentation/edit_profile/edit_profile_bottom_sheet.dart';
import 'package:movie_app/presentation/widgets/grey_outlined_button.dart';
import 'package:movie_app/presentation/widgets/heading_widget.dart';
import 'package:movie_app/presentation/widgets/logo_screen_container.dart';

// Bloc Provider
class ScreenWhoIsWatching extends StatelessWidget {
  const ScreenWhoIsWatching({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => getIt<WhoIsWatchingBloc>(),
      child: const _ScreenWhoIsWatching(),
    );
  }
}

// Screen WhoIsWatching
class _ScreenWhoIsWatching extends StatelessWidget {
  const _ScreenWhoIsWatching();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _refresh(context);
    });

    return LogoScreenContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Heading
          const HeadingWidget(
            title: "Who's watching",
            fontSize: 30,
          ),

          // List of available Profiles
          BlocBuilder<WhoIsWatchingBloc, WhoIsWatchingState>(
            builder: (context, state) {
              return Wrap(
                spacing: 20,
                runSpacing: 15,
                children: _getProfileTiles(state.profiles, context),
              );
            },
          ),

          // Add New profile button
          GreyOutlinedButtonWidget(
            label: 'Add',
            icon: const Icon(Icons.mode_edit_rounded),
            onPressed: () async {
              await _addNewProfile(context);
            },
          ),
        ],
      ),
    );
  }

  // Takes the the list of profiles available, and coverts it into list of profile tile widget.
  _getProfileTiles(List<Profile> profiles, BuildContext context) {
    return profiles
        .map(
          (profile) => GestureDetector(
            // When a profile tile is tapped, should goto homescreen.
            onTap: () {
              BlocProvider.of<WhoIsWatchingBloc>(context)
                  .add(WhoIsWatchingEvent.setProfile(profile));
              // Go to Home
              MyAppRouter.router.go(MyAppRouterConstatnts.homePath);
            },
            // Tile widget
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // profile picture
                Image.asset(
                  'assets/profile.png',
                  width: 80,
                  height: 80,
                ),
                // name
                Text(profile.name),
              ],
            ),
          ),
        )
        .toList();
  }

  _refresh(BuildContext context) {
    BlocProvider.of<WhoIsWatchingBloc>(context)
        .add(const WhoIsWatchingEvent.initial());
  }

  Future<void> _addNewProfile(BuildContext context) async {
    await showModalBottomSheet<bool>(
      backgroundColor: kBottomSheetBackgroundColor,
      context: context,
      builder: (context) {
        return const EditProfileBottomSheet(mode: ProfileEditMode.add);
      },
    ).then((isChanged) {
      if (isChanged == true) {
        _refresh(context);
      }
    });
  }
}
