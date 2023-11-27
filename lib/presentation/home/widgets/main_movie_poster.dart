import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/application/home/home_bloc.dart';
import 'package:movie_app/core/colors.dart';
import 'package:movie_app/domain/core/functions/image_path.dart';
import 'package:movie_app/presentation/widgets/custom_error.dart';
import 'package:movie_app/presentation/widgets/loading_indicator.dart';
import 'package:movie_app/presentation/widgets/video_action.dart';

class MainMoviePoster extends StatelessWidget {
  const MainMoviePoster({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.7;
    final width = height / 0.47 * 0.325;
    return Center(
        child: SizedBox(
            height: height,
            width: width,
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state.isTopRatedLoading) {
                  return const LoadingIndicatorWidget();
                }
                if (state.isTopRatedError) {
                  return const CustomErrorWidget();
                }
                return Stack(
                  children: [
                    Container(
                      // Show Poster
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                  imagePath(state.topRated[0].posterPath!)),
                              fit: BoxFit.fill)),
                    ),
                    OverflowBox(
                      maxWidth: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text('Action' ' . ' 'Drama' ' . ' 'Classic'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const VideoActionWidget(
                                  icon: Icons.add, title: 'My List'),
                              ElevatedButton.icon(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.play_arrow,
                                  size: 30,
                                ),
                                label: const Text(
                                  'Play',
                                  style: TextStyle(fontSize: 20),
                                ),
                                style: const ButtonStyle(
                                  foregroundColor: MaterialStatePropertyAll(
                                      kButtonColorBlack),
                                  backgroundColor:
                                      MaterialStatePropertyAll(kWhiteColor),
                                ),
                              ),
                              const VideoActionWidget(
                                  icon: Icons.info_outline, title: 'Info')
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                );
              },
            )));
  }
}
