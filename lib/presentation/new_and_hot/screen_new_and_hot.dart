import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/application/new_and_hot/new_and_hot_bloc.dart';
import 'package:movie_app/core/colors.dart';
import 'package:movie_app/core/constants.dart';
import 'package:movie_app/presentation/new_and_hot/widgets/coming_soon.dart';
import 'package:movie_app/presentation/new_and_hot/widgets/everyones_watching.dart';
import 'package:movie_app/presentation/widgets/app_bar_actions.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<NewAndHotBloc>(context)
          .add(const NewAndHotEvent.getComingSoon());
      BlocProvider.of<NewAndHotBloc>(context)
          .add(const NewAndHotEvent.getEveryonesWatching());
    });

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        primary: MediaQuery.of(context).orientation == Orientation.portrait,
        appBar: AppBar(
          title: const Text('New & Hot'),
          actions: appBarActions,
          bottom: TabBar(
            isScrollable: true,
            labelColor: kBlackColor,
            unselectedLabelColor: kWhiteColor,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            indicator: BoxDecoration(
                color: kWhiteColor, borderRadius: kBorderRadius30),
            tabs: const [
              Tab(text: '🍿 Coming Soon'),
              Tab(text: "👀 Everyone's Watching")
            ],
          ),
        ),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(6),
            child: TabBarView(
              children: [
                ComingSoonWidget(),
                EveryonesWatchingWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
