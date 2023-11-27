import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/application/library/library_bloc.dart';
import 'package:movie_app/core/colors.dart';
import 'package:movie_app/core/constants.dart';
import 'package:movie_app/presentation/library/widgets/downloads.dart';
import 'package:movie_app/presentation/library/widgets/my_list.dart';
import 'package:movie_app/presentation/widgets/app_bar_actions.dart';

class ScreenLibrary extends StatelessWidget {
  const ScreenLibrary({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Get Downloads image
      BlocProvider.of<LibraryBloc>(context)
          .add(const LibraryEvent.getDownloadsImages());
      // Get My List items
      BlocProvider.of<LibraryBloc>(context).add(const LibraryEvent.getMyList());
    });

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        primary: MediaQuery.of(context).orientation == Orientation.portrait,
        appBar: AppBar(
          title: const Text('Library'),
          actions: appBarActions,
          bottom: TabBar(
            labelColor: kBlackColor,
            unselectedLabelColor: kWhiteColor,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            indicator: BoxDecoration(
                color: kWhiteColor, borderRadius: kBorderRadius30),
            tabs: const [
              Tab(
                icon: Icon(Icons.download_for_offline_rounded),
                text: 'Downloads',
              ),
              Tab(
                icon: Icon(Icons.playlist_play_rounded),
                text: 'My List',
              ),
            ],
          ),
        ),
        body: Padding(
          padding: kPadding10,
          child: TabBarView(children: [
            DownloadsWidget(),
            const MyListWidget(),
          ]),
        ),
      ),
    );
  }
}
