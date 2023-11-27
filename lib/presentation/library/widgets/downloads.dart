import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:movie_app/application/library/library_bloc.dart';
import 'package:movie_app/core/colors.dart';
import 'package:movie_app/core/constants.dart';
import 'package:movie_app/domain/core/functions/image_path.dart';
import 'package:movie_app/presentation/widgets/custom_error.dart';
import 'package:movie_app/presentation/widgets/loading_indicator.dart';

// Downloads Widget as list of items
class DownloadsWidget extends StatelessWidget {
  DownloadsWidget({super.key});
  final _sections = [
    const _ContentSection(),
    const _ButtonsSection(),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (ctx, index) => _sections[index],
        separatorBuilder: (ctx, index) => const SizedBox(height: 30),
        itemCount: _sections.length);
  }
}

// Main Content
class _ContentSection extends StatelessWidget {
  const _ContentSection();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.shortestSide;
    return Column(
      children: [
        const Text(
          'Introducing Downloads for you',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: kWhiteColor, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        kHeight,
        const Text(
          "We'll download a personalized selection of\nmovies and shows for you, so there's\nalways something to watch on your\ndevice.",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        kHeight,
        BlocBuilder<LibraryBloc, LibraryState>(
          builder: (context, state) {
            return SizedBox(
              height: screenWidth * 0.76, // CircularAvatar 2*radiuss
              child: getContent(screenWidth, state),
            );
          },
        ),
      ],
    );
  }

  Widget getContent(double screenWidth, LibraryState state) {
    if (state.isLoading) {
      return const LoadingIndicatorWidget();
    }
    if (state.isError) {
      return const CustomErrorWidget();
    }
    return Stack(alignment: Alignment.center, children: [
      CircleAvatar(
        radius: screenWidth * 0.38,
        backgroundColor: Colors.grey[800],
      ),
      _DownloadsImageWidget(
        image: imagePath(state.downloads[1].posterPath),
        title: state.downloads[1].title,
        margin: const EdgeInsets.only(left: 170, bottom: 30),
        height: screenWidth * 0.5,
        angle: 25,
      ),
      _DownloadsImageWidget(
        image: imagePath(state.downloads[2].posterPath),
        title: state.downloads[2].title,
        margin: const EdgeInsets.only(right: 170, bottom: 30),
        height: screenWidth * 0.5,
        angle: -25,
      ),
      _DownloadsImageWidget(
        image: imagePath(state.downloads[0].posterPath),
        title: state.downloads[0].title,
        margin: const EdgeInsets.only(bottom: 0),
        height: screenWidth * 0.6,
        borderRadius: 10,
      ),
    ]);
  }
}

// Bottom buttons
class _ButtonsSection extends StatelessWidget {
  const _ButtonsSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialButton(
          color: kButtonColorBlue,
          shape: kMButtonBorder,
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.all(10),
            child: SizedBox(
              //width: double.infinity,
              child: Text(
                'Set up',
                textAlign: TextAlign.center,
                style: TextStyle(color: kButtonColorWhite, fontSize: 20),
              ),
            ),
          ),
        ),
        kHeight,
        MaterialButton(
          color: kButtonColorWhite,
          shape: kMButtonBorder,
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'See what you can download',
              style: TextStyle(color: kButtonColorBlack, fontSize: 20),
            ),
          ),
        )
      ],
    );
  }
}

// The Custom Image Widget
class _DownloadsImageWidget extends StatelessWidget {
  const _DownloadsImageWidget({
    required String image,
    required String title,
    required EdgeInsets margin,
    required double height,
    double angle = 0,
    double borderRadius = 9,
  })  : _image = image,
        _title = title,
        _margin = margin,
        _height = height,
        _angle = angle,
        _borderRadius = borderRadius;

  final String _image;
  final String _title;
  final EdgeInsets _margin;
  final double _angle;
  final double _height;
  final double _borderRadius;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _angle * pi / 180,
      child: Container(
        margin: _margin,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(_borderRadius),
          child: CachedNetworkImage(
            imageUrl: _image,
            height: _height,
            //   fit: BoxFit.contain,
            errorWidget: (_, __, ___) => Center(
              child: Text(
                _title,
                style: const TextStyle(
                  color: kGreyColor,
                ),
              ),
            ),
            cacheManager: CacheManager(
              Config(
                'downloads_image',
                stalePeriod: const Duration(days: 1),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
