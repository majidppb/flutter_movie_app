import 'package:flutter/material.dart';
import 'package:movie_app/presentation/core/colors.dart';
import 'package:movie_app/presentation/core/widgets/app_bar_actions.dart';

const double _iconSize = 50;

class HomeScreenAppBarWidget extends StatelessWidget {
  const HomeScreenAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Image.asset(
        'assets/logo.png',
        height: _iconSize,
        width: _iconSize,
      ),
      backgroundColor: kBackgroundColor.withOpacity(0.5),
      // Allows the user to reveal the app bar if they begin scrolling
      // back up the list of items.
      floating: true,
      actions: appBarActions,
      // bottom: const PreferredSize(
      //   preferredSize: Size(double.infinity, 50),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: [
      //       Text('TV Shows'),
      //       Text('Movies'),
      //       Text('Categories ▾'),
      //     ],
      //   ),
      // ),
    );
  }
}
